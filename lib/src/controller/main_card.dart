import 'package:flutter/material.dart';
import '../models/card_model.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;
import '../screens/card_list.dart';



class MainCardScreen extends StatefulWidget{

  @override
    State<MainCardScreen> createState() {
      // TODO: implement createState
      return new AppState();
    }
}


class AppState extends State<MainCardScreen> {
  final _root ="https://jsonplaceholder.typicode.com/photos/";
  int counter = 0;

  List<CardModel> cards = [];

  void getCard() async {
    counter++;
    var response = await get("$_root$counter");
    var cardModel = CardModel.fromJson(json.decode(response.body));
  
    setState(() {
      cards.add(cardModel);
    });

    apiSnackBar();
  }
  
  apiSnackBar(){
    final snackBar = SnackBar(
    content: Text('fetching a card ....'),
    action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  

  Widget build(context){
      return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Main")
          ),

          body: CardList(cards),

          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: getCard,
            backgroundColor: Colors.green,
          ),

        )
    );
  }
  
}