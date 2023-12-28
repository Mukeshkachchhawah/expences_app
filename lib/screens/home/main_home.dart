import 'package:expense_app/screens/home/setting.dart';
import 'package:flutter/material.dart';

import 'graf.dart';
import 'home_page.dart';

class Main_Home extends StatefulWidget {
  const Main_Home({super.key});

  @override
  State<Main_Home> createState() => _Main_HomeState();
}

class _Main_HomeState extends State<Main_Home> {
  int _seletedindex = 0;

  void _onTab(int index) {
    setState(() {
      _seletedindex = index;
    });
  }

  List _pages = [
    Home_Page(),
    Expense_Month(),
    // Graf(),
    Setting()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_seletedindex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.north_east), label: "H"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "H")
        ],
        onTap: _onTab,
        currentIndex: _seletedindex,
      ),
    );
  }
}
