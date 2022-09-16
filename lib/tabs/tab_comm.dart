import 'package:flutter/material.dart';
import 'package:flutter_football/models/model_PL.dart';
import 'package:flutter_football/providers/PL_api.dart';
import 'package:flutter_svg/svg.dart';

class CommTab extends StatefulWidget {

  @override
  State<CommTab> createState() => _CommTabState();
}

class _CommTabState extends State<CommTab> {

  PLApi plApi = PLApi();
  List<PL> pl = [];
  bool isLoading = true;

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
    return Center(
      child: Text('commTab'),
    );
  }
}