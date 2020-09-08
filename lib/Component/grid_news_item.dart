import 'package:cowell/Component/item_card.dart';
import 'package:cowell/Model/pokemon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridNewsItem extends StatelessWidget {
  const GridNewsItem(this.columnCount, this.index, this.pokemon);

  final int columnCount;
  final int index;
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    String imageNumber = index.toString().padLeft(3, "0");
    return AnimationConfiguration.staggeredGrid(
      columnCount: columnCount,
      position: index,
      duration: const Duration(milliseconds: 375),
      child: ScaleAnimation(
        scale: 0.5,
        child: FadeInAnimation(
          child: Column(
            children: [
              Expanded(
                child:
                    ItemCard(index, "assets/images/$imageNumber.png", pokemon),
                flex: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
