import 'package:cowell/Model/operator.dart';
import 'package:flutter/material.dart';
import 'package:cowell/Component/detail_layout.dart';

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
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail"),
          centerTitle: true,
        ),
        body: DetailLayout(args.pokemon, args.index),
      ),
    );
  }
}
