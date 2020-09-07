import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cowell/Container/main_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Team 3 App")),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            MainPage(),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              title: Text('Item One'),
              icon: Icon(Icons.apps),
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              title: Text('Item One'),
              icon: Icon(Icons.chat_bubble),
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              title: Text('Item One'),
              icon: Icon(Icons.settings),
              inactiveColor: Colors.grey),
        ],
      ),
    );
  }
}
