import 'package:cowell/Component/detail_item.dart';
import 'package:cowell/Component/item_card.dart';
import 'package:cowell/Container/news_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridLayoutNews extends StatelessWidget {
  GridLayoutNews(this.data);
  final columnCount = 3;
  final Album data;
  @override
  Widget build(BuildContext context) {
    print(data.title);
    return SafeArea(
      child: AnimationLimiter(
        child: GridView.count(
          childAspectRatio: 0.75,
          crossAxisCount: columnCount,
          children: List.generate(
            100,
            (int index) {
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
                          child: ItemCard(index, "assets/1.png"),
                          flex: 9,
                        ),
                        Expanded(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/detail',
                                  arguments: DetailPageArgument(index));
                            },
                            child: Text(
                              "title",
                            ),
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
