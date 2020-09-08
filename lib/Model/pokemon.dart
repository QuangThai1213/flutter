import 'package:cowell/Model/base.dart';

import 'name.dart';

class Pokemon {
  Pokemon({this.id, this.name, this.type,this.base});

  final int id;
  final Name name;
  final List<dynamic> type;
  final Base base;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: Name.fromJson(json['name']),
      type: json['type'],
      base: Base.fromJson(json['base']),
    );
  }
}
