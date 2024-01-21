import 'package:expense_app/screens/home/setting.dart';
import 'package:flutter/material.dart';

import '../home/graf.dart';
import '../home/home_page.dart';

class BottomBarPages extends StatefulWidget {
  const BottomBarPages({super.key});

  @override
  State<BottomBarPages> createState() => _BottomBarPagesState();
}

class _BottomBarPagesState extends State<BottomBarPages> {
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
          BottomNavigationBarItem(icon: Icon(Icons.north_east), label: "Month"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Year")
        ],
        onTap: _onTab,
        currentIndex: _seletedindex,
      ),
    );
  }
}
