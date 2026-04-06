/// Modelo de Ranking para GameLink
/// 
/// Define a estrutura de um jogador no ranking

class RankingModel {
  /// Posição no ranking
  final int position;
  
  /// ID do usuário
  final String userId;
  
  /// Nome do usuário
  final String name;
  
  /// Avatar do usuário
  final String avatar;
  
  /// Nível
  final int level;
  
  /// Experiência total
  final int totalExperience;
  
  /// Pontos de ranking
  final int rankingPoints;
  
  /// Jogo principal
  final String mainGame;
  
  /// Vitórias
  final int wins;
  
  /// Derrotas
  final int losses;
  
  /// Taxa de vitória (porcentagem)
  final double winRate;
  
  /// Clã (se tiver)
  final String? clanName;
  
  /// Título/Badge especial
  final String? title;
  
  /// Mudança de posição (positivo = subiu, negativo = desceu)
  final int positionChange;
  
  /// Se é o usuário atual
  final bool isCurrentUser;

  const RankingModel({
    required this.position,
    required this.userId,
    required this.name,
    required this.avatar,
    required this.level,
    required this.totalExperience,
    required this.rankingPoints,
    required this.mainGame,
    required this.wins,
    required this.losses,
    required this.winRate,
    this.clanName,
    this.title,
    required this.positionChange,
    required this.isCurrentUser,
  });

  factory RankingModel.fromJson(Map<String, dynamic> json) {
    return RankingModel(
      position: json['position'] as int,
      userId: json['userId'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      level: json['level'] as int,
      totalExperience: json['totalExperience'] as int,
      rankingPoints: json['rankingPoints'] as int,
      mainGame: json['mainGame'] as String,
      wins: json['wins'] as int,
      losses: json['losses'] as int,
      winRate: (json['winRate'] as num).toDouble(),
      clanName: json['clanName'] as String?,
      title: json['title'] as String?,
      positionChange: json['positionChange'] as int,
      isCurrentUser: json['isCurrentUser'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'position': position,
      'userId': userId,
      'name': name,
      'avatar': avatar,
      'level': level,
      'totalExperience': totalExperience,
      'rankingPoints': rankingPoints,
      'mainGame': mainGame,
      'wins': wins,
      'losses': losses,
      'winRate': winRate,
      'clanName': clanName,
      'title': title,
      'positionChange': positionChange,
      'isCurrentUser': isCurrentUser,
    };
  }

  RankingModel copyWith({
    int? position,
    String? userId,
    String? name,
    String? avatar,
    int? level,
    int? totalExperience,
    int? rankingPoints,
    String? mainGame,
    int? wins,
    int? losses,
    double? winRate,
    String? clanName,
    String? title,
    int? positionChange,
    bool? isCurrentUser,
  }) {
    return RankingModel(
      position: position ?? this.position,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      level: level ?? this.level,
      totalExperience: totalExperience ?? this.totalExperience,
      rankingPoints: rankingPoints ?? this.rankingPoints,
      mainGame: mainGame ?? this.mainGame,
      wins: wins ?? this.wins,
      losses: losses ?? this.losses,
      winRate: winRate ?? this.winRate,
      clanName: clanName ?? this.clanName,
      title: title ?? this.title,
      positionChange: positionChange ?? this.positionChange,
      isCurrentUser: isCurrentUser ?? this.isCurrentUser,
    );
  }

  /// Calcula o total de partidas
  int get totalMatches => wins + losses;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RankingModel &&
          runtimeType == other.runtimeType &&
          userId == other.userId;

  @override
  int get hashCode => userId.hashCode;

  @override
  String toString() =>
      'RankingModel(position: $position, name: $name, level: $level, points: $rankingPoints)';
}

/// Modelo de Estatísticas de Jogo
class GameStatistics {
  /// Nome do jogo
  final String gameName;
  
  /// Ícone do jogo
  final String gameIcon;
  
  /// Nível neste jogo
  final int level;
  
  /// Experiência neste jogo
  final int experience;
  
  /// Vitórias neste jogo
  final int wins;
  
  /// Derrotas neste jogo
  final int losses;
  
  /// Taxa de vitória
  final double winRate;
  
  /// Posição no ranking do jogo
  final int rankingPosition;
  
  /// Pontos de ranking neste jogo
  final int rankingPoints;
  
  /// Tempo total jogado (em horas)
  final int totalHoursPlayed;
  
  /// Melhor série de vitórias
  final int bestWinStreak;
  
  /// Série de vitórias atual
  final int currentWinStreak;

  const GameStatistics({
    required this.gameName,
    required this.gameIcon,
    required this.level,
    required this.experience,
    required this.wins,
    required this.losses,
    required this.winRate,
    required this.rankingPosition,
    required this.rankingPoints,
    required this.totalHoursPlayed,
    required this.bestWinStreak,
    required this.currentWinStreak,
  });

  factory GameStatistics.fromJson(Map<String, dynamic> json) {
    return GameStatistics(
      gameName: json['gameName'] as String,
      gameIcon: json['gameIcon'] as String,
      level: json['level'] as int,
      experience: json['experience'] as int,
      wins: json['wins'] as int,
      losses: json['losses'] as int,
      winRate: (json['winRate'] as num).toDouble(),
      rankingPosition: json['rankingPosition'] as int,
      rankingPoints: json['rankingPoints'] as int,
      totalHoursPlayed: json['totalHoursPlayed'] as int,
      bestWinStreak: json['bestWinStreak'] as int,
      currentWinStreak: json['currentWinStreak'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gameName': gameName,
      'gameIcon': gameIcon,
      'level': level,
      'experience': experience,
      'wins': wins,
      'losses': losses,
      'winRate': winRate,
      'rankingPosition': rankingPosition,
      'rankingPoints': rankingPoints,
      'totalHoursPlayed': totalHoursPlayed,
      'bestWinStreak': bestWinStreak,
      'currentWinStreak': currentWinStreak,
    };
  }

  GameStatistics copyWith({
    String? gameName,
    String? gameIcon,
    int? level,
    int? experience,
    int? wins,
    int? losses,
    double? winRate,
    int? rankingPosition,
    int? rankingPoints,
    int? totalHoursPlayed,
    int? bestWinStreak,
    int? currentWinStreak,
  }) {
    return GameStatistics(
      gameName: gameName ?? this.gameName,
      gameIcon: gameIcon ?? this.gameIcon,
      level: level ?? this.level,
      experience: experience ?? this.experience,
      wins: wins ?? this.wins,
      losses: losses ?? this.losses,
      winRate: winRate ?? this.winRate,
      rankingPosition: rankingPosition ?? this.rankingPosition,
      rankingPoints: rankingPoints ?? this.rankingPoints,
      totalHoursPlayed: totalHoursPlayed ?? this.totalHoursPlayed,
      bestWinStreak: bestWinStreak ?? this.bestWinStreak,
      currentWinStreak: currentWinStreak ?? this.currentWinStreak,
    );
  }

  /// Calcula o total de partidas
  int get totalMatches => wins + losses;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameStatistics &&
          runtimeType == other.runtimeType &&
          gameName == other.gameName;

  @override
  int get hashCode => gameName.hashCode;

  @override
  String toString() =>
      'GameStatistics(game: $gameName, level: $level, wins: $wins, losses: $losses)';
}
