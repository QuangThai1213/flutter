class Operator {
  Operator();
  final String name;
  final String description;
  final bool canUseGeneralPotentialItem;
  final String potentialItemId;
  final int team;
  final String displayNumber;
  final String tokenKey;
  final String appellation;
  final String position;
  final List<String> tagList;
  final String displayLogo;
  final String itemUsage;
  final String itemDesc;
  final String itemObtainApproach;
  final int maxPotentialLevel;
  final int rarity;
  final String profession;
  final Trait trait;
  final List<Phases> phases;
  final List<Skills> skills;
  final List<Talents> talents;
  final List<PotentialRank> potentialRank;

  factory Operator.fromJson(Map<String, dynamic> json) {
    return Operator(
      name: json['name'],
      description: json['description'],
    );
  }
}

class Trait {
  Trait({this.candidates});
  final List<Candidates> candidates;
  factory Trait.fromJson(Map<String, dynamic> json) {
    return Trait(
      candidates: json['candidates'],
    );
  }
}
