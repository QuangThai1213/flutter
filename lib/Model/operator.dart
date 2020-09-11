class Operator {
  Operator({
    this.name,
    this.description,
    this.canUseGeneralPotentialItem,
    this.potentialItemId,
    this.team,
    this.displayNumber,
    this.tokenKey,
    this.appellation,
    this.position,
    this.tagList,
    this.displayLogo,
    this.itemUsage,
    this.itemDesc,
    this.itemObtainApproach,
    this.maxPotentialLevel,
    this.rarity,
    this.profession,
    this.trait,
    this.phases,
    this.skills,
    this.talents,
    this.potentialRanks,
  });
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
  final List<PotentialRanks> potentialRanks;

  factory Operator.fromJson(Map<String, dynamic> json) {
    var tagList = [];
    var trait;
    var jsonPhases = json['phases'] as List;
    var jsonSkills = json['skills'] as List;
    var jsonTalents = json['talents'] as List;
    var jsonPotentialRanks = json['potentialRanks'] as List;
    if (json['tagList'] == null) {
      tagList = [];
    } else {
      tagList = json['tagList'];
    }
    if (json['trait'] != null) {
      trait = Trait.fromJson(json['trait']);
    }

    List<Skills> lstSkills = jsonSkills.map((e) => Skills.fromJson(e)).toList();
    List<Talents> lstTalents = [];
    if (jsonTalents != null) {
      lstTalents = jsonTalents.map((e) => Talents.fromJson(e)).toList();
    }
    List<PotentialRanks> lstPotentialRanks =
        jsonPotentialRanks.map((e) => PotentialRanks.fromJson(e)).toList();
    List<Phases> lstPhases = jsonPhases.map((e) => Phases.fromJson(e)).toList();
    return Operator(
      name: json['name'],
      description: json['description'],
      canUseGeneralPotentialItem: json['canUseGeneralPotentialItem'],
      potentialItemId: json['potentialItemId'],
      team: json['team'],
      displayNumber: json['displayNumber'],
      tokenKey: json['tokenKey'],
      appellation: json['appellation'],
      position: json['position'],
      tagList: tagList.cast<String>(),
      displayLogo: json['displayLogo'],
      itemUsage: json['itemUsage'],
      itemDesc: json['itemDesc'],
      itemObtainApproach: json['itemObtainApproach'],
      maxPotentialLevel: json['maxPotentialLevel'],
      rarity: json['rarity'],
      profession: json['profession'],
      phases: lstPhases,
      trait: trait,
      skills: lstSkills,
      talents: lstTalents,
      potentialRanks: lstPotentialRanks,
    );
  }
}

class PotentialRanks {
  PotentialRanks({this.type, this.description, this.equivalentCost});
  final int type;
  final String description;
  final String equivalentCost;

  factory PotentialRanks.fromJson(Map<String, dynamic> json) {
    return PotentialRanks(
      type: json['type'],
      description: json['description'],
      equivalentCost: json['equivalentCost'],
    );
  }
}

class Talents {
  Talents({this.candidates});
  final List<CandidatesTalents> candidates;
  factory Talents.fromJson(Map<String, dynamic> json) {
    var jsonCandidates = json['candidates'] as List;
    List<CandidatesTalents> lstCandidates = [];
    if (jsonCandidates != null) {
      lstCandidates =
          jsonCandidates.map((e) => CandidatesTalents.fromJson(e)).toList();
    }
    return Talents(
      candidates: lstCandidates,
    );
  }
}

class CandidatesTalents {
  CandidatesTalents({
    this.unlockCondition,
    this.requiredPotentialRank,
    this.blackboard,
    this.descripton,
    this.prefabKey,
    this.rangeId,
    this.name,
  });
  final Condition unlockCondition;
  final int requiredPotentialRank;
  final List<KeyValue> blackboard;
  final String descripton;
  final String prefabKey;
  final String rangeId;
  final String name;
  factory CandidatesTalents.fromJson(Map<String, dynamic> json) {
    var jsonBlackboard = json['blackboard'] as List;
    List<KeyValue> lstBlackboard =
        jsonBlackboard.map((e) => KeyValue.fromJson(e)).toList();
    return CandidatesTalents(
      unlockCondition: Condition.fromJson(json['unlockCondition']),
      requiredPotentialRank: json['requiredPotentialRank'],
      blackboard: lstBlackboard,
      descripton: json['descripton'],
      prefabKey: json['prefabKey'],
      rangeId: json['rangeId'],
      name: json['name'],
    );
  }
}

class Skills {
  Skills(
      {this.skillId,
      this.overridePrefabKey,
      this.overrideTokenKey,
      this.levelUpCostCond,
      this.unlockCond});
  final String skillId;
  final String overridePrefabKey;
  final String overrideTokenKey;
  final List<LevelUpCostCond> levelUpCostCond;
  final Condition unlockCond;
  factory Skills.fromJson(Map<String, dynamic> json) {
    var jsonLevelUpCostCond = json['levelUpCostCond'] as List;
    List<LevelUpCostCond> lstLevelUpCostCond =
        jsonLevelUpCostCond.map((e) => LevelUpCostCond.fromJson(e)).toList();
    return Skills(
      skillId: json['skillId'],
      overridePrefabKey: json['overridePrefabKey'],
      overrideTokenKey: json['overrideTokenKey'],
      levelUpCostCond: lstLevelUpCostCond,
      unlockCond: Condition.fromJson(json['unlockCond']),
    );
  }
}

class LevelUpCostCond {
  LevelUpCostCond({this.unlockCond, this.lvlUpTime, this.levelUpCost});
  final Condition unlockCond;
  final int lvlUpTime;
  final List<Material> levelUpCost;
  factory LevelUpCostCond.fromJson(Map<String, dynamic> json) {
    var jsonLevelUpCost = json['candidates'] as List;
    List<Material> lstLevelUpCost = [];
    if (jsonLevelUpCost != null) {
      lstLevelUpCost =
          jsonLevelUpCost.map((e) => Material.fromJson(e)).toList();
    }

    return LevelUpCostCond(
      unlockCond: Condition.fromJson(json['unlockCond']),
      lvlUpTime: json['lvlUpTime'],
      levelUpCost: lstLevelUpCost,
    );
  }
}

class Trait {
  Trait({this.candidates});
  final List<CandidatesTrait> candidates;
  factory Trait.fromJson(Map<String, dynamic> json) {
    var jsonCandidates = json['candidates'] as List;
    List<CandidatesTrait> lstCandidates =
        jsonCandidates.map((e) => CandidatesTrait.fromJson(e)).toList();
    return Trait(
      candidates: lstCandidates,
    );
  }
}

class KeyValue {
  KeyValue({this.key, this.value});
  final String key;
  final double value;
  factory KeyValue.fromJson(Map<String, dynamic> json) {
    return KeyValue(
      key: json['key'],
      value: json['value'],
    );
  }
}

class Condition {
  Condition({this.phase, this.level});
  final int phase;
  final int level;
  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      phase: json['phase'],
      level: json['level'],
    );
  }
}

class CandidatesTrait {
  CandidatesTrait(
      {this.unlockCondition,
      this.requiredPotentialRank,
      this.blackboard,
      this.overrideDescripton,
      this.prefabKey,
      this.rangeId});
  final Condition unlockCondition;
  final int requiredPotentialRank;
  final List<KeyValue> blackboard;
  final String overrideDescripton;
  final String prefabKey;
  final String rangeId;
  factory CandidatesTrait.fromJson(Map<String, dynamic> json) {
    var jsonBlackboard = json['blackboard'] as List;
    List<KeyValue> lstBlackboard =
        jsonBlackboard.map((e) => KeyValue.fromJson(e)).toList();
    return CandidatesTrait(
      unlockCondition: Condition.fromJson(json['unlockCondition']),
      requiredPotentialRank: json['requiredPotentialRank'],
      blackboard: lstBlackboard,
      overrideDescripton: json['overrideDescripton'],
      prefabKey: json['prefabKey'],
      rangeId: json['rangeId'],
    );
  }
}

