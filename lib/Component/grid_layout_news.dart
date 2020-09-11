import 'package:cowell/Component/grid_news_item.dart';
import 'package:cowell/Model/operator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridLayoutNews extends StatelessWidget {
  GridLayoutNews(this.lstOperator);

  final columnCount = 3;
  final List<Operator> lstOperator;

  @override
  Widget build(BuildContext context) {
    List<Widget> lstWidget = [];
    lstOperator.asMap().forEach((index, element) {
      lstWidget.add(GridNewsItem(columnCount, index, element));
    });
    return SafeArea(
      child: AnimationLimiter(
        child: GridView.count(
          padding: EdgeInsets.only(top: 40),
          childAspectRatio: 0.7,
          crossAxisCount: columnCount,
          children: lstWidget,
        ),
      ),
    );
  }
}
