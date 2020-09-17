import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cowell/Container/Counter/index.dart';
import 'package:cowell/Container/Detail/About/about.dart';
import 'package:cowell/Container/Home/main_screen.dart';
import 'package:cowell/Model/app_state.dart';
import 'package:cowell/Model/user.dart';
import 'package:cowell/app_state_cubit.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
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
    return BlocBuilder<AppStateCubit, AppState>(
      builder: (context, state) {
        context.bloc<AppStateCubit>().login();
        User user = context.bloc<AppStateCubit>().state.user;
        if (user != null) {
          print(user.name);
        }
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
                CounterPage(),
                EmptyListWidget(
                    title: 'Nothing Here',
                    subTitle: 'Nothing available yet',
                    image: 'assets/images/im_emptyIcon_2.png',
                    titleTextStyle: Theme.of(context)
                        .typography
                        .dense
                        .headline3
                        .copyWith(color: Color(0xff9da9c7)),
                    subtitleTextStyle: Theme.of(context)
                        .typography
                        .dense
                        .bodyText2
                        .copyWith(color: Color(0xffabb8d6))),
                PokemonDetailPage(name: "Thai",)
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
                  title: Text('Counter'),
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
      },
    );
  }
}
