import 'package:cowell/Common/app_config.dart';
import 'package:cowell/Connection/magento_connection.dart';
import 'package:cowell/Container/Detail/detail_screen.dart';
import 'package:cowell/Container/Login/login_view.dart';
import 'package:cowell/Container/home_screen.dart';
import 'package:cowell/Container/GridList/View/news_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:cowell/Model/app_state.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cowell/observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cowell/app_state_cubit.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'Model/response.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future main() async {
  await DotEnv().load('.env');
  GlobalConfiguration().loadFromMap(appSettings);
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
    // return WaveWidget(
    //   config: CustomConfig(
    //     gradients: [
    //       [Colors.red, Color(0xEEB4E698)],
    //       // [Colors.red[800], Color(0x77FF7474)],
    //       // [Colors.orange, Color(0x66FF9800)],
    //       // [Colors.yellow, Color(0x55FFEB3B)]
    //     ],
    //     durations: [ 600],
    //     heightPercentages: [0.6],
    //     blur: MaskFilter.blur(BlurStyle.outer,999),
    //     gradientBegin: Alignment.bottomLeft,
    //     gradientEnd: Alignment.topRight,
    //   ),
    //   backgroundColor: Colors.white,
    //   // backgroundImage: DecorationImage(
    //   //   image: NetworkImage(
    //   //     'https://images.unsplash.com/photo-1600107363560-a2a891080c31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=672&q=80',
    //   //   ),
    //   // ),
    //   size: Size(double.infinity, double.infinity),
    //   waveAmplitude: 0,
    // );
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
    getProductData(
      {
        'searchCriteria[filter_groups][0][filters][0][field]': 'category_id',
        'searchCriteria[filter_groups][0][filters][0][value]': 3,
      },
    ).then((value) => {
          value.items.forEach((element) {
            element.attributeSetId
                .then((value) => print(value.attributeSetName));
          })
        });
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
          '/login': (context) => LoginScreen(),
          '/loader': (context) => WelcomeScreen(),
          '/homes': (context) => HomeScreen(),
          '/news': (context) => NewsScreen(),
          '/detail': (context) => DetailPage()
        },
      ),
    );
  }
}
