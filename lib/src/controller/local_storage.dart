import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/card_model.dart';


class LocalStorageHelper {

  static final LocalStorageHelper _instance = new LocalStorageHelper.internal();

  factory LocalStorageHelper() => _instance;

  final String tableName = 'cardsTable';
  final String columnId = 'id';
  final String columnTitle = 'title';
  final String columnImageURL = 'imageUrl';
  
  static Database _db;

  LocalStorageHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cards.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, $columnTitle TEXT, $columnImageURL TEXT)');
  }

  Future<int> saveCardToDB(CardModel card) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableName, card.toMap());
    return result;
  }

  Future<List> getSavedFavourtesFromDB() async {
    var dbClient = await db;
    var result = await dbClient.query(tableName, columns: [columnId, columnTitle, columnImageURL]);
    print(result[0]);
    return result.toList();
  }

  Future<bool> getCard(int id) async {
     var dbClient = await db;
     List<Map> result = await dbClient.query(tableName,
         columns: [columnId],
         where: '$columnId = ?',
         whereArgs: [id]);

     if(result.length > 0) {
       return true;
     }
     return false;
   }

   Future<int> deleteCard(int id) async {
     var dbClient = await db;
     return await dbClient.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
   }


  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

}
