/// Modelo de Desafio para GameLink
/// 
/// Define a estrutura de um desafio competitivo

class ChallengeModel {
  /// ID único do desafio
  final String id;
  
  /// Título do desafio
  final String title;
  
  /// Descrição detalhada
  final String description;
  
  /// Jogo relacionado
  final String game;
  
  /// Tipo de desafio (1v1, team, tournament)
  final String type;
  
  /// Status (active, completed, cancelled)
  final String status;
  
  /// Recompensa em créditos
  final int reward;
  
  /// Recompensa em experiência
  final int experienceReward;
  
  /// ID do criador
  final String creatorId;
  
  /// Nome do criador
  final String creatorName;
  
  /// Participantes
  final List<ChallengeParticipant> participants;
  
  /// Número máximo de participantes
  final int maxParticipants;
  
  /// Data de início
  final DateTime startDate;
  
  /// Data de término
  final DateTime endDate;
  
  /// Nível mínimo requerido
  final int minLevel;
  
  /// Dificuldade (easy, medium, hard, extreme)
  final String difficulty;
  
  /// Descrição dos requisitos
  final String requirements;
  
  /// Regras do desafio
  final String rules;

  const ChallengeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.game,
    required this.type,
    required this.status,
    required this.reward,
    required this.experienceReward,
    required this.creatorId,
    required this.creatorName,
    required this.participants,
    required this.maxParticipants,
    required this.startDate,
    required this.endDate,
    required this.minLevel,
    required this.difficulty,
    required this.requirements,
    required this.rules,
  });

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      game: json['game'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      reward: json['reward'] as int,
      experienceReward: json['experienceReward'] as int,
      creatorId: json['creatorId'] as String,
      creatorName: json['creatorName'] as String,
      participants: (json['participants'] as List<dynamic>?)
              ?.map((p) => ChallengeParticipant.fromJson(p as Map<String, dynamic>))
              .toList() ??
          [],
      maxParticipants: json['maxParticipants'] as int,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      minLevel: json['minLevel'] as int,
      difficulty: json['difficulty'] as String,
      requirements: json['requirements'] as String,
      rules: json['rules'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'game': game,
      'type': type,
      'status': status,
      'reward': reward,
      'experienceReward': experienceReward,
      'creatorId': creatorId,
      'creatorName': creatorName,
      'participants': participants.map((p) => p.toJson()).toList(),
      'maxParticipants': maxParticipants,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'minLevel': minLevel,
      'difficulty': difficulty,
      'requirements': requirements,
      'rules': rules,
    };
  }

  ChallengeModel copyWith({
    String? id,
    String? title,
    String? description,
    String? game,
    String? type,
    String? status,
    int? reward,
    int? experienceReward,
    String? creatorId,
    String? creatorName,
    List<ChallengeParticipant>? participants,
    int? maxParticipants,
    DateTime? startDate,
    DateTime? endDate,
    int? minLevel,
    String? difficulty,
    String? requirements,
    String? rules,
  }) {
    return ChallengeModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      game: game ?? this.game,
      type: type ?? this.type,
      status: status ?? this.status,
      reward: reward ?? this.reward,
      experienceReward: experienceReward ?? this.experienceReward,
      creatorId: creatorId ?? this.creatorId,
      creatorName: creatorName ?? this.creatorName,
      participants: participants ?? this.participants,
      maxParticipants: maxParticipants ?? this.maxParticipants,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      minLevel: minLevel ?? this.minLevel,
      difficulty: difficulty ?? this.difficulty,
      requirements: requirements ?? this.requirements,
      rules: rules ?? this.rules,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChallengeModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'ChallengeModel(id: $id, title: $title, game: $game)';
}

/// Modelo de Participante do Desafio
class ChallengeParticipant {
  /// ID do participante
  final String userId;
  
  /// Nome do participante
  final String name;
  
  /// Avatar do participante
  final String avatar;
  
  /// Pontuação no desafio
  final int score;
  
  /// Posição no ranking
  final int position;
  
  /// Status (pending, active, completed, disqualified)
  final String status;
  
  /// Data de entrada
  final DateTime joinedAt;
  
  /// Estatísticas do desafio
  final Map<String, dynamic> stats;

  const ChallengeParticipant({
    required this.userId,
    required this.name,
    required this.avatar,
    required this.score,
    required this.position,
    required this.status,
    required this.joinedAt,
    required this.stats,
  });

  factory ChallengeParticipant.fromJson(Map<String, dynamic> json) {
    return ChallengeParticipant(
      userId: json['userId'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      score: json['score'] as int,
      position: json['position'] as int,
      status: json['status'] as String,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      stats: json['stats'] as Map<String, dynamic>? ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'avatar': avatar,
      'score': score,
      'position': position,
      'status': status,
      'joinedAt': joinedAt.toIso8601String(),
      'stats': stats,
    };
  }

  ChallengeParticipant copyWith({
    String? userId,
    String? name,
    String? avatar,
    int? score,
    int? position,
    String? status,
    DateTime? joinedAt,
    Map<String, dynamic>? stats,
  }) {
    return ChallengeParticipant(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      score: score ?? this.score,
      position: position ?? this.position,
      status: status ?? this.status,
      joinedAt: joinedAt ?? this.joinedAt,
      stats: stats ?? this.stats,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChallengeParticipant &&
          runtimeType == other.runtimeType &&
          userId == other.userId;

  @override
  int get hashCode => userId.hashCode;

  @override
  String toString() => 'ChallengeParticipant(userId: $userId, name: $name, position: $position)';
}
