import 'dart:convert';

import 'package:flutter_football/models/game.dart';
import 'package:flutter_football/models/model_PL.dart';
import 'package:http/http.dart' as http;

class PLApi{
  static String apiUri = 'https://api.football-data.org/v4/competitions/PL/matches?matchday=';
  static String apiKey = 'd111c437a6aa44e1a71fca28c86514ad';
  static int round = 1;

  final url = Uri.parse(apiUri + round.toString());

  Future<List<PL>> getPL() async{
    List<PL> plList = [];
    final response = await http.get(url, headers: {'X-Auth-Token': 'd111c437a6aa44e1a71fca28c86514ad'},);
    final statusCode = response.statusCode;
    final body = response.body;

    if (statusCode == 200){
      plList = jsonDecode(body)['matches'].map<PL>((matches){
        return PL.fromJson(matches);
      }).toList();
    }

    return plList;
  }
}