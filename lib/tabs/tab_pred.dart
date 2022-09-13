import 'package:flutter/material.dart';
import 'package:flutter_football/models/game.dart';
import 'package:flutter_football/repo/game_repo.dart';
import 'package:flutter_football/tabs/tab_home.dart';

enum Pred { homeWin, draw, homeLose }

class PredTab extends StatelessWidget {
  final List<Game> games = GameRepo().getGames();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('승부예측'),
      ),
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          return GameTile(game: games[index]);
        },
      ),
    );
  }
}

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({Key? key}) : super(key: key);

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  Pred? _fruit = Pred.homeWin;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio<Pred>(
              value: Pred.homeWin,
              groupValue: _fruit,
              onChanged: (Pred? value) {
                setState(() {
                  _fruit = value;
                });
              },
            ),
            Text('승')
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio<Pred>(
              value: Pred.draw,
              groupValue: _fruit,
              onChanged: (Pred? value) {
                setState(() {
                  _fruit = value;
                });
              },
            ),
            Text('무')
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio<Pred>(
              value: Pred.homeLose,
              groupValue: _fruit,
              onChanged: (Pred? value) {
                setState(() {
                  _fruit = value;
                });
              },
            ),
            Text('패')
          ],
        ),
      ],
    );
  }
}
