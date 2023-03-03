// @dart=2.9

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbWordManager {
  DbWordManager();
  DbWordManager._privateConstructor();

  static final DbWordManager instance = DbWordManager._privateConstructor();
  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // Instantiate db the first time it is accessed
    _database = await openDb();
    return _database;
  }

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(join(await getDatabasesPath(), "sss.db"),
          version: 1, onCreate: (Database db, int version) async {await db.execute("CREATE TABLE word(id INTEGER PRIMARY KEY autoincrement, engword TEXT, arword TEXT)",);
      } );
    }
  }



















  //---------------------------------------------------------------------
  Future<int> insertWord(Words word) async {
    await openDb();
    return await _database.insert('word', word.toMap());
  }

  Future<List<Words>> getWordList() async {
    await openDb();

    // final List<Map<String, dynamic>> maps = await _database.query('word');
    String query = "SELECT * FROM word";
    final List<Map<String, dynamic>> maps = await _database.rawQuery(query);

    return List.generate(maps.length, (i) {
      return Words(
          id: maps[i]['id'], engword: maps[i]['engword'], arword: maps[i]['arword']);
    });
  }

  Future<int> updateWord(Words word) async {
    await openDb();
    return await _database.update('word', word.toMap(),
        where: "id = ?", whereArgs: [word.id]);
  }

  Future<void> deleteWord(int id) async {
    await openDb();
    await _database.delete(
        'word',
        where: "id = ?", whereArgs: [id]
    );
  }
}

class Words {
  int id;
  String engword;
  String arword;
  Words({@required this.engword, @required this.arword, this.id});
  Map<String, dynamic> toMap() {
    return {'engword': engword, 'arword': arword};
  }
}