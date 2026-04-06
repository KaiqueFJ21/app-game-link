/// Modelo de Clã para GameLink
/// 
/// Define a estrutura de um clã (guilda/time) no jogo

class ClanModel {
  /// ID único do clã
  final String id;
  
  /// Nome do clã
  final String name;
  
  /// Descrição do clã
  final String description;
  
  /// Logo/Avatar do clã
  final String logo;
  
  /// ID do líder do clã
  final String leaderId;
  
  /// Nome do líder
  final String leaderName;
  
  /// Número de membros
  final int memberCount;
  
  /// Membros do clã
  final List<ClanMember> members;
  
  /// Nível do clã
  final int level;
  
  /// Experiência do clã
  final int experience;
  
  /// Pontos de ranking
  final int rankingPoints;
  
  /// Data de criação
  final DateTime createdAt;
  
  /// Se o clã está ativo
  final bool isActive;
  
  /// Requisitos para entrar (nível mínimo)
  final int minLevel;
  
  /// Descrição dos requisitos
  final String requirements;

  const ClanModel({
    required this.id,
    required this.name,
    required this.description,
    required this.logo,
    required this.leaderId,
    required this.leaderName,
    required this.memberCount,
    required this.members,
    required this.level,
    required this.experience,
    required this.rankingPoints,
    required this.createdAt,
    required this.isActive,
    required this.minLevel,
    required this.requirements,
  });

  factory ClanModel.fromJson(Map<String, dynamic> json) {
    return ClanModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      logo: json['logo'] as String,
      leaderId: json['leaderId'] as String,
      leaderName: json['leaderName'] as String,
      memberCount: json['memberCount'] as int,
      members: (json['members'] as List<dynamic>?)
              ?.map((m) => ClanMember.fromJson(m as Map<String, dynamic>))
              .toList() ??
          [],
      level: json['level'] as int,
      experience: json['experience'] as int,
      rankingPoints: json['rankingPoints'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isActive: json['isActive'] as bool,
      minLevel: json['minLevel'] as int,
      requirements: json['requirements'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'logo': logo,
      'leaderId': leaderId,
      'leaderName': leaderName,
      'memberCount': memberCount,
      'members': members.map((m) => m.toJson()).toList(),
      'level': level,
      'experience': experience,
      'rankingPoints': rankingPoints,
      'createdAt': createdAt.toIso8601String(),
      'isActive': isActive,
      'minLevel': minLevel,
      'requirements': requirements,
    };
  }

  ClanModel copyWith({
    String? id,
    String? name,
    String? description,
    String? logo,
    String? leaderId,
    String? leaderName,
    int? memberCount,
    List<ClanMember>? members,
    int? level,
    int? experience,
    int? rankingPoints,
    DateTime? createdAt,
    bool? isActive,
    int? minLevel,
    String? requirements,
  }) {
    return ClanModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      logo: logo ?? this.logo,
      leaderId: leaderId ?? this.leaderId,
      leaderName: leaderName ?? this.leaderName,
      memberCount: memberCount ?? this.memberCount,
      members: members ?? this.members,
      level: level ?? this.level,
      experience: experience ?? this.experience,
      rankingPoints: rankingPoints ?? this.rankingPoints,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
      minLevel: minLevel ?? this.minLevel,
      requirements: requirements ?? this.requirements,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClanModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'ClanModel(id: $id, name: $name, members: $memberCount)';
}

/// Modelo de Membro do Clã
class ClanMember {
  /// ID único do membro
  final String id;
  
  /// Nome do membro
  final String name;
  
  /// Avatar do membro
  final String avatar;
  
  /// Cargo no clã (leader, officer, member)
  final String role;
  
  /// Nível do membro
  final int level;
  
  /// Contribuição do membro (experiência)
  final int contribution;
  
  /// Data de entrada no clã
  final DateTime joinedAt;
  
  /// Se está online
  final bool isOnline;
  
  /// Jogo principal
  final String mainGame;

  const ClanMember({
    required this.id,
    required this.name,
    required this.avatar,
    required this.role,
    required this.level,
    required this.contribution,
    required this.joinedAt,
    required this.isOnline,
    required this.mainGame,
  });

  factory ClanMember.fromJson(Map<String, dynamic> json) {
    return ClanMember(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      role: json['role'] as String,
      level: json['level'] as int,
      contribution: json['contribution'] as int,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      isOnline: json['isOnline'] as bool,
      mainGame: json['mainGame'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'role': role,
      'level': level,
      'contribution': contribution,
      'joinedAt': joinedAt.toIso8601String(),
      'isOnline': isOnline,
      'mainGame': mainGame,
    };
  }

  ClanMember copyWith({
    String? id,
    String? name,
    String? avatar,
    String? role,
    int? level,
    int? contribution,
    DateTime? joinedAt,
    bool? isOnline,
    String? mainGame,
  }) {
    return ClanMember(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      role: role ?? this.role,
      level: level ?? this.level,
      contribution: contribution ?? this.contribution,
      joinedAt: joinedAt ?? this.joinedAt,
      isOnline: isOnline ?? this.isOnline,
      mainGame: mainGame ?? this.mainGame,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClanMember &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'ClanMember(id: $id, name: $name, role: $role)';
}
