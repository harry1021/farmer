import '../db_helper/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class Users {
  String token;
  String email;
  String picture;
  String name;
  int userType;

  Users(this.token,this.name,this.email,this.picture,this.userType);

  factory Users.fromJson(dynamic json) {
    return Users(json['token'] as String, json['data']['username'] as String, json['data']['email'] as String , '' as String, 0 as int);
  }


  @override
  String toString() {
    return '{ ${this.token}, ${this.email }, ${this.picture }, ${this.name } , ${this.userType } }';
  }
}

/*class UserProfile{
  String name;
  String email;
  String phone;
  String address;
  String city;
  UserProfile(this.name,this.email,this.phone,this.address,this.city);
  factory UserProfile.fromJson(dynamic json) {
    return UserProfile(
      json['name'] as String,
      json['email'] as String,
      json['profile']['phone'] as String,
      json['profile']['address'] as String,
      json['profile']['address'] as String,
    );
  }
}*/
class Result {
  Users success;

  Result(this.success);

  factory Result.fromJson(dynamic json) {
    return Result( Users.fromJson(json));
  }

  @override
  String toString() {
    return '{ ${this.success} }';
  }
}