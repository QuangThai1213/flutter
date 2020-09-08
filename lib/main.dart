import 'package:cowell/Component/detail_item.dart';
import 'package:cowell/Container/home_screen.dart';
import 'package:cowell/Container/news_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/news': (context) => NewsScreen(),
        '/detail': (context) => DetailPage()
      },
      // home: IntroPageView(),
    );
  }
}
