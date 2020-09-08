class Name {
  Name({this.english, this.japanese, this.chinese, this.french});
  final String english;
  final String japanese;
  final String chinese;
  final String french;
  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      english: json['english'],
      japanese: json['japanese'],
      chinese: json['chinese'],
      french: json['french'],
    );
  }
}
