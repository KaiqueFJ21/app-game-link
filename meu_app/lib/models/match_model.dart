class Match {
  final String id;
  final String game; // Valorant, League of Legends, CS:GO
  final String map;
  final bool won;
  final String agent; // Agente/Campeão usado
  final int kills;
  final int deaths;
  final int assists;
  final int damage;
  final int gold;
  final Duration duration;
  final DateTime playedAt;

  Match({
    required this.id,
    required this.game,
    required this.map,
    required this.won,
    required this.agent,
    required this.kills,
    required this.deaths,
    required this.assists,
    required this.damage,
    required this.gold,
    required this.duration,
    required this.playedAt,
  });

  String get kdaText => '$kills/$deaths/$assists';
  String get durationText {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['id'] ?? '',
      game: json['game'] ?? '',
      map: json['map'] ?? '',
      won: json['won'] ?? false,
      agent: json['agent'] ?? '',
      kills: json['kills'] ?? 0,
      deaths: json['deaths'] ?? 0,
      assists: json['assists'] ?? 0,
      damage: json['damage'] ?? 0,
      gold: json['gold'] ?? 0,
      duration: Duration(seconds: json['durationSeconds'] ?? 0),
      playedAt: json['playedAt'] != null
          ? DateTime.parse(json['playedAt'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'game': game,
      'map': map,
      'won': won,
      'agent': agent,
      'kills': kills,
      'deaths': deaths,
      'assists': assists,
      'damage': damage,
      'gold': gold,
      'durationSeconds': duration.inSeconds,
      'playedAt': playedAt.toIso8601String(),
    };
  }
}
