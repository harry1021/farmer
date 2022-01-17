import 'package:dio/dio.dart';
import 'package:farmer/config/config.dart';
import 'package:flutter/cupertino.dart';

class Ads extends ChangeNotifier {
  List<_Result> _results = [];
  List<_Result> _tempResults = [];
  String? _id;
  String? _adtitle;
  String? _desc;
  String? _user;
  String? _attachment;
  String? _price;
  int? dataLoaded = 0;

  Ads([this._id, this._adtitle, this._desc,this._user,this._attachment, this._price]);

  Ads.map(dynamic obj){
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
   _Result getad(id){
    return _results.firstWhere((element) => element.id == id);
  }
    searchAds(String searchText){
    if(searchText.length >0) {
      _results =
          _tempResults.where((element) => element.adtitle!.contains(searchText))
              .toList();
    }
    else{
      _results = _tempResults;
    }
      notifyListeners();
    }
   getads() async {
    var dio = Dio();
    final response = await dio
        .get(Configuration.API_URL+"getads");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      for (int i = 0; i < response.data['data'].length; i++) {
        _Result result = _Result(response.data['data'][i]);
        _results.add(result);
      }
      _tempResults = _results;
      dataLoaded = 1;
      notifyListeners();
      //Ads.fromJson(response.data);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
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
  List<_Result> get addata => _results;

}

class _Result {
  int? _id;
  String? _adtitle;
  String? _desc;
  String? _user;
  String? _profilePicture;
  String? _attachment;
  String? _contactno;
  String? _location;
  String? _latlong;
  String? _price;

  _Result(result) {
    _id = result['id'] as int;
    _adtitle = result['adtitle'] as String;
    _desc = result['desc'] as String;
    _user = result['user']['username'] as String;
    _profilePicture = result['user']['profileImage'] as String;
    _contactno = result['contactno'] as String;
    _attachment = result['attachment'] as String;
    _location = result['location']  as String;
    _latlong = result['lat_long']  as String;
    _price = result['price'] as String;
  }

  int? get id => _id;
  String? get adtitle => _adtitle;
  String? get desc => _desc;
  String? get user => _user;
  String? get profilePicture => _profilePicture;
  String? get attachment => _attachment;
  String? get location => _location;
  String? get contactno => _contactno;
  String? get lat_long => _latlong;
  String? get price => _price;
}