import 'package:flutter_football/models/game.dart';

class GameRepo{
  final List<Game> _dummyGames = [
    Game(
        homeName: '토트넘',
        homeLogo: 'https://sports-phinf.pstatic.net/team/wfootball/default/19.png?type=f108_108',
        result: '0:0',
        gameDate: '09.08 04:00',
        awayName: '마르세유',
        awayLogo: 'https://sports-phinf.pstatic.net/team/wfootball/default/26344.png?type=f108_108'
    ),

    Game(
        homeName: '인터밀란',
        homeLogo: 'https://sports-phinf.pstatic.net/team/wfootball/default/6136.png?type=f108_108',
        result: '0:0',
        gameDate: '09.08 04:00',
        awayName: '바이에른 뮌헨',
        awayLogo: 'https://sports-phinf.pstatic.net/team/wfootball/default/26247.png?type=f108_108'
    ),

    Game(
        homeName: '인터밀란',
        homeLogo: 'https://sports-phinf.pstatic.net/team/wfootball/default/6136.png?type=f108_108',
        result: '0:0',
        gameDate: '09.08 04:00',
        awayName: '바이에른 뮌헨',
        awayLogo: 'https://sports-phinf.pstatic.net/team/wfootball/default/26247.png?type=f108_108'
    ),

    Game(
        homeName: '인터밀란',
        homeLogo: 'https://sports-phinf.pstatic.net/team/wfootball/default/6136.png?type=f108_108',
        result: '0:0',
        gameDate: '09.08 04:00',
        awayName: '바이에른 뮌헨',
        awayLogo: 'https://sports-phinf.pstatic.net/team/wfootball/default/26247.png?type=f108_108'
    ),
  ];

  List<Game> getGames(){
    return _dummyGames;
  }
}