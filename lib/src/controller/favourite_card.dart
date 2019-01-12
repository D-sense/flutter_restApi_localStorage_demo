import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../controller/local_storage.dart';
import 'dart:convert';

class FavouriteCard extends StatefulWidget {
  @override
  State<FavouriteCard> createState() {
    return FavouriteCardState();
  }
}

class FavouriteCardState extends State<FavouriteCard> {
  
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
              //child: Text("My saved card shows up here......"),
              child: cardBuilder(),
            )));
  }

 
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