class Phases {
  Phases(
      {this.characterPrefabKey,
      this.rangeId,
      this.maxLevel,
      this.attributesKeyFrames,
      this.evolveCost});
  final String characterPrefabKey;
  final String rangeId;
  final int maxLevel;
  final List<AttributesKeyFrames> attributesKeyFrames;
  final List<Material> evolveCost;

  factory Phases.fromJson(Map<String, dynamic> json) {
    var jsonAttributesKeyFrames = json['attributesKeyFrames'] as List;
    var jsonMaterial = json['evolveCost'] as List;
    List<AttributesKeyFrames> lstAttributesKeyFrames =
        jsonAttributesKeyFrames.map((e) => AttributesKeyFrames.fromJson(e)).toList();
    List<Material> lstMaterial = [];
    if (jsonMaterial != null) {
      lstMaterial = jsonMaterial.map((e) => Material.fromJson(e)).toList();
    }

    return Phases(
      characterPrefabKey: json['characterPrefabKey'],
      rangeId: json['rangeId'],
      maxLevel: json['maxLevel'],
      attributesKeyFrames: lstAttributesKeyFrames,
      evolveCost: lstMaterial,
    );
  }
}

class Material {
  Material({this.id, this.count, this.type});
  final String id;
  final int count;
  final String type;
  factory Material.fromJson(Map<String, dynamic> json) {
    return Material(
      id: json['id'],
      count: json['count'],
      type: json['type'],
    );
  }
}

class AttributesKeyFrames {
  AttributesKeyFrames({this.level, this.data});
  final int level;
  final Data data;
  factory AttributesKeyFrames.fromJson(Map<String, dynamic> json) {
    return AttributesKeyFrames(
      level: json['level'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  Data(
      {this.maxHp,
      this.atk,
      this.def,
      this.magicResistance,
      this.cost,
      this.blockCnt,
      this.moveSpeed,
      this.attackSpeed,
      this.baseAttackTime,
      this.respawnTime,
      this.hpRecoveryPerSec,
      this.spRecoveryPerSec,
      this.maxDeployCount,
      this.maxDeckStackCnt,
      this.tauntLevel,
      this.massLevel,
      this.baseForceLevel,
      this.stunImmune,
      this.silenceImmune,
      this.sleepImmune});
  final int maxHp;
  final int atk;
  final int def;
  final double magicResistance;
  final int cost;
  final int blockCnt;
  final double moveSpeed;
  final double attackSpeed;
  final double baseAttackTime;
  final int respawnTime;
  final double hpRecoveryPerSec;
  final double spRecoveryPerSec;
  final int maxDeployCount;
  final int maxDeckStackCnt;
  final int tauntLevel;
  final int massLevel;
  final int baseForceLevel;
  final bool stunImmune;
  final bool silenceImmune;
  final bool sleepImmune;
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      maxHp: json['maxHp'],
      atk: json['atk'],
      def: json['def'],
      magicResistance: json['magicResistance'],
      cost: json['cost'],
      blockCnt: json['blockCnt'],
      moveSpeed: json['moveSpeed'],
      attackSpeed: json['attackSpeed'],
      baseAttackTime: json['baseAttackTime'],
      respawnTime: json['respawnTime'],
      hpRecoveryPerSec: json['hpRecoveryPerSec'],
      spRecoveryPerSec: json['spRecoveryPerSec'],
      maxDeployCount: json['maxDeployCount'],
      maxDeckStackCnt: json['maxDeckStackCnt'],
      tauntLevel: json['tauntLevel'],
      massLevel: json['massLevel'],
      baseForceLevel: json['baseForceLevel'],
      stunImmune: json['stunImmune'],
      silenceImmune: json['silenceImmune'],
      sleepImmune: json['sleepImmune'],
    );
  }
}
