import 'package:cowell/Container/Detail/detail_screen.dart';
import 'package:cowell/Container/home_screen.dart';
import 'package:cowell/Container/GridList/View/news_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:cowell/Model/app_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cowell/observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cowell/app_state_cubit.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

Future main() async {
  await DotEnv().load('.env');
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  Bloc.observer = CounterObserver();
  runApp(MyApp());
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    String assetLoader = "assets/liquidLoader.flr";
    return SplashScreen.navigate(
      name: assetLoader,
      next: (context) => HomeScreen(),
      until: () => Future.delayed(Duration(seconds: 0)),
      startAnimation: '0',
      endAnimation: '4',
      loopAnimation: 'Untitled',
      backgroundColor: Colors.white,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppStateCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<AppStateCubit, AppState>(
          builder: (context, state) {
            return WelcomeScreen();
          },
        ),
        routes: {
          '/loader': (context) => WelcomeScreen(),
          '/homes': (context) => HomeScreen(),
          '/news': (context) => NewsScreen(),
          '/detail': (context) => DetailPage()
        },
      ),
    );
  }
}
