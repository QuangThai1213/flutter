class User {
  User({this.name});
  String name;
  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name']);
  }
}
