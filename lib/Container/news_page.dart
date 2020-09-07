import 'package:cowell/Component/empty_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    final int columnCount = 3;
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: SafeArea(
        child: AnimationLimiter(
          child: GridView.count(
            childAspectRatio: 1.0,
            padding: const EdgeInsets.all(8.0),
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
                      child: EmptyCard(index, 50, 50),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
