/// Modelo de Usuário para GameLink
/// 
/// Este arquivo define a estrutura de dados de um usuário na plataforma GameLink.
/// Contém informações pessoais, estatísticas de jogo e preferências do usuário.

class UserModel {
  /// ID único do usuário no sistema
  final String id;
  
  /// Nome de usuário (username) para exibição pública
  final String username;
  
  /// Email do usuário para autenticação e comunicação
  final String email;
  
  /// Nível atual do usuário (1-100)
  final int level;
  
  /// Pontos totais acumulados pelo usuário
  final int points;
  
  /// URL do avatar/foto de perfil do usuário
  final String avatar;
  
  /// Número total de vitórias do usuário
  final int totalWins;
  
  /// Número total de derrotas do usuário
  final int totalLosses;
  
  /// Taxa de vitória em porcentagem (0-100)
  final double winRate;
  
  /// Posição atual no ranking global
  final int rankPosition;
  
  /// Número de amigos conectados
  final int friendsCount;
  
  /// ID do clã ao qual o usuário pertence (null se não estiver em um clã)
  final String? clanId;
  
  /// Data de criação da conta
  final DateTime createdAt;
  
  /// Data da última atividade do usuário
  final DateTime lastActive;
  
  /// Flag indicando se o usuário está online
  final bool isOnline;
  
  /// Biografia/descrição do usuário
  final String bio;
  
  /// Moeda virtual do usuário (créditos)
  final int credits;
  
  /// Construtor da classe UserModel
  /// 
  /// Todos os parâmetros são obrigatórios para garantir integridade dos dados
  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.level,
    required this.points,
    required this.avatar,
    required this.totalWins,
    required this.totalLosses,
    required this.winRate,
    required this.rankPosition,
    required this.friendsCount,
    this.clanId,
    required this.createdAt,
    required this.lastActive,
    required this.isOnline,
    required this.bio,
    required this.credits,
  });

  /// Cria uma instância de UserModel a partir de um JSON
  /// 
  /// Útil para desserializar dados recebidos da API
  /// 
  /// Exemplo:
  /// ```dart
  /// final user = UserModel.fromJson(jsonData);
  /// ```
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      level: json['level'] as int,
      points: json['points'] as int,
      avatar: json['avatar'] as String,
      totalWins: json['totalWins'] as int,
      totalLosses: json['totalLosses'] as int,
      winRate: (json['winRate'] as num).toDouble(),
      rankPosition: json['rankPosition'] as int,
      friendsCount: json['friendsCount'] as int,
      clanId: json['clanId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastActive: DateTime.parse(json['lastActive'] as String),
      isOnline: json['isOnline'] as bool,
      bio: json['bio'] as String,
      credits: json['credits'] as int,
    );
  }

  /// Converte a instância de UserModel para JSON
  /// 
  /// Útil para serializar dados para enviar à API
  /// 
  /// Exemplo:
  /// ```dart
  /// final json = user.toJson();
  /// ```
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'level': level,
      'points': points,
      'avatar': avatar,
      'totalWins': totalWins,
      'totalLosses': totalLosses,
      'winRate': winRate,
      'rankPosition': rankPosition,
      'friendsCount': friendsCount,
      'clanId': clanId,
      'createdAt': createdAt.toIso8601String(),
      'lastActive': lastActive.toIso8601String(),
      'isOnline': isOnline,
      'bio': bio,
      'credits': credits,
    };
  }

  /// Cria uma cópia do UserModel com alguns campos modificados
  /// 
  /// Útil para atualizar dados sem criar uma nova instância completa
  /// 
  /// Exemplo:
  /// ```dart
  /// final updatedUser = user.copyWith(level: 50, points: 5000);
  /// ```
  UserModel copyWith({
    String? id,
    String? username,
    String? email,
    int? level,
    int? points,
    String? avatar,
    int? totalWins,
    int? totalLosses,
    double? winRate,
    int? rankPosition,
    int? friendsCount,
    String? clanId,
    DateTime? createdAt,
    DateTime? lastActive,
    bool? isOnline,
    String? bio,
    int? credits,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      level: level ?? this.level,
      points: points ?? this.points,
      avatar: avatar ?? this.avatar,
      totalWins: totalWins ?? this.totalWins,
      totalLosses: totalLosses ?? this.totalLosses,
      winRate: winRate ?? this.winRate,
      rankPosition: rankPosition ?? this.rankPosition,
      friendsCount: friendsCount ?? this.friendsCount,
      clanId: clanId ?? this.clanId,
      createdAt: createdAt ?? this.createdAt,
      lastActive: lastActive ?? this.lastActive,
      isOnline: isOnline ?? this.isOnline,
      bio: bio ?? this.bio,
      credits: credits ?? this.credits,
    );
  }

  /// Compara dois UserModel pela igualdade de todos os campos
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          username == other.username &&
          email == other.email &&
          level == other.level &&
          points == other.points &&
          avatar == other.avatar &&
          totalWins == other.totalWins &&
          totalLosses == other.totalLosses &&
          winRate == other.winRate &&
          rankPosition == other.rankPosition &&
          friendsCount == other.friendsCount &&
          clanId == other.clanId &&
          createdAt == other.createdAt &&
          lastActive == other.lastActive &&
          isOnline == other.isOnline &&
          bio == other.bio &&
          credits == other.credits;

  /// Gera um hash code para o UserModel
  @override
  int get hashCode =>
      id.hashCode ^
      username.hashCode ^
      email.hashCode ^
      level.hashCode ^
      points.hashCode ^
      avatar.hashCode ^
      totalWins.hashCode ^
      totalLosses.hashCode ^
      winRate.hashCode ^
      rankPosition.hashCode ^
      friendsCount.hashCode ^
      clanId.hashCode ^
      createdAt.hashCode ^
      lastActive.hashCode ^
      isOnline.hashCode ^
      bio.hashCode ^
      credits.hashCode;

  /// Retorna uma representação em string do UserModel
  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, level: $level, points: $points)';
  }
}
