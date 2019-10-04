import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sneaker_stk/appstate/appstate.dart';
import 'package:sneaker_stk/favorites/sneakerfavoriteswidget.dart';

import 'package:sneaker_stk/locker/sneaker/sneakerwidget.dart';
import 'package:redux/redux.dart';
import 'package:sneaker_stk/locker/sneakerlockerwidget.dart';

class HomeWidget extends StatefulWidget {
  @override
  createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final List<Widget> _children = [
    SneakerLockerWidget(),
    SneakerFavoritesWidget()
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SNKR STOCK'),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.archive),
            title: new Text('Locker'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            title: new Text('Favorites'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
