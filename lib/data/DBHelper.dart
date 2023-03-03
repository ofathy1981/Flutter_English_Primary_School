// @dart=2.9

import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:primary_secondery_english/data/wordmodel.dart';

class DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String EWORD = 'EWORD';
  static const String AWORD = 'AWORD';

  static const String TABLE = 'AEWORDS';
  static const String DB_NAME = 'AEWORDS2.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $EWORD TEXT,$AWORD TEXT)");
  }

  Future<wordmodel> save(wordmodel word_model) async {
    var dbClient = await db;
    word_model.id = await dbClient.insert(TABLE, word_model.toMap());
    return word_model;
    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
      return await txn.rawInsert(query);
    });
    */
  }

  Future<List<wordmodel>> getWORDS() async {
    var dbClient = await db;
    //List<Map> maps = await dbClient.query(TABLE, columns: [ID,EWORD,AWORD]);
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<wordmodel> words = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        words.add(wordmodel.fromMap(maps[i]));
      }
    }
    return words;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future<int> update(wordmodel word_model) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, word_model.toMap(),
        where: '$ID = ?', whereArgs: [word_model.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}