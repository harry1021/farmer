import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farmer/config/config.dart';
import 'package:farmer/presentation/my_flutter_app_icons.dart';
import 'package:farmer/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'register_page.dart';
import 'sell_formlocation.dart';
import 'tab_controller.dart';

class SellFormImages extends StatefulWidget {
  var id;
  SellFormImages(this.id);
  @override
  _SellFormState createState() => _SellFormState(this.id);
}

class _SellFormState extends State<SellFormImages> {
   File? _image;

   final ImagePicker _picker = ImagePicker();
   var id;
  bool loading = false;
   _SellFormState(this.id);
  _imgFromCamera() async {
    // Capture a photo
    final File? image = await ImagePicker.pickImage(source: ImageSource.camera);
    /*File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );*/

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library,color: Colors.black,size: 24,),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera,color: Colors.black,size: 24,),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    if(auth.dataLoaded == null || auth.dataLoaded == 0){
      auth.authenticated();
    }
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Color(0xffe6e6e6),
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor,elevation: 2.0,),
      body: loading == true ? Center(child: CircularProgressIndicator(),) : Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color:Color(0xffe6e6e6),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              /*Container(
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
                child: Icon(Icons.perm_media,color:Colors.white,size: 50,),
              ),
              SizedBox(height:60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding:const EdgeInsets.all(5),
                    width: 80,
                    height: 80,
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
                    child: Icon(Icons.image,color:Colors.white,size: 30,),
                  ),

                  Container(
                    padding:const EdgeInsets.all(5),
                    width: 80,
                    height: 80,
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
                    child: Icon(Icons.camera_enhance,color:Colors.white,size: 30,),
                  ),
                ],
              ),
              SizedBox(height:40),

              SizedBox(height:40),*/
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.transparent,
                    child: _image != null
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            _image!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        )
                        : Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            border: Border.all(
                              color: Colors.white,
                              width: 1.2,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          width: 100,
                          height: 100,
                          child: Icon(
                            MyFlutterApp.device_camera,color:Colors.white,size: 45,
                          ),
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        child: Container(
          height: 50,
          padding: EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width/ 1,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
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

          if(_image == null){
            Fluttertoast.showToast(
                msg: "Please select image!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
            return;
          }
          setState(() {
            loading = true;
          });
          var file = _image;
          print('upload camera image');
          String apiUrl = Configuration.API_URL + 'upload_image';
          var base64Image;
          var fileName;
          var dio = Dio();
          base64Image = base64Encode(file!.readAsBytesSync());
          fileName = file.path.split("/").last;
          try{
            var response = await dio.post(
                apiUrl,
                data: {
                  "image": base64Image,
                  "name": fileName,
                  "id": '$id',
                },
                options: Options(
                    headers: {
                      HttpHeaders.authorizationHeader: "Bearer "+auth.token.toString(),
                      HttpHeaders.acceptHeader:"application/json",
                    }
                )
            );
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
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TabPage()),(route) => false,);
          }
          on DioError catch (e) {
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

        },
      ),
    );
  }

}