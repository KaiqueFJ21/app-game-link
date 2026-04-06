class Clan {
  final String id;
  final String name;
  final String description;
  final String leader;
  final int members;
  final int level;
  final DateTime createdAt;

  Clan({
    required this.id,
    required this.name,
    required this.description,
    required this.leader,
    required this.members,
    required this.level,
    required this.createdAt,
  });
}
