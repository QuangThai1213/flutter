import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cowell/Container/main_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      appBar: AppBar(
        title: Text("Team 3 App"),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            MainScreen(),
            Container(
              color: Colors.red,
              child: Center(
                child: Text("Chưa phát triển"),
              ),
            ),
            Container(
              color: Colors.green,
              child: Center(
                child: Text("Chưa phát triển"),
              ),
            ),
            Container(
              color: Colors.blue,
              child: Center(
                child: Text("Chưa phát triển"),
              ),
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
              title: Text('????'),
              icon: Icon(Icons.apps),
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              title: Text('????'),
              icon: Icon(Icons.chat_bubble),
              inactiveColor: Colors.grey),
          BottomNavyBarItem(
              title: Text('????'),
              icon: Icon(Icons.settings),
              inactiveColor: Colors.grey),
        ],
      ),
    );
  }
}
