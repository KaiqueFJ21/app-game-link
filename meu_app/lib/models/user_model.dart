class User {
  final String id;
  final String username;
  final String email;
  final String title;
  final int level;
  final int currentXp;
  final int maxXp;
  final String bio;
  final String avatar;
  final DateTime memberSince;
  final List<String> connectedGames;
  final int totalMatches;
  final double winRate;
  final double kdRatio;
  final double winrate;
  final List<String> activeTitles;
  final List<String> achievements;
  final int credits;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.title,
    required this.level,
    required this.currentXp,
    required this.maxXp,
    required this.bio,
    required this.avatar,
    required this.memberSince,
    required this.connectedGames,
    required this.totalMatches,
    required this.winRate,
    required this.kdRatio,
    required this.winrate,
    required this.activeTitles,
    required this.achievements,
    required this.credits,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      title: json['title'] ?? '',
      level: json['level'] ?? 0,
      currentXp: json['currentXp'] ?? 0,
      maxXp: json['maxXp'] ?? 10000,
      bio: json['bio'] ?? '',
      avatar: json['avatar'] ?? '',
      memberSince: json['memberSince'] != null
          ? DateTime.parse(json['memberSince'])
          : DateTime.now(),
      connectedGames: List<String>.from(json['connectedGames'] ?? []),
      totalMatches: json['totalMatches'] ?? 0,
      winRate: (json['winRate'] ?? 0.0).toDouble(),
      kdRatio: (json['kdRatio'] ?? 0.0).toDouble(),
      winrate: (json['winrate'] ?? 0.0).toDouble(),
      activeTitles: List<String>.from(json['activeTitles'] ?? []),
      achievements: List<String>.from(json['achievements'] ?? []),
      credits: json['credits'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'title': title,
      'level': level,
      'currentXp': currentXp,
      'maxXp': maxXp,
      'bio': bio,
      'avatar': avatar,
      'memberSince': memberSince.toIso8601String(),
      'connectedGames': connectedGames,
      'totalMatches': totalMatches,
      'winRate': winRate,
      'kdRatio': kdRatio,
      'winrate': winrate,
      'activeTitles': activeTitles,
      'achievements': achievements,
      'credits': credits,
    };
  }
}
