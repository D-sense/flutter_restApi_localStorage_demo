import 'package:flutter/material.dart';
import '../models/card_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';


class FavouriteCardScreen extends StatefulWidget{

  @override
    State<FavouriteCardScreen> createState() {
      // TODO: implement createState
      return FavouriteState();
    }
}


class FavouriteState extends State<FavouriteCardScreen> {

  Widget build(context){
      return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("REST API & Local_Storage Demo"),
          ),

          body: Center(
            child: Text("My saved card shows here......"),
          ),

          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            shape:BorderDirectional(),
            onPressed: (){}
            ),
          ),

        );
  }
  
}