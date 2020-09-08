class Base {
  final int hp;
  final int attack;
  final int defense;
  // ignore: non_constant_identifier_names
  final int sp_attack;
  // ignore: non_constant_identifier_names
  final int sp_defense;
  final int speed;

  Base(
      {this.hp,
      this.attack,
      this.defense,
      // ignore: non_constant_identifier_names
      this.sp_attack,
      // ignore: non_constant_identifier_names
      this.sp_defense,
      this.speed});

  factory Base.fromJson(Map<String, dynamic> json) {
    return Base(
        hp: json['HP'],
        attack: json['Attack'],
        defense: json['Defense'],
        sp_attack: json['Sp. Attack'],
        sp_defense: json['Sp. Defense'],
        speed: json['Speed']);
  }
}
