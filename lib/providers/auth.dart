import 'dart:async' as prefix0;
import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:onlinemandi/providers/weights.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:global_configuration/global_configuration.dart';
import '../models/http_exception.dart';
import 'UserAddressBook.dart';
import 'intercept.dart';
import 'package:sqflite/sqflite.dart';
import 'database.dart';

class Auth with ChangeNotifier {
  var dbprovider = DBProvider();

  String _token;
  DateTime _expiryDate;
  String _email;
  String username;
  int _cityId;
  String _city;
  String joiningDate;
  String contact1;
  String sellerContact1;
  String sellername;
  String userarea;
  int _userId;
  Dio dio = Dio();
  Timer _authTimer;
  bool isMantainance;
  bool isprocessing = false;
  List<DropdownModel> states = [];
  List<DropdownModel> _cities = [];
  List<DropdownModel> _emptyCities = [];
  List<DropdownModel> _area = [];
  List<DropdownModel> loadedStates = [];
  List<Addresscheckbox> useradrs = [];

  Auth() {
    checkMantainance();
    checkLogin();
    getdlvy();
  }

  static Database _db;

  bool get isAuth {
    return token != null;
  }

  /*List<DropdownModel> get states {
    return [..._states];
  }*/

  List<DropdownModel> get cities {
    return [..._cities];
  }

  List<DropdownModel> get area {
    return [..._area];
  }

  List<DropdownModel> get emptyCities {
    return [..._emptyCities];
  }

  String get token {
    /*if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {*/
    if (_token != null) {
      return _token;
    }
    return null;
  }

  Future<bool> checkMantainance() async {
    var url = GlobalConfiguration().getValue('baseURL') + 'settings';
    var response = await http.get(url, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      if (body['success']['setting_key'] == 'mantainance' &&
          body['success']['value'] == '1') {
        isMantainance = true;
      } else {
        isMantainance = false;
      }
    }
    notifyListeners();
  }

  checkLogin() async {
    this.isprocessing = true;
    List response = await dbprovider.getLogin();
    if (response.length > 0) {
      this._token = response[0]['Token'];
    } else {
      this._token = null;
    }
    this.isprocessing = false;
    notifyListeners();
  }

  Future forgotpasswordrequest(email, mode) async {
    final url = GlobalConfiguration().getValue("baseURL") + 'forget-password';
    var response;
    try {
      if (mode == 'email') {
        response = await dio.post(url, data: {'email': email});
      } else {
        response = await dio.post(url, data: {'mobile': email});
      }

      if (response.statusCode == 200) {
        return response.data['msg'];
      } else {
        return 'error';
      }
    } catch (e) {
      print(e);
    }
  }

  Future forgot_password() async {
    final url = GlobalConfiguration().getValue("baseURL") + 'forget-password';
    try {
      var response = await dio.get(url);
      print(response.statusCode);
    } catch (e) {}
  }

  Future changePassword(email, otp, password, method) async {
    final url = GlobalConfiguration().getString("baseURL") +
        'index/change-app-password';
    var response;

    try {
      if (method == 'email') {
        response = await dio.post(url,
            data: {'email': email, 'otp': otp, 'password': password});
      } else {
        response = await dio.post(url,
            data: {'mobile': email, 'otp': otp, 'password': password});
      }
      if (response.statusCode == 200) {
        return response.data['msg'];
      } else {
        return 'error';
      }
    } catch (e) {
      //(e);
    }
  }

  Future<void> _authenticate(String email, String password) async {
    final url = GlobalConfiguration().getValue("baseURL") + 'login';
    print(url);
    try {
      final response = await dio.post(
        url,
        data: {'email': email, 'password': password},
      );

      final responseData = response.data;
      if (response.statusCode != 200) {
        return 'Login failed, please try again.';
      }
      if (response.statusCode == 200) {
        username = responseData['success']['name'];

        _token = responseData['success']["token"];
        joiningDate = responseData['success']["joining_date"];
        _email = responseData['success']["email"];
        _userId = responseData['success']["user_id"];
        _cityId = responseData['success']["city_id"];
        _city = responseData['success']["city_name"];
        contact1 = responseData['success']["phone_number"];
        sellerContact1 = responseData['success']["seller_phone"];
        sellername = responseData['success']["seller_name"];
        userarea = responseData['success']["area_name"];

        dbprovider.Login(_token, username, joiningDate, _email, _userId,
            _cityId, _city, contact1, sellerContact1, sellername, userarea);

        Weights weightsObj = new Weights(_token);
        await weightsObj.fetchAndSetWeights();
        notifyListeners();
      }
    } catch (error) {
      throw error;
    }
  }

  getStates() async {
    var url = GlobalConfiguration().get("baseURL") + 'states';
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);
        var extractedData = json.decode(response.body);
        if (extractedData['success'] == null) {
          return;
        }
        states = [];
        extractedData['success'].forEach((prodData) {
          states.add(DropdownModel(
            id: prodData['id'],
            name: prodData['name'],
          ));
        });
      }
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> getCities(int entity) async {
    var url = GlobalConfiguration().getValue("baseURL") +
        'cities/' +
        entity.toString();

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body);
        if (extractedData['success'] == null) {
          return;
        }
        _cities = [];
        extractedData['success'].forEach((data) {
          _cities.add(DropdownModel(
            id: data['id'],
            name: data['name'],
          ));
        });
      }
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future getdlvy() async {
    var url = GlobalConfiguration().getValue("baseURL") + 'delivery-addresses';

    try {
      var response = await dio.get(
        url,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ' + this.token,
            HttpHeaders.acceptHeader: 'application/json' // set content-length
          },
        ),
      );
      useradrs = [];
      if (response.statusCode == 200) {
        for (int i = 0; i < response.data['success'].length; i++) {
          this.useradrs.add(Addresscheckbox(
              id: response.data['success'][i]['id'],
              user_id: response.data['success'][i]['user_id'].runtimeType == int
                  ? response.data['success'][i]['user_id']
                  : int.parse(response.data['success'][i]['user_id']),
              coordinates: response.data['success'][i]['coordinates'],
              address: response.data['success'][i]['address'],
              is_primary:
              response.data['success'][i]['is_primary'].runtimeType == int
                  ? response.data['success'][i]['is_primary'].toString()
                  : response.data['success'][i]['is_primary'],
              Status: response.data['success'][i]['status'].runtimeType == int
                  ? response.data['success'][i]['status'].toString()
                  : response.data['success'][i]['status']));
        }
        for (int i = 0; i < useradrs.length; i++) {
          DBProvider.db.dlvryAddress(
              useradrs[i].id,
              useradrs[i].user_id,
              useradrs[i].coordinates,
              useradrs[i].address,
              useradrs[i].is_primary);
          if (useradrs[i].Status == "0") {
            useradrs[i].Status = "Pending";
          } else if (useradrs[i].Status == "1") {
            useradrs[i].Status = "Approved";
          } else
            useradrs[i].Status = "Declined";
        }
      }
      this.isprocessing = false;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future adddlvry(coordinates, address, primary) async {
    var url =
        GlobalConfiguration().getValue("baseURL") + 'add-delivery-addresses';
    try {
      final response = await dio.post(url,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer ' + this.token,
              HttpHeaders.acceptHeader: 'application/json' // set content-length
            },
          ),
          data: {
            'coordinates': coordinates,
            'address': address,
            'is_primary': primary,
          });
      if (response.statusCode == 200) {
        await getdlvy();
        Fluttertoast.showToast(
            msg: "Address Added",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 3,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      notifyListeners();
      return response.statusCode;
    } on DioError catch (e) {
      print(e.response.data);
      throw e;
    }
  }

  Future updtdlvyadd(
      id,
      coordinates,
      address,
      primary,
      ) async {
    var url = GlobalConfiguration().getValue("baseURL") +
        'update-delivery-addresses/' +
        id.toString();

    try {
      final response = await dio.post(url,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer ' + this.token,
              HttpHeaders.acceptHeader: 'application/json' // set content-length
            },
          ),
          data: {
            'coordinates': coordinates,
            'address': address,
            'is_primary': primary,
          });
      if (response.statusCode == 200) {
        this.useradrs.firstWhere((Address) => Address.id == id).address =
            address;
        dbprovider.updlvryadd(id, coordinates, address, primary);
        Fluttertoast.showToast(
            msg: "Address Updated",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      notifyListeners();
      return response.statusCode;
    } on DioError catch (e) {
      //print("checkerror");
      print(e.response.data);
      throw e;
    }
  }

  Future dltdvryadd(id) async {
    var url = GlobalConfiguration().getValue("baseURL") +
        'delete-delivery-addresses/' +
        id.toString();

    try {
      final response = dio.post(
        url,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ' + this.token,
            HttpHeaders.acceptHeader: 'application/json' // set content-length
          },
        ),
      );
      await useradrs.removeWhere((item) => item.id == id);
      dbprovider.dltdlvryadd(id);
      /*  if (response == 200) {
        dbprovider.dltdlvryadd(id);
        await getdlvy();
        Fluttertoast.showToast(
            msg: "Address Deleted",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }*/
      notifyListeners();
    } catch (e) {
      print(e.response.data);
      throw e;
    }
  }

  getarea(int entity) async {
    var url = GlobalConfiguration().getValue("baseURL") +
        'areas/' +
        entity.toString();

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body);
        if (extractedData['success'] == null) {
          return;
        }
        _area = [];
        extractedData['success'].forEach((data) {
          _area.add(DropdownModel(
            id: data['id'],
            name: data['name'],
          ));
        });
      }
      //notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> signup(String name, String phone, String email, String city_id,
      String password, String cpassword, String area_id) async {
    final url = GlobalConfiguration().get("baseURL") + 'register';
    try {
      final response = await http.post(
        url,
        body: {
          'name': name,
          'phone': phone,
          'email': email,
          'city_id': city_id,
          'password': password,
          'cpassword': cpassword,
          'area_id': area_id,
        },
      );
      final responseData = json.decode(response.body);
      if (response.statusCode != 200) {
        throw HttpException(responseData['error']['message']);
      }
      return _authenticate(email, password);
    } catch (error) {
      throw error;
    }
  }

  Future login(String email, String password) async {
    return _authenticate(email, password);
  }

/*  Future<bool> tryAutoLogin() {
    dbprovider.getLogin().then((data) {
      data.forEach((element) {
        _token = element['Token'];
      });
      notifyListeners();
      return true;
    });
  }*/

  Future<void> logout() async {
    _token = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    dbprovider.deleteUser();
    notifyListeners();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

}