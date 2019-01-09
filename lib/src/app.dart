import 'package:flutter/material.dart';
import 'controller/favourite_card.dart';
import "controller/main_card.dart";


class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}


class AppState extends State<App> {

  int _currentIndex = 0;

  final List<Widget> _children = [
    MainCardScreen(), FavouriteCardScreen()
  ];

  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
        ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: _children[_currentIndex],
          bottomNavigationBar: mainBottomNavigatorBar(),
        ),
      ),
    );
  }


  Widget mainBottomNavigatorBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: onTabTapped,
      currentIndex: _currentIndex,

      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('HOME', style: TextStyle(fontSize: 15.0)),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: new Text('FAVOURITE', style: TextStyle(fontSize: 15.0)),
        ),
      ],
    );
  }


  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}

