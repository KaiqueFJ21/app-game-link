enum TitleRarity { common, rare, epic, legendary }

class Title {
  final String id;
  final String name; // Ex: "Mestre dos Desafios"
  final String description;
  final TitleRarity rarity;
  final bool active;
  final DateTime unlockedAt;

  Title({
    required this.id,
    required this.name,
    required this.description,
    required this.rarity,
    required this.active,
    required this.unlockedAt,
  });

  String get rarityText {
    switch (rarity) {
      case TitleRarity.common:
        return 'Comum';
      case TitleRarity.rare:
        return 'Raro';
      case TitleRarity.epic:
        return 'Épico';
      case TitleRarity.legendary:
        return 'Lendário';
    }
  }

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      rarity: TitleRarity.values[json['rarity'] ?? 0],
      active: json['active'] ?? false,
      unlockedAt: json['unlockedAt'] != null
          ? DateTime.parse(json['unlockedAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'rarity': rarity.index,
      'active': active,
      'unlockedAt': unlockedAt.toIso8601String(),
    };
  }
}
