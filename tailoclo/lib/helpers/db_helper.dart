import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'dart:io' as io;

import 'package:tailoclo/models/order.dart';

class DBHelper {
  static sql.Database _db;
  static const String TABLE = 'me';
  static const String DB_NAME = 'tailoclo.db';

  Future<sql.Database> get db async {
    if(_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  initDB() async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String dbPath = path.join(documentsDirectory.path, DB_NAME);
    var db = await sql.openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(sql.Database db, int version) async{
    await db.execute('''CREATE TABLE clientInfo(id TEXT PRIMARY KEY, name TEXT, tallSize TEXT, armSize TEXT, waistSize TEXT,pocketSize TEXT,
        chestRotation TEXT, waistRotation TEXT, sidesRotation TEXT, shouldersSize TEXT)''');
    await  db.execute('''CREATE TABLE orders(id TEXT, payed TEXT, totalPrice TEXT, moreDetails TEXT,
        image TEXT, deadline TEXT)''');
  }

  Future<void> insert(String table,Map<String, Object> data) async{
    var dbClient = await db;
    await dbClient.insert(table, data);
  }

  Future<List<Map>> getData(String table) async{
    var dbClient = await db;
    return dbClient.query(table);
  }
}