class Challenge {
  final String id;
  final String title;
  final String description;
  final String type;
  final int reward;
  final DateTime startDate;
  final DateTime endDate;
  final int participants;
  final bool joined;

  Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.reward,
    required this.startDate,
    required this.endDate,
    required this.participants,
    required this.joined,
  });

  bool get isActive {
    final now = DateTime.now();
    return now.isAfter(startDate) && now.isBefore(endDate);
  }

  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
      reward: json['reward'] ?? 0,
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'])
          : DateTime.now(),
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'])
          : DateTime.now().add(Duration(days: 7)),
      participants: json['participants'] ?? 0,
      joined: json['joined'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type,
      'reward': reward,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'participants': participants,
      'joined': joined,
    };
  }
}
