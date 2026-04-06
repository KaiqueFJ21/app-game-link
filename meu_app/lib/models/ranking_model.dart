class RankingPlayer {
  final int position;
  final String username;
  final int level;
  final int points;
  final double winRate;
  final bool isCurrentUser;

  RankingPlayer({
    required this.position,
    required this.username,
    required this.level,
    required this.points,
    required this.winRate,
    required this.isCurrentUser,
  });
}
