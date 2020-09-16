import 'dart:async';
import 'dart:convert';
import 'package:cowell/Component/grid_layout_news.dart';
import 'package:cowell/Component/search.dart';
import 'package:cowell/Model/operator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cowell/Container/GridList/Cubit/grid_list_cubit.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

Future<List<Operator>> fetchOperator() async {
  List<Operator> lstOperator = [];
  final response =
      await rootBundle.loadString("assets/excel/character_table.json");
  final decoded = jsonDecode(response) as Map;
  for (final operatorData in decoded.values) {
    lstOperator.add(new Operator.fromJson(operatorData));
  }
  lstOperator.shuffle();
  return lstOperator;
}

class _NewsScreenState extends State<NewsScreen> {
  Future<List<Operator>> futureOperator;
  List<String> lstOperatorName = [];
  List<Operator> lstOperatorInit = [];
  List<Operator> lstOperatorSearch = [];
  String title = "List Data";
  bool isFetched = false;
  @override
  void initState() {
    super.initState();
    futureOperator = fetchOperator();
  }

  changeStatusTitle(String newTitle) {
    setState(() {
      title = newTitle;
    });
  }

  addRecentSearch(String recent) {
    lstOperatorName.removeWhere((item) => item == recent);
    lstOperatorName.insert(0, recent);
  }

  changeListData(String dataReturn) {
    List<Operator> data = [];
    data.addAll(lstOperatorInit.where((element) =>
        element.name.toLowerCase().contains(dataReturn.toLowerCase())));
    setState(() {
      lstOperatorSearch = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    waitForShowSearch(recent) async {
      if (recent != "") {
        addRecentSearch(recent);
      }
      final result =
          await showSearch(context: context, delegate: Search(lstOperatorName));
      if (result != "") {
        // changeStatusTitle(result);
        changeListData(result);
      }
      return result;
    }

    return BlocProvider(
      create: (_) => RecentSearchCubit(),
      child: BlocBuilder<RecentSearchCubit, String>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      // isFetched = false;
                      String result = await waitForShowSearch(state);
                      context.bloc<RecentSearchCubit>().getRecent(result);
                    }),
              ],
              title: Text(title),
              centerTitle: true,
            ),
            body: FutureBuilder<List<Operator>>(
              future: futureOperator,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  snapshot.data.removeWhere((element) =>
                      (element.profession == 'TOKEN') ||
                      (element.profession == 'TRAP'));
                  lstOperatorName.addAll(snapshot.data.map((e) => e.name));
                  if (!isFetched) {
                    lstOperatorInit = snapshot.data;
                    lstOperatorSearch = lstOperatorInit;
                    isFetched = true;
                  }
                  if (lstOperatorSearch.isNotEmpty) {
                    return GridLayoutNews(lstOperatorSearch);
                  } else {
                    return Text("Nothing Here !");
                  }
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return Center(
                    child: SpinKitPouringHourglass(color: Colors.blue));
              },
            ),
          );
        },
      ),
    );
  }
}
