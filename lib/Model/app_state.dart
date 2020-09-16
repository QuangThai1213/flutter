class AppState {
  AppState({this.isLogin});
  bool isLogin;
  factory AppState.fromJson(Map<String, dynamic> json) {
    return AppState(isLogin: json['isLogin']);
  }
}
