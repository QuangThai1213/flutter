import 'package:cowell/Component/detail_item.dart';
import 'package:cowell/Container/home_page.dart';
import 'package:cowell/Container/news_page.dart';
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
        '/': (context) => HomePage(),
        '/news': (context) => NewsPage(),
        '/detail': (context) => DetailPage()
      },
      // home: IntroPageView(),
    );
  }
}
