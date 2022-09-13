import 'package:flutter/material.dart';
import 'package:flutter_football/models/game.dart';
import 'package:flutter_football/repo/game_repo.dart';

class HomeTab extends StatelessWidget {
  final List<Game> games = GameRepo().getGames();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('경기일정'),
        ),
        body: ListView.separated(
          itemCount: games.length,
          itemBuilder: (context, index) {
            return GameTile(game: games[index]);
          },
          separatorBuilder: (BuildContext context, int index){ return Divider(
            color: Colors.grey[500],
          ); },
        ),
    );
  }
}

// API 값에 따라서 리팩토링
class GameTile extends StatelessWidget {
  final Game game;

  GameTile({required this.game});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        // height: MediaQuery.of(context).size.height * 0.11,
        padding: EdgeInsets.all(7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    game.homeLogo,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    game.homeName,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  game.result,
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                  height: 5,
                ),
                Text(
                  game.gameDate,
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            Container(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    game.awayLogo,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    game.awayName,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
