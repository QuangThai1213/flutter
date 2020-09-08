import 'name.dart';

class Pokemon {
  Pokemon({this.id, this.name, this.type});

  final int id;
  final Name name;
  final List<dynamic> type;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: Name.fromJson(json['name']),
      type: json['type'],
    );
  }
}
