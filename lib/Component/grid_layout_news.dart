import 'package:cowell/Component/grid_news_item.dart';
import 'package:cowell/Model/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridLayoutNews extends StatelessWidget {
  GridLayoutNews(this.lstPokemon);

  final columnCount = 3;
  final List<Pokemon> lstPokemon;
  
  @override
  Widget build(BuildContext context) {
    List<Widget> lstWidget = [];
    lstPokemon.forEach((element) {
      lstWidget.add(GridNewsItem(columnCount, element.id, element));
    });
    return SafeArea(
      child: AnimationLimiter(
        child: GridView.count(
          childAspectRatio: 0.7,
          crossAxisCount: columnCount,
          children: lstWidget,
        ),
      ),
    );
  }
}
