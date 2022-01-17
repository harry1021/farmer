import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farmer/config/config.dart';
import 'package:farmer/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import 'register_page.dart';
import 'sell_formimages.dart';

class SellFormPage extends StatefulWidget {
  int? id;
  SellFormPage(this.id);
  @override
  _SellFormState createState() => _SellFormState(this.id);
}

class _SellFormState extends State<SellFormPage> {
  int? id;
  TextEditingController adtitle = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String location = '';
  String latLong = '';
  Position? position;
  LocationPermission? permission;
  bool loading = false;
  _SellFormState(this.id);

  getPermission() async {
    permission = await Geolocator.requestPermission();
    getLocation();
  }
  getLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('location');
    print(position!.latitude.toString()+','+position!.longitude.toString());
    List<Placemark> placemarks = await placemarkFromCoordinates(position!.latitude, position!.longitude);
    print(placemarks[0].name);
    setState(() {
      location = placemarks[0].name.toString();
      latLong = position!.latitude.toString()+','+position!.longitude.toString();
    });

  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    if(auth.dataLoaded == 0 || auth.dataLoaded == null){
      auth.authenticated();
    }
    if(permission == null){
      getPermission();
    }
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Color(0xffe6e6e6),
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0.0,automaticallyImplyLeading: false,),
      body: loading == true ? Center(child: CircularProgressIndicator(),) : Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
            children: <Widget>[
              Container(
                padding:const EdgeInsets.all(5),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.2,
                    style: BorderStyle.solid,
                  ),
                  boxShadow: [ //background color of box
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius:5.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        1.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Icon(Icons.directions_car,color:Colors.white,size: 50,),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height:18),
                      TextFormField(
                        controller: adtitle,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter ad title!';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Item name',
                          labelStyle: TextStyle(
                              color:Colors.black
                          ),
                          fillColor: Colors.black,
                          //hintText: 'Enter Email'
                          border: new UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.black
                            ),
                          ), //
                        ),
                        keyboardType :
                        TextInputType.text,
                      ),
                      SizedBox(height:18),
                      TextFormField(
                        controller: desc,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter ad description!';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Item Description',
                          labelStyle: TextStyle(
                              color:Colors.black
                          ),
                          fillColor: Colors.black,
                          //hintText: 'Enter Email'
                          border: new UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.black
                            ),
                          ), //
                        ),
                        keyboardType :
                        TextInputType.text,
                        maxLength: 190,
                        maxLines: 5,
                      ),
                      SizedBox(height:18),
                      TextFormField(
                        controller: price,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter price';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Item Price',
                          labelStyle: TextStyle(
                              color:Colors.black
                          ),
                          fillColor: Colors.black,
                          //hintText: 'Enter Email'
                          border: new UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.black
                            ),
                          ), //
                        ),
                        keyboardType :
                        TextInputType.number,
                      ),
                      SizedBox(height:18),
                      TextFormField(
                        controller: contactNo,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter contact number!';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Contact number',
                          labelStyle: TextStyle(
                              color:Colors.black
                          ),
                          fillColor: Colors.black,
                          //hintText: 'Enter Email'
                          border: new UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.black
                            ),
                          ), //
                        ),
                        keyboardType :
                        TextInputType.phone,
                        maxLength: 10,
                      ),
                      SizedBox(height:40),
                    ],
                  )
              ),
              /*InkWell(
                child: Container(
                  padding: EdgeInsets.all(18),
                  width: MediaQuery.of(context).size.width/ 1,
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.2,
                      style: BorderStyle.solid,
                    ),
                    boxShadow: [ //background color of box
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius:5.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                        offset: Offset(
                          1.0, // Move to right 10  horizontally
                          5.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Center(
                    child: Text('Next',style: TextStyle(color: Colors.white),),
                  ),
                ),
                onTap:() {
                  Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){return SellFormImages();
                  }));
                },
              ),*/
            ],
          )
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        child: Container(
          height: 50,
          padding: EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width/ 1,
          decoration: BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
            border: Border.all(
              color: Colors.white,
              width: 1.2,
              style: BorderStyle.solid,
            ),
            boxShadow: [ //background color of box
              BoxShadow(
                color: Colors.black12,
                blurRadius:5.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  1.0, // Move to right 10  horizontally
                  5.0, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
          child: Center(
            child: Text('Next',style: TextStyle(color: Colors.white),),
          ),
        ),
        onTap:() async {
          if (_formKey.currentState!.validate()) {
            setState(() {
              loading = false;
            });

            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            var dio = Dio();
            dio.options.headers['Accept'] = 'application/json';
            try{
              print( 'latLong');
              print( latLong);
              var response = await dio.post(
                  Configuration.API_URL+'sellitem',
                  data:{'adtitle': adtitle.text, 'desc': desc.text, 'price': price.text, 'contactno': contactNo.text, 'category': id.toString(), 'location': location, 'latlong': latLong},
                  options: Options(
                  headers: {
                  HttpHeaders.authorizationHeader: "Bearer ${auth.token}",
                  HttpHeaders.acceptHeader:"application/json",
              }
                  ));


          setState(() {
          loading = false;
          });
          Fluttertoast.showToast(
          msg: "Advertisement added!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
          );
          Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){return SellFormImages(response.data['adId']); }));

          }on DioError catch (e) {
          loading = false;
          print(e.response.data);
          Fluttertoast.showToast(
          msg: e.response.data['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
          );

          }
        }

        },
      ),
    );
  }
}