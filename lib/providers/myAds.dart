import 'package:dio/dio.dart';
import 'package:farmer/config/config.dart';
import 'package:flutter/cupertino.dart';

class MyAds extends ChangeNotifier {
  List<AdResult> _results = [];
  String? _id;
  String? _adtitle;
  String? _desc;
  String? _user;
  String? _attachment;
  String? _price;
  int? dataLoaded = 0;

  MyAds([this._id, this._adtitle, this._desc,this._user,this._attachment, this._price]);

  MyAds.map(dynamic obj){
    this._id = obj["id"];
    this._adtitle = obj["adtitle"];
    this._desc = obj["desc"];
    this._user = obj["user"];
    this._attachment = obj["attachment"];
    this._price = obj["price"];
  }
  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["adtitle"] = _adtitle;
    map["desc"] = _desc;
    map["user"] = _user;
    map["attachment"] = _attachment;
    map["price"] = _price;
    return map;
  }
  AdResult getad(id){
    return _results.firstWhere((element) => element.id == id);
  }
  getads(token) async {
    var dio = Dio();
    dio.options.headers['accept'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${token}";
    try {
      final response = await dio
          .get(Configuration.API_URL + "getuserads");
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        print(response.data['data']);
        for (int i = 0; i < response.data['data'].length; i++) {
          AdResult result = AdResult(response.data['data'][i]);
          _results.add(result);
        }
        dataLoaded = 1;
        notifyListeners();
        //Ads.fromJson(response.data);
      } else {
        dataLoaded = 1;
        // If that call was not successful, throw an error.
        throw Exception('Failed to load post');
      }
    }
     on DioError catch(error){
      print(error.response.data);
    }
  }
  /*Ads.fromJson(Map<String, dynamic> parsedJson) {
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['data'].length; i++) {
      _Result result = _Result(parsedJson['data'][i]);
      temp.add(result);
    }
    this._results = temp;
    print('entered');
    this.dataLoaded = 1;
    notifyListeners();
  }
*/
  List<AdResult> get addata => _results;

}

class AdResult {
  int? _id;
  String? _adtitle;
  String? _desc;
  int? _user;
  String? _attachment;
  String? _contactno;
  String? _location;
  String? _latlong;
  String? _price;

  AdResult(result) {
    _id = result['id'] as int;
    _adtitle = result['adtitle'] as String;
    _desc = result['desc'] as String;
    _user = result['userid'] as int;
    _contactno = result['contactno'] as String;
    _attachment = result['attachment'] as String;
    _location = result['location']  as String;
    _latlong = result['lat_long']  as String;
    _price = result['price'] as String;
  }

  int? get id => _id;
  String? get adtitle => _adtitle;
  String? get desc => _desc;
  int? get user => _user;
  String? get attachment => _attachment;
  String? get location => _location;
  String? get contactno => _contactno;
  String? get lat_long => _latlong;
  String? get price => _price;
}