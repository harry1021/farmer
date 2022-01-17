import 'package:dio/dio.dart';
import 'package:farmer/config/config.dart';
import 'package:flutter/cupertino.dart';

class Categories extends ChangeNotifier{
  List<_Result> _results = [];

  int dataLoaded = 0;

  List<_Result> get categories => _results;
  getCategories() async {
    var dio = Dio();
    final response = await dio
        .get(Configuration.API_URL+"getcategories");
    if (response.statusCode == 200) {
      print(response.data);
      // If the call to the server was successful, parse the JSON
      for (int i = 0; i < response.data['data'].length; i++) {
        _Result result = _Result(response.data['data'][i]);
        _results.add(result);
      }
      dataLoaded = 1;
      notifyListeners();
      //Ads.fromJson(response.data);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}

class _Result {
  int? _id;
  String? _category_name;
  String? _category_icon;

  _Result(result) {
    _id = result['id'];
    _category_name = result['category_name'];
    _category_icon = result['category_icon'];

  }
  int? get id => _id;
  String? get category_name => _category_name;
  String? get category_icon => _category_icon;
}