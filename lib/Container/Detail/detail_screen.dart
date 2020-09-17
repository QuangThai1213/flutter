import 'package:cowell/Model/operator.dart';
import 'package:flutter/material.dart';
import 'package:cowell/Component/detail_layout.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class DetailPageArgument {
  const DetailPageArgument(this.pokemon, this.index);
  final Operator pokemon;
  final int index;
}

class DetailPage extends StatelessWidget {
  const DetailPage();

  @override
  Widget build(BuildContext context) {
    final DetailPageArgument args = ModalRoute.of(context).settings.arguments;
    Future _handleRefresh() {
      return Future.delayed(
        Duration(seconds: 2),
        () => print("refreshed"),
      );
    }

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail"),
          centerTitle: true,
        ),
        body: LiquidPullToRefresh(
          springAnimationDurationInMilliseconds: 500,
          animSpeedFactor: 2.0,
          showChildOpacityTransition: true,
          onRefresh: _handleRefresh, // refresh callback
          child: DetailLayout(args.pokemon, args.index), // scroll view
        ),
      ),
    );
  }
}
