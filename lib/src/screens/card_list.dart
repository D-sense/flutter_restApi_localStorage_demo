import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../controller/local_storage.dart';

class CardList extends StatelessWidget {
  LocalStorageHelper db = new LocalStorageHelper();

  List<CardModel> cards = [];

  CardList(this.cards);

  Widget build(context) {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (context, int index) {
        return imageBuilder(context, cards[index]);
      },
    );
  }

  Widget imageBuilder(context, CardModel card) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      child: Column(children: <Widget>[
        Padding(
            child: Image.network(card.imageUrl),
            padding: EdgeInsets.only(bottom: 8.0)
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape:
                      Border.all(
                        color: Colors.green,
                        width: 3.0,
                      ),
                ),
                child: Text("${card.id}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)
                    //child: const Text('RGB', textAlign: TextAlign.center),
                    )
            ),

            FlatButton(
                child: Icon(
                  Icons.favorite,
                  color: Colors.grey,
                  size: 50,
                ),
                splashColor: Colors.white70,
                onPressed: () {
                  db.saveCardToDB(CardModel(card.title, card.imageUrl)).then((_) {
                    dbSnackBar(context);
                  });
                }
            )
          ],
        ),
        Divider(),
        Text(card.title, style: TextStyle(fontSize: 20.0)),
      ]),
    );
  }

  dbSnackBar(context) {
    final snackBar = SnackBar(
      content: Text('Saved to Favourite.'),
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
