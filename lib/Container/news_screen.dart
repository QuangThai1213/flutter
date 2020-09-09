import 'dart:async';
import 'dart:convert';
import 'package:cowell/Component/grid_layout_news.dart';
import 'package:cowell/Component/search.dart';
import 'package:cowell/Model/operator.dart';
import 'package:cowell/Model/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

Future<List<Pokemon>> fetchPokemon() async {
  String response = await rootBundle.loadString("assets/data/pokedex.json");
  List responseJson = json.decode(response);
  return responseJson.map((m) => new Pokemon.fromJson(m)).toList();
}

Future<void> printData() async {
  List<Operator> lstOperator = [];
  final response =
      await rootBundle.loadString("assets/excel/character_table.json");
  final decoded = jsonDecode(response) as Map;
  for (final operatorData in decoded.values) {
    lstOperator.add(new Operator.fromJson(operatorData));
  }
  lstOperator.forEach((element) {
    print(element.name);
  });
}

class _NewsScreenState extends State<NewsScreen> {
  Future<List<Pokemon>> futurePokemon;
  List<String> lstPokemonName = [];
  List<Pokemon> lstPokemonInit = [];
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
    data.addAll(lstPokemonInit.where((element) =>
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

    printData();

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
              lstPokemonInit = snapshot.data;
              lstPokemonSearch = lstPokemonInit;
              isFetched = true;
            }
            if (lstPokemonSearch.isNotEmpty) {
              return GridLayoutNews(lstPokemonSearch);
            } else {
              return Text("Nothing Here !");
            }
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner.
          return Center(child: SpinKitPouringHourglass(color: Colors.blue));
        },
      ),
    );
  }
}
