import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path_provider/path_provider.dart';

import 'auth.dart';

class DBProvider {
  DBProvider._();
  String path;
  static final DBProvider db = DBProvider._();
  static Database _database;
  static final DBProvider _instance = new DBProvider.internal();
  factory DBProvider() => _instance;
  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  DBProvider.internal();
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    path = join(documentsDirectory.path, "OMdatabase.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Weight ("
              "id INTEGER PRIMARY KEY,"
              "name TEXT,"
              "unitId INTEGER,"
              "depends INTEGER,"
              "multiplier REAL"
              ")");
          await db.execute("CREATE TABLE Unit ("
              "id INTEGER PRIMARY KEY,"
              "name TEXT,"
              "sname TEXT,"
              "status INTEGER"
              ")");
          await db.execute("CREATE TABLE User ("
              "Token INTEGER,"
              "username TEXT,"
              "joiningDate TEXT,"
              "email TEXT,"
              "userId INTEGER,"
              "cityId INTEGER,"
              "city TEXT,"
              "usercontact TEXT,"
              "sellerContact TEXT,"
              "sellername TEXT,"
              "area TEXT"
              ")");
          await db.execute("CREATE TABLE dlvryAddress("
              "id INTEGER ,"
              "user_id INTEGER,"
              "coordinates TEXT,"
              "Address TEXT,"
              "is_primary TEXT"
              ")");
        });
  }

  dlvryAddress(int id, int userId, String coordinates, String Address,
      String is_primary) async {
    var dbclient = await database;
    var res = await dbclient.rawInsert(
        'INSERT INTO dlvryAddress(id,user_id,coordinates,Address,is_primary) VALUES(?,?,?,?,?)',
        [id, userId, coordinates, Address, is_primary]);
    return res;
  }

  Login(
      String token,
      String username,
      String joiningDate,
      String email,
      int userId,
      int cityId,
      String city,
      String usercontact,
      String sellerContact,
      String sellername,
      String area) async {
    var dbClient = await database;
    var response = await getLogin();
    if (response.length > 0) {
      deleteUser();
    }
    var resp = await getLogin();
    var res = await dbClient.rawInsert(
        'INSERT INTO User(Token, username,joiningDate,email,userId,cityId,city,usercontact,sellerContact,sellername,area) VALUES(?, ?,?,?,?,?,?,?,?,?,?)',
        [
          token,
          username,
          joiningDate,
          email,
          userId,
          cityId,
          city,
          usercontact,
          sellerContact,
          sellername,
          area
        ]);
    return res;
  }

  updlvryadd(id, coordinates, address, is_primary) async {
    var dbClient = await database;
    var res = await dbClient.rawQuery(
        "UPDATE dlvryAddress SET coordinates='$coordinates',Address='$address',is_primary='$is_primary' where id=$id");
    print("responce");
    print(res.length);
    return res;
  }

  userupdate(usercontact) async {
    var dbClient = await database;
    var res =
    await dbClient.rawQuery("UPDATE User SET usercontact=$usercontact");
    return res;
  }

  deleteUser() async {
    var dbClient = await database;
    dbClient.execute("delete from  User");
  }

  dltdlvryadd(id) async {
    var dbClient = await database;
    var res = await dbClient.rawDelete("DELETE FROM dlvryAddress WHERE id=id");
    return res;
  }

  getLogin() async {
    var dbClient = await database;
    var result = await dbClient.rawQuery("SELECT * FROM User");
    return result;
  }

  Future<List> getAllRecords(String dbTable) async {
    var dbClient = await database;
    var result = await dbClient.rawQuery("SELECT * FROM $dbTable");
    return result.toList();
  }

  getdlvryaddress() async {
    var dbClient = await database;
    var result = await dbClient.rawQuery("SELECT * FROM dlvryAddress");
    return result;
  }

  getweight(id) async {
    var dbClient = await database;
    // var result = await dbClient.rawQuery("SELECT * FROM $dbTable");
    var result =
    await dbClient.query("Weight", where: "unitId = ?", whereArgs: [id]);

    return result;
  }

  getWeightData(id) async {
    var dbClient = await database;
    // var result = await dbClient.rawQuery("SELECT * FROM $dbTable");
    var result =
    await dbClient.query("Weight", where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future getUnit(id) async {
    var dbClient = await database;
    // var result = await dbClient.rawQuery("SELECT * FROM $dbTable");
    var result = await dbClient.query("Unit", where: "id = ?", whereArgs: [id]);
    return result;
  }
}