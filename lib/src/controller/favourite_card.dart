import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../controller/local_storage.dart';
import 'dart:convert';

class FavouriteCardScreen extends StatefulWidget {
  @override
  State<FavouriteCardScreen> createState() {
    // TODO: implement createState
    return FavouriteState();
  }
}

class FavouriteState extends State<FavouriteCardScreen> {
  
  LocalStorageHelper db = new LocalStorageHelper();

  List<CardModel<dynamic>> cards = [];

  initState() {
    super.initState();

    db.getSavedFavourtesFromDB().then((items) {
      setState(() {
        items.forEach((item) {
          cards.add(CardModel.fromJson(item));
        });
      });
    });
  }

  Widget build(context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Favourite Cards"),
            ),
            body: Center(
              //child: Text("My saved card shows here......"),
              child: cardBuilder(),
            )));
  }

 
  // Widget cardBuilder1() {
  //   return ListView.builder(
  //       itemCount: cards.length,
  //       itemBuilder: (context, index) {
  //         return Column(children: <Widget>[
  //           Padding(
  //               child: Text("${cards[index].id}"),
  //               padding: EdgeInsets.only(bottom: 8.0)),
  //           Text(cards[index].title),
  //         ]);
  //       });
  // }

  Widget cardBuilder() {
    return ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${cards[index].title}',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
            subtitle: Text('${cards[index].id}'),
            leading: Container(
                height: 10.0,
                width: 10.0,
                //child: Image.network(cards[index].imageUrl),
            ),
          );
        });
  }
}
