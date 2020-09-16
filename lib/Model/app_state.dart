import 'package:cowell/Model/user.dart';

class AppState {
  AppState({this.isLogin});
  bool isLogin;
  User user;
  factory AppState.fromJson(Map<String, dynamic> json) {
    return AppState(isLogin: json['isLogin']);
  }
}
