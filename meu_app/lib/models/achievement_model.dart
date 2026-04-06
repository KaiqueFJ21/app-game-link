class Achievement {
  final String id;
  final String name;
  final String description;
  final String icon; // Emoji ou URL
  final bool unlocked;
  final DateTime? unlockedAt;
  final int progress; // 0-100
  final int maxProgress;

  Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.unlocked,
    this.unlockedAt,
    required this.progress,
    required this.maxProgress,
  });

  String get progressText => '$progress/$maxProgress';
  double get progressPercentage => progress / maxProgress;

  factory Achievement.fromJson(Map<String, dynamic> json) {
    return Achievement(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '🏆',
      unlocked: json['unlocked'] ?? false,
      unlockedAt: json['unlockedAt'] != null
          ? DateTime.parse(json['unlockedAt'])
          : null,
      progress: json['progress'] ?? 0,
      maxProgress: json['maxProgress'] ?? 100,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'icon': icon,
      'unlocked': unlocked,
      'unlockedAt': unlockedAt?.toIso8601String(),
      'progress': progress,
      'maxProgress': maxProgress,
    };
  }
}
