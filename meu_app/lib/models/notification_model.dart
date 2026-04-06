/// Modelo de Notificação para GameLink
/// 
/// Define a estrutura de uma notificação no sistema

class NotificationModel {
  /// ID único da notificação
  final String id;
  
  /// Tipo de notificação (message, achievement, challenge, friend, system)
  final String type;
  
  /// Título da notificação
  final String title;
  
  /// Descrição/conteúdo
  final String description;
  
  /// Ícone/imagem
  final String? icon;
  
  /// Se foi lida
  final bool isRead;
  
  /// Data de criação
  final DateTime createdAt;
  
  /// Ação ao clicar (rota ou URL)
  final String? actionUrl;
  
  /// Dados adicionais
  final Map<String, dynamic> metadata;
  
  /// Prioridade (low, normal, high, urgent)
  final String priority;

  const NotificationModel({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    this.icon,
    required this.isRead,
    required this.createdAt,
    this.actionUrl,
    required this.metadata,
    required this.priority,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String?,
      isRead: json['isRead'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      actionUrl: json['actionUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? {},
      priority: json['priority'] as String? ?? 'normal',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'description': description,
      'icon': icon,
      'isRead': isRead,
      'createdAt': createdAt.toIso8601String(),
      'actionUrl': actionUrl,
      'metadata': metadata,
      'priority': priority,
    };
  }

  NotificationModel copyWith({
    String? id,
    String? type,
    String? title,
    String? description,
    String? icon,
    bool? isRead,
    DateTime? createdAt,
    String? actionUrl,
    Map<String, dynamic>? metadata,
    String? priority,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      actionUrl: actionUrl ?? this.actionUrl,
      metadata: metadata ?? this.metadata,
      priority: priority ?? this.priority,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'NotificationModel(id: $id, type: $type, title: $title, read: $isRead)';
}

/// Tipos de notificações pré-definidas
class NotificationType {
  static const String message = 'message';
  static const String achievement = 'achievement';
  static const String challenge = 'challenge';
  static const String friend = 'friend';
  static const String system = 'system';
  static const String reward = 'reward';
  static const String clan = 'clan';
  static const String ranking = 'ranking';
  static const String promotion = 'promotion';
  static const String event = 'event';
}

/// Prioridades de notificações
class NotificationPriority {
  static const String low = 'low';
  static const String normal = 'normal';
  static const String high = 'high';
  static const String urgent = 'urgent';
}

/// Modelo de Preferências de Notificação do Usuário
class NotificationPreferences {
  /// ID do usuário
  final String userId;
  
  /// Notificações de mensagens ativadas
  final bool messageNotifications;
  
  /// Notificações de conquistas ativadas
  final bool achievementNotifications;
  
  /// Notificações de desafios ativadas
  final bool challengeNotifications;
  
  /// Notificações de amigos ativadas
  final bool friendNotifications;
  
  /// Notificações de clã ativadas
  final bool clanNotifications;
  
  /// Notificações de sistema ativadas
  final bool systemNotifications;
  
  /// Som ativado
  final bool soundEnabled;
  
  /// Vibração ativada
  final bool vibrationEnabled;
  
  /// Notificações push ativadas
  final bool pushEnabled;
  
  /// Horário de não perturbar (início)
  final String? quietHoursStart;
  
  /// Horário de não perturbar (fim)
  final String? quietHoursEnd;

  const NotificationPreferences({
    required this.userId,
    required this.messageNotifications,
    required this.achievementNotifications,
    required this.challengeNotifications,
    required this.friendNotifications,
    required this.clanNotifications,
    required this.systemNotifications,
    required this.soundEnabled,
    required this.vibrationEnabled,
    required this.pushEnabled,
    this.quietHoursStart,
    this.quietHoursEnd,
  });

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) {
    return NotificationPreferences(
      userId: json['userId'] as String,
      messageNotifications: json['messageNotifications'] as bool,
      achievementNotifications: json['achievementNotifications'] as bool,
      challengeNotifications: json['challengeNotifications'] as bool,
      friendNotifications: json['friendNotifications'] as bool,
      clanNotifications: json['clanNotifications'] as bool,
      systemNotifications: json['systemNotifications'] as bool,
      soundEnabled: json['soundEnabled'] as bool,
      vibrationEnabled: json['vibrationEnabled'] as bool,
      pushEnabled: json['pushEnabled'] as bool,
      quietHoursStart: json['quietHoursStart'] as String?,
      quietHoursEnd: json['quietHoursEnd'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'messageNotifications': messageNotifications,
      'achievementNotifications': achievementNotifications,
      'challengeNotifications': challengeNotifications,
      'friendNotifications': friendNotifications,
      'clanNotifications': clanNotifications,
      'systemNotifications': systemNotifications,
      'soundEnabled': soundEnabled,
      'vibrationEnabled': vibrationEnabled,
      'pushEnabled': pushEnabled,
      'quietHoursStart': quietHoursStart,
      'quietHoursEnd': quietHoursEnd,
    };
  }

  NotificationPreferences copyWith({
    String? userId,
    bool? messageNotifications,
    bool? achievementNotifications,
    bool? challengeNotifications,
    bool? friendNotifications,
    bool? clanNotifications,
    bool? systemNotifications,
    bool? soundEnabled,
    bool? vibrationEnabled,
    bool? pushEnabled,
    String? quietHoursStart,
    String? quietHoursEnd,
  }) {
    return NotificationPreferences(
      userId: userId ?? this.userId,
      messageNotifications: messageNotifications ?? this.messageNotifications,
      achievementNotifications:
          achievementNotifications ?? this.achievementNotifications,
      challengeNotifications:
          challengeNotifications ?? this.challengeNotifications,
      friendNotifications: friendNotifications ?? this.friendNotifications,
      clanNotifications: clanNotifications ?? this.clanNotifications,
      systemNotifications: systemNotifications ?? this.systemNotifications,
      soundEnabled: soundEnabled ?? this.soundEnabled,
      vibrationEnabled: vibrationEnabled ?? this.vibrationEnabled,
      pushEnabled: pushEnabled ?? this.pushEnabled,
      quietHoursStart: quietHoursStart ?? this.quietHoursStart,
      quietHoursEnd: quietHoursEnd ?? this.quietHoursEnd,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationPreferences &&
          runtimeType == other.runtimeType &&
          userId == other.userId;

  @override
  int get hashCode => userId.hashCode;

  @override
  String toString() =>
      'NotificationPreferences(userId: $userId, push: $pushEnabled, sound: $soundEnabled)';
}
