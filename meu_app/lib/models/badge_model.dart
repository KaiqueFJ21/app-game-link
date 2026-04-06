/// Modelo de Badge/Conquista para GameLink
/// 
/// Define a estrutura de uma conquista ou badge que o usuário pode obter

class BadgeModel {
  /// ID único do badge
  final String id;
  
  /// Nome do badge
  final String name;
  
  /// Descrição do badge
  final String description;
  
  /// Ícone/imagem do badge
  final String icon;
  
  /// Cor do badge (hex)
  final String color;
  
  /// Raridade (common, uncommon, rare, epic, legendary)
  final String rarity;
  
  /// Categoria (achievement, milestone, special)
  final String category;
  
  /// Requisitos para obter
  final String requirements;
  
  /// Pontos de experiência ao obter
  final int experienceReward;
  
  /// Créditos ao obter
  final int creditReward;
  
  /// Se é um badge secreto
  final bool isSecret;
  
  /// Número de usuários que possuem
  final int obtainedCount;

  const BadgeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.rarity,
    required this.category,
    required this.requirements,
    required this.experienceReward,
    required this.creditReward,
    required this.isSecret,
    required this.obtainedCount,
  });

  factory BadgeModel.fromJson(Map<String, dynamic> json) {
    return BadgeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
      color: json['color'] as String,
      rarity: json['rarity'] as String,
      category: json['category'] as String,
      requirements: json['requirements'] as String,
      experienceReward: json['experienceReward'] as int,
      creditReward: json['creditReward'] as int,
      isSecret: json['isSecret'] as bool,
      obtainedCount: json['obtainedCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'icon': icon,
      'color': color,
      'rarity': rarity,
      'category': category,
      'requirements': requirements,
      'experienceReward': experienceReward,
      'creditReward': creditReward,
      'isSecret': isSecret,
      'obtainedCount': obtainedCount,
    };
  }

  BadgeModel copyWith({
    String? id,
    String? name,
    String? description,
    String? icon,
    String? color,
    String? rarity,
    String? category,
    String? requirements,
    int? experienceReward,
    int? creditReward,
    bool? isSecret,
    int? obtainedCount,
  }) {
    return BadgeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      rarity: rarity ?? this.rarity,
      category: category ?? this.category,
      requirements: requirements ?? this.requirements,
      experienceReward: experienceReward ?? this.experienceReward,
      creditReward: creditReward ?? this.creditReward,
      isSecret: isSecret ?? this.isSecret,
      obtainedCount: obtainedCount ?? this.obtainedCount,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BadgeModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'BadgeModel(id: $id, name: $name, rarity: $rarity)';
}

/// Modelo de Badge do Usuário (Badge obtida)
class UserBadge {
  /// ID do badge
  final String badgeId;
  
  /// Nome do badge
  final String name;
  
  /// Descrição do badge
  final String description;
  
  /// Ícone/imagem do badge
  final String icon;
  
  /// Cor do badge
  final String color;
  
  /// Raridade
  final String rarity;
  
  /// Data que foi obtida
  final DateTime obtainedAt;
  
  /// Progresso em direção ao badge (0-100)
  final int progress;
  
  /// Se foi desbloqueada
  final bool isUnlocked;

  const UserBadge({
    required this.badgeId,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.rarity,
    required this.obtainedAt,
    required this.progress,
    required this.isUnlocked,
  });

  factory UserBadge.fromJson(Map<String, dynamic> json) {
    return UserBadge(
      badgeId: json['badgeId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
      color: json['color'] as String,
      rarity: json['rarity'] as String,
      obtainedAt: DateTime.parse(json['obtainedAt'] as String),
      progress: json['progress'] as int,
      isUnlocked: json['isUnlocked'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'badgeId': badgeId,
      'name': name,
      'description': description,
      'icon': icon,
      'color': color,
      'rarity': rarity,
      'obtainedAt': obtainedAt.toIso8601String(),
      'progress': progress,
      'isUnlocked': isUnlocked,
    };
  }

  UserBadge copyWith({
    String? badgeId,
    String? name,
    String? description,
    String? icon,
    String? color,
    String? rarity,
    DateTime? obtainedAt,
    int? progress,
    bool? isUnlocked,
  }) {
    return UserBadge(
      badgeId: badgeId ?? this.badgeId,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      rarity: rarity ?? this.rarity,
      obtainedAt: obtainedAt ?? this.obtainedAt,
      progress: progress ?? this.progress,
      isUnlocked: isUnlocked ?? this.isUnlocked,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserBadge &&
          runtimeType == other.runtimeType &&
          badgeId == other.badgeId;

  @override
  int get hashCode => badgeId.hashCode;

  @override
  String toString() => 'UserBadge(badgeId: $badgeId, name: $name, progress: $progress%)';
}
