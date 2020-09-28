import 'package:cowell/Container/Setting/View/account_section.dart';
import 'package:cowell/Model/app_state.dart';
import 'package:cowell/app_state_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() {
    return _SettingScreenState();
  }
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateCubit, AppState>(
      builder: (context, state) {
        return Column(
          children: [
            AccountSection(),
          ],
        );
      },
    );
  }
}
