import 'package:cowell/Component/item_card.dart';
import 'package:cowell/Model/operator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridNewsItem extends StatelessWidget {
  const GridNewsItem(this.columnCount, this.index, this.operator);

  final int columnCount;
  final int index;
  final Operator operator;
  @override
  Widget build(BuildContext context) {
    String image = operator.phases.last.characterPrefabKey+"_1";
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
                child: ItemCard(
                    index, "assets/img/portraits/$image.png", operator),
                flex: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
