import 'package:cowell/Component/summary_detail.dart';
import 'package:cowell/Model/operator.dart';
import 'package:flutter/material.dart';
import 'package:cowell/Component/summary.dart';
import 'package:cowell/Component/separator.dart';

class DetailLayout extends StatelessWidget {
  const DetailLayout(this.operator, this.index);
  final int index;
  final Operator operator;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF736AB7),
        child: Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return Container(
      child: Image.network(
        "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80",
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getGradient() {
    return Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0x00736AB7), Color(0xFF736AB7)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return Container(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          OperatorSummary(
            operator,
            index,
            horizontal: false,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _overviewTitle,
                  style: TextStyle(fontStyle: FontStyle.normal),
                ),
                Separator(),
                SummaryDetail(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
