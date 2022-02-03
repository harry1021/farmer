import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farmer/config/config.dart';
import 'package:farmer/presentation/my_flutter_app_icons.dart';
import 'package:farmer/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path_provider/path_provider.dart';
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
  List<File> images = <File>[];
  List<Asset> imageList = <Asset>[];
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
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = imageList[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }
  _loadAssets() async {
    /*File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );
    setState(() {
       _image = image;
    });*/
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 6,
        enableCamera: true,
        selectedAssets: imageList,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Select pictures",
          allViewTitle: "All Pictures",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.


    setState(() {
      imageList = resultList;
    });
    imageList.forEach((element) async {
      var bytes = await element.getByteData();
      final buffer = bytes.buffer;
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      var filePath = tempPath + element.name.toString(); // file_01.tmp is dump file, can be anything
      File image = await new File(filePath).writeAsBytes(
          buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
      setState(() {
        images.add(image);
      });

    });
  }
  /*oid _showPicker(context) {
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
  }*/
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
        child: Column(
          children: <Widget>[
            /*GestureDetector(
              onTap: () {
                _loadAssets();
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
            ),*/
            ElevatedButton(
              child: Text("Pick images"),
              onPressed: _loadAssets,
            ),
            Expanded(
              child: buildGridView(),
            )
          ],
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

          if(images.length == 0){
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
          String apiUrl = Configuration.API_URL + 'postmultipleimages';
          var base64Image;
          var fileName;
          var dio = Dio();
          List<List<String>> base64Images = [];
          for(int i = 0;i<images.length;i++){
            base64Images.add([base64Encode(images[i].readAsBytesSync()),images[i].path.split("/").last]);
          }
          print(base64Images);
          try{
            var response = await dio.post(
                apiUrl,
                data: {
                  "images": base64Images,
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