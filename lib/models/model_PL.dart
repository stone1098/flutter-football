import 'package:flutter_football/models/model_Team.dart';
import 'package:intl/intl.dart';

class PL{
  late int id;
  late String utcDate;
  late int matchday;
  late String status;
  late Team homeTeam;
  late Team awayTeam;
  late int homeScore;
  late int awayScore;

  PL({
    required this.id,
    required this.utcDate,
    required this.matchday,
    required this.status,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
  });

  PL.fromJson(Map<String, dynamic> map) {
    id = map?['id'] ?? -1;
    DateTime date = DateTime.parse(map?['utcDate']);
    utcDate = DateFormat("MM.dd  HH:mm").format(date.add(Duration(hours: 9)));
    matchday = map?['matchday'] ?? -1;
    status = map?['status'] ?? '';
    homeTeam = (map['homeTeam'] != null
        ? Team.fromJson(map['homeTeam'])
        : null)!;
    awayTeam = (map['awayTeam'] != null
        ? Team.fromJson(map['awayTeam'])
        : null)!;
    homeScore = map?['score']['fullTime']['home'] ?? -1;
    awayScore = map?['score']['fullTime']['away'] ?? -1;
  }
}