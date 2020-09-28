import 'package:cowell/Component/grid_layout_main.dart';
import 'package:cowell/Container/Home/View/CurrentTimeText.dart';
import 'package:cowell/Container/Home/View/SlideCardsView.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: GridLayout(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 10,
              top: 10,
            ),
            child: CurrentTimeText(),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            child: SlidingCardsView(),
          ),
        ],
      ),
    );
  }
}
