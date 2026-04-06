/// Modelo de Amigo para GameLink
/// 
/// Define a estrutura de um amigo na rede social

class FriendModel {
  /// ID único do amigo
  final String id;
  
  /// Nome do amigo
  final String name;
  
  /// Avatar do amigo
  final String avatar;
  
  /// Nível do amigo
  final int level;
  
  /// Jogo principal
  final String mainGame;
  
  /// Status online (online, offline, away)
  final String status;
  
  /// Última atividade
  final DateTime lastSeen;
  
  /// Clã do amigo (se tiver)
  final String? clanName;
  
  /// Se é um amigo próximo (favorito)
  final bool isFavorite;
  
  /// Data que se tornaram amigos
  final DateTime friendSince;
  
  /// Número de mensagens não lidas
  final int unreadMessages;
  
  /// Estatísticas do amigo
  final FriendStatistics statistics;

  const FriendModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.level,
    required this.mainGame,
    required this.status,
    required this.lastSeen,
    this.clanName,
    required this.isFavorite,
    required this.friendSince,
    required this.unreadMessages,
    required this.statistics,
  });

  factory FriendModel.fromJson(Map<String, dynamic> json) {
    return FriendModel(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      level: json['level'] as int,
      mainGame: json['mainGame'] as String,
      status: json['status'] as String,
      lastSeen: DateTime.parse(json['lastSeen'] as String),
      clanName: json['clanName'] as String?,
      isFavorite: json['isFavorite'] as bool,
      friendSince: DateTime.parse(json['friendSince'] as String),
      unreadMessages: json['unreadMessages'] as int,
      statistics: FriendStatistics.fromJson(
        json['statistics'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'level': level,
      'mainGame': mainGame,
      'status': status,
      'lastSeen': lastSeen.toIso8601String(),
      'clanName': clanName,
      'isFavorite': isFavorite,
      'friendSince': friendSince.toIso8601String(),
      'unreadMessages': unreadMessages,
      'statistics': statistics.toJson(),
    };
  }

  FriendModel copyWith({
    String? id,
    String? name,
    String? avatar,
    int? level,
    String? mainGame,
    String? status,
    DateTime? lastSeen,
    String? clanName,
    bool? isFavorite,
    DateTime? friendSince,
    int? unreadMessages,
    FriendStatistics? statistics,
  }) {
    return FriendModel(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      level: level ?? this.level,
      mainGame: mainGame ?? this.mainGame,
      status: status ?? this.status,
      lastSeen: lastSeen ?? this.lastSeen,
      clanName: clanName ?? this.clanName,
      isFavorite: isFavorite ?? this.isFavorite,
      friendSince: friendSince ?? this.friendSince,
      unreadMessages: unreadMessages ?? this.unreadMessages,
      statistics: statistics ?? this.statistics,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FriendModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'FriendModel(id: $id, name: $name, level: $level)';
}

/// Modelo de Estatísticas do Amigo
class FriendStatistics {
  /// Total de vitórias
  final int totalWins;
  
  /// Total de derrotas
  final int totalLosses;
  
  /// Taxa de vitória geral
  final double overallWinRate;
  
  /// Número de badges
  final int badgeCount;
  
  /// Número de clãs que participou
  final int clanCount;
  
  /// Tempo total jogado (em horas)
  final int totalHoursPlayed;
  
  /// Número de amigos
  final int friendCount;
  
  /// Ranking global
  final int globalRanking;

  const FriendStatistics({
    required this.totalWins,
    required this.totalLosses,
    required this.overallWinRate,
    required this.badgeCount,
    required this.clanCount,
    required this.totalHoursPlayed,
    required this.friendCount,
    required this.globalRanking,
  });

  factory FriendStatistics.fromJson(Map<String, dynamic> json) {
    return FriendStatistics(
      totalWins: json['totalWins'] as int,
      totalLosses: json['totalLosses'] as int,
      overallWinRate: (json['overallWinRate'] as num).toDouble(),
      badgeCount: json['badgeCount'] as int,
      clanCount: json['clanCount'] as int,
      totalHoursPlayed: json['totalHoursPlayed'] as int,
      friendCount: json['friendCount'] as int,
      globalRanking: json['globalRanking'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalWins': totalWins,
      'totalLosses': totalLosses,
      'overallWinRate': overallWinRate,
      'badgeCount': badgeCount,
      'clanCount': clanCount,
      'totalHoursPlayed': totalHoursPlayed,
      'friendCount': friendCount,
      'globalRanking': globalRanking,
    };
  }

  FriendStatistics copyWith({
    int? totalWins,
    int? totalLosses,
    double? overallWinRate,
    int? badgeCount,
    int? clanCount,
    int? totalHoursPlayed,
    int? friendCount,
    int? globalRanking,
  }) {
    return FriendStatistics(
      totalWins: totalWins ?? this.totalWins,
      totalLosses: totalLosses ?? this.totalLosses,
      overallWinRate: overallWinRate ?? this.overallWinRate,
      badgeCount: badgeCount ?? this.badgeCount,
      clanCount: clanCount ?? this.clanCount,
      totalHoursPlayed: totalHoursPlayed ?? this.totalHoursPlayed,
      friendCount: friendCount ?? this.friendCount,
      globalRanking: globalRanking ?? this.globalRanking,
    );
  }

  /// Calcula o total de partidas
  int get totalMatches => totalWins + totalLosses;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FriendStatistics &&
          runtimeType == other.runtimeType &&
          totalWins == other.totalWins;

  @override
  int get hashCode => totalWins.hashCode;

  @override
  String toString() =>
      'FriendStatistics(wins: $totalWins, losses: $totalLosses, winRate: $overallWinRate%)';
}

/// Modelo de Solicitação de Amizade
class FriendRequest {
  /// ID da solicitação
  final String id;
  
  /// ID do usuário que enviou
  final String senderId;
  
  /// Nome do remetente
  final String senderName;
  
  /// Avatar do remetente
  final String senderAvatar;
  
  /// Nível do remetente
  final int senderLevel;
  
  /// Jogo principal do remetente
  final String senderMainGame;
  
  /// Status da solicitação (pending, accepted, rejected)
  final String status;
  
  /// Data do envio
  final DateTime sentAt;
  
  /// Mensagem personalizada (opcional)
  final String? message;

  const FriendRequest({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.senderAvatar,
    required this.senderLevel,
    required this.senderMainGame,
    required this.status,
    required this.sentAt,
    this.message,
  });

  factory FriendRequest.fromJson(Map<String, dynamic> json) {
    return FriendRequest(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      senderAvatar: json['senderAvatar'] as String,
      senderLevel: json['senderLevel'] as int,
      senderMainGame: json['senderMainGame'] as String,
      status: json['status'] as String,
      sentAt: DateTime.parse(json['sentAt'] as String),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'senderName': senderName,
      'senderAvatar': senderAvatar,
      'senderLevel': senderLevel,
      'senderMainGame': senderMainGame,
      'status': status,
      'sentAt': sentAt.toIso8601String(),
      'message': message,
    };
  }

  FriendRequest copyWith({
    String? id,
    String? senderId,
    String? senderName,
    String? senderAvatar,
    int? senderLevel,
    String? senderMainGame,
    String? status,
    DateTime? sentAt,
    String? message,
  }) {
    return FriendRequest(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      senderAvatar: senderAvatar ?? this.senderAvatar,
      senderLevel: senderLevel ?? this.senderLevel,
      senderMainGame: senderMainGame ?? this.senderMainGame,
      status: status ?? this.status,
      sentAt: sentAt ?? this.sentAt,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FriendRequest &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'FriendRequest(id: $id, from: $senderName, status: $status)';
}
