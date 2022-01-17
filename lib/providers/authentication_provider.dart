import 'dart:io';

import 'package:farmer/db_helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../db_helper/db_helper.dart';

class Auth with ChangeNotifier{
  String? _token;
  String? _email;
  String? _picture;
  String? _name;
  int? _type;
  bool? connected;
  int? dataLoaded;
  String? get token{
    return _token;
  }
  String? get name{
    return _name;
  }
  String? get email{
    return _email;
  }
  String? get picture{
    return _picture;
  }
  int? get type{
    return _type;
  }
  checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        this.connected = true;
      }
    } on SocketException catch (_) {
      this.connected = false;
    }
    notifyListeners();
  }
  Future<void> authenticated() async {
    Database? db = await DatabaseHelper.instance.database;

    var resultData = await db!.query(DatabaseHelper.table);
    if(resultData.length > 0) {
      print('result');
      print(resultData);
      _token = resultData[0]['token'] as String?;
      _email = resultData[0]['email'] as String?;
      _name = resultData[0]['Name'] as String?;
      _picture = resultData[0]['picture'] as String?;
      _type = resultData[0]['UserType'] as int?;
      dataLoaded = 1;
    }
    notifyListeners();
  }
  Future<int> isLogged() async {
    Database? db = await DatabaseHelper.instance.database;

    var resultData = await db!.query(DatabaseHelper.table);

    if(resultData.length > 0){
      print(resultData[0]['Name']);

      _token = resultData[0]['token'].toString();
      _email = resultData[0]['email'].toString();
      _picture = resultData[0]['picture'].toString();
      _name = resultData[0]['Name'].toString();
      _type = 0;
      notifyListeners();
      return 1;

    }
    else{
      notifyListeners();
      return 0;
    }
  }

  Future<void> logout() async {
    print('logout');
    Database? db = await DatabaseHelper.instance.database;

    await db!
        .rawDelete('DELETE FROM '+DatabaseHelper.table);
    _token = '';
    var resultData = await db.query(DatabaseHelper.table);

    notifyListeners();
  }
}