import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver {
  double height = 80;
  var _currentOrientation = Orientation.portrait;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    print(MediaQuery.of(context).orientation);
  }

  @override
  Widget build(BuildContext context) {
    Widget _portrait = OverflowBox(
      child: Column(
        children: <Widget>[
          AnimatedContainer(
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.blue,
            duration:Duration(seconds: 1),
          ),
          Container(
              height: MediaQuery.of(context).size.height / 3,
              color: Colors.red),
        ],
      ),
    );

    Widget _landscape = Center(child: FlutterLogo(size: 200));

    Widget _child = _portrait;
    return Scaffold(
      body: OrientationBuilder(builder: (_, orientation) {
        if (orientation == Orientation.portrait)
          _child = _portrait;
        else
          _child = _landscape;

        return AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: _child,
        );
      }),
    );
  }
}
