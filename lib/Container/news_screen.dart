import 'dart:async';
import 'dart:convert';
import 'package:cowell/Component/grid_layout_news.dart';
import 'package:cowell/Component/search.dart';
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
  List<String> lstPokemonName = [];
  List<Pokemon> lstPokemon = [];
  List<Pokemon> lstPokemonSearch = [];
  String title = "News";
  bool isFetched = false;
  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemon();
  }

  changeStatusTitle(String newTitle) {
    setState(() {
      title = newTitle;
    });
  }

  addRecentSearch(String recent) {
    lstPokemonName.removeWhere((item) => item == recent);
    lstPokemonName.insert(0, recent);
  }

  changeListData(String dataReturn) {
    List<Pokemon> data = [];
    data.addAll(lstPokemon.where((element) =>
        element.name.english.toLowerCase().contains(dataReturn.toLowerCase())));
    setState(() {
      lstPokemonSearch = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    waitForShowSearch() async {
      final result =
          await showSearch(context: context, delegate: Search(lstPokemonName));
      if (result != "") {
        // changeStatusTitle(result);
        addRecentSearch(result);
        changeListData(result);
      }
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // isFetched = false;
                waitForShowSearch();
              })
        ],
        title: Text(title),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: futurePokemon,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            lstPokemonName.addAll(snapshot.data.map((e) => e.name.english));
            if (!isFetched) {
              lstPokemon = snapshot.data;
              lstPokemonSearch = lstPokemon;
              isFetched = true;
            }
            if (lstPokemon.isNotEmpty) {
              return GridLayoutNews(lstPokemonSearch);
            } else {
              return Text("Nothing Here !");
            }
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
