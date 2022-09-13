import 'package:flutter/material.dart';
import 'package:flutter_football/tabs/tab_comm.dart';
import 'package:flutter_football/tabs/tab_home.dart';
import 'package:flutter_football/tabs/tab_pred.dart';
import 'package:flutter_football/tabs/tab_profile.dart';

class IndexScreen extends StatefulWidget {
  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {

  int _currentIndex = 0;
  final List<Widget> _tabs = [
    HomeTab(),
    CommTab(),
    PredTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 12),
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: '커뮤니티'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: '승부예측'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
        ],
      ),
      body: _tabs[_currentIndex],
    );
  }
}
