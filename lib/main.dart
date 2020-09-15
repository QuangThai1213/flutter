import 'package:cowell/Container/Detail/detail_screen.dart';
import 'package:cowell/Container/home_screen.dart';
import 'package:cowell/Container/GridList/View/news_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cowell/observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cowell/app_state_cubit.dart';

void main() async {
  // runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  Bloc.observer = CounterObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppState(),
      child: MaterialApp(
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
      ),
    );
  }
}
