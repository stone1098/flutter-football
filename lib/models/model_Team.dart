class Team{
  late int id;
  late String name;
  late String shortName;
  late String tla;
  late String crest;

  Team({
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crest
  });

  Team.fromJson(Map<String, dynamic> map) {
    id = map?['id'] ?? -1;
    name = map?['name'] ?? '';
    shortName = map?['shortName'] ?? '';
    tla = map?['tla'] ?? '';
    crest = map?['crest'] ?? '';
  }
}