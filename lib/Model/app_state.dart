import 'package:cowell/Model/user.dart';

class AppState {
  AppState({this.isLogin, this.isLoading});
  bool isLogin;
  User user;
  bool isLoading;
  factory AppState.fromJson(Map<String, dynamic> json) {
    return AppState(isLogin: json['isLogin']);
  }
}
