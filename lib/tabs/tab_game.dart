import 'package:flutter/material.dart';
import 'package:flutter_football/models/game.dart';
import 'package:flutter_football/models/model_PL.dart';
import 'package:flutter_football/providers/PL_api.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class GameTab extends StatefulWidget {

  @override
  State<GameTab> createState() => _GameTabState();
}

class _GameTabState extends State<GameTab> {

  PLApi plApi = PLApi();
  List<PL> pl = [];
  bool isLoading = true;
  String month = DateFormat('yy.M').format(DateTime.now());

  Future initPL() async{
    pl = await plApi.getPL();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPL().then((value){
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
        title: Container(
          width: 180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: (){

                    },
                ),
                Text(month + '월'),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: (){},
                ),
            ],
          ),
        ),
      ),
      body: isLoading ? Center( child: const CircularProgressIndicator(),) :
        ListView.separated(
          itemCount: pl.length,
          itemBuilder: (context, index) {
            return GameTile(pl: pl[index]);
          },
          separatorBuilder: (BuildContext context, int index){ return Divider(
            color: Colors.grey[500],
          ); },
        ),
    );
  }
}

class GameTile extends StatelessWidget {
  final PL pl;
  GameTile({required this.pl});
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        padding: EdgeInsets.all(7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  pl.homeTeam.crest.contains('.svg') ?
                  SvgPicture.network(pl.homeTeam.crest, width: 40.0, height: 40.0,) :
                  Image.network(
                    pl.homeTeam.crest,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    pl.homeTeam.tla,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  pl.homeScore.toString() + ' : ' + pl.awayScore.toString(),
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                  height: 5,
                ),
                Text(
                  pl.utcDate,
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            Container(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  pl.awayTeam.crest.contains('.svg') ?
                  SvgPicture.network(pl.awayTeam.crest, width: 40.0, height: 40.0,) :
                  Image.network(
                  pl.awayTeam.crest,
                  width: 40,
                  height: 40,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    pl.awayTeam.tla,
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