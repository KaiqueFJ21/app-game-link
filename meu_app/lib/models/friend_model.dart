class Friend {
  final String id;
  final String username;
  final String avatar;
  final int level;
  final String title;
  final bool online;
  final DateTime? lastSeen;
  final double winRate;
  final int totalMatches;

  Friend({
    required this.id,
    required this.username,
    required this.avatar,
    required this.level,
    required this.title,
    required this.online,
    this.lastSeen,
    required this.winRate,
    required this.totalMatches,
  });

  String get statusText => online ? 'Online' : 'Offline';

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      avatar: json['avatar'] ?? '',
      level: json['level'] ?? 0,
      title: json['title'] ?? '',
      online: json['online'] ?? false,
      lastSeen: json['lastSeen'] != null
          ? DateTime.parse(json['lastSeen'])
          : null,
      winRate: (json['winRate'] ?? 0.0).toDouble(),
      totalMatches: json['totalMatches'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'avatar': avatar,
      'level': level,
      'title': title,
      'online': online,
      'lastSeen': lastSeen?.toIso8601String(),
      'winRate': winRate,
      'totalMatches': totalMatches,
    };
  }
}
