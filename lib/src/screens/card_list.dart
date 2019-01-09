import 'package:flutter/material.dart';
import '../models/card_model.dart';

class CardList extends StatelessWidget{

  List<CardModel> images = [];

  CardList(this.images);

  Widget build(context){
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, int index){
          return imageBuilder(images[index]);
        },
    );
  }


  Widget imageBuilder(CardModel image){
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),

        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Padding (
              child: Image.network(image.url),
              padding: EdgeInsets.only(
                  bottom: 8.0
              )
            ),

            Text(image.title),
          ]
        ),

    );
  }

}