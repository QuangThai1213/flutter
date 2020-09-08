import 'dart:async';
import 'dart:convert';
import 'package:cowell/Component/grid_layout_news.dart';
import 'package:cowell/Model/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

Future<List<Pokemon>> fetchPokemon() async {
  String response = await rootBundle.loadString("assets/data/pokedex.json");
  List responseJson = json.decode(response);
  return responseJson.map((m) => new Pokemon.fromJson(m)).toList();
}

class _NewsScreenState extends State<NewsScreen> {
  Future<List<Pokemon>> futurePokemon;
  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: FutureBuilder<List<Pokemon>>(
        future: futurePokemon,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridLayoutNews(snapshot.data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner.
          return new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }
}
