import 'package:farmer/Sizeconfig.dart';
import 'package:farmer/config/config.dart';
import 'package:farmer/helpers/location_helper.dart';
import 'package:farmer/presentation/my_flutter_app_icons.dart';
import 'package:farmer/providers/ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlng/latlng.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleViewPage extends StatefulWidget {
  var id;
  SingleViewPage(this.id);
  @override
  _SingleViewPageState createState() => _SingleViewPageState(this.id);
}

class _SingleViewPageState extends State<SingleViewPage> {
  var id;

  _SingleViewPageState(this.id);
  String? _previewImageUrl = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Future<void> _getLocation(data) async {
    if(_previewImageUrl == null){
      var coordinates = data.split(',');
      double lat =  double.parse(coordinates[0]);
      double long = double.parse(coordinates[1]);
      final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: lat,
        longitude: long,
      );
      setState(() {
        _previewImageUrl = staticMapImageUrl;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Ads ads = Provider.of<Ads>(context);
    var ad = ads.getad(id);
    _getLocation(ad.lat_long);
    return Scaffold(
      //backgroundColor: Color(0xffe6e6e6),
      //backgroundColor: Theme.of(context).primaryColor,
      //backgroundColor: Color(0xff336600),
      appBar: AppBar(
        //leading: Icon(Icons.location_on,color: Color(0xff336600),size:30),
        backgroundColor: Theme.of(context).primaryColor,
        //backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xffe6e6e6),
              child: ad.attachment != null || ad.attachment != '' ?
              Image.network(Configuration.PUBLIC_URL+ad.attachment.toString(),
                width: MediaQuery.of(context).size.width,
                height: 200,
              ) :
              Image.asset('assets/images/new-holland.png',
                width: MediaQuery.of(context).size.width,
                height: 200,
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15,right: 20,bottom: 20,top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height:(8)),
                        Text(ad.adtitle.toString(),style: AppThemes.mainTitle),
                        SizedBox(height:(8)),
                        Row(
                          children: <Widget>[
                            Icon(MyFlutterApp.rupee,size: 18),
                            Text(ad.price.toString(),style: AppThemes.mainTitle),
                          ],
                        ),
                        SizedBox(height:(5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('2017 - '),
                            Expanded(child: Text(' 70,0000km',style: AppThemes.title)),
                          ],
                        ),
                        SizedBox(height:(8)),
                        Row(
                          children: <Widget>[
                            Icon(MyFlutterApp.location,size: 15,),
                            Text(ad.location.toString(),style: AppThemes.mainTitle),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(height:8,color: Colors.black12),
                  Container(
                    padding: EdgeInsets.only(left: 15,right: 20,bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 20,bottom: 10),
                          child: Text('Description:',style:AppThemes.detail),
                        ),
                        SizedBox(height:(5)),
                        Text(ad.desc.toString(),style: AppThemes.description),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        border: Border.all(
                          color: Colors.black,
                          width: 1.2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Icon(Icons.person,color:Colors.black,size: 30,),
                    ),
                    title: Text(ad.user.toString()),
                  ),
                  Divider(),
                  /* google static map code*/
                  /*Container(
                   padding: EdgeInsets.fromLTRB(0,0,0,0),
                    child: _previewImageUrl == null
                        ? Text('Not Now')
                        : Image.network(
                      _previewImageUrl!,
                      fit: BoxFit.cover,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),*/
                  // Image.asset('assets/images/map.jpg',width: MediaQuery.of(context).size.width,)
                ],
              )
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border.all(
                    color: Colors.white,
                    width: 0,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(MyFlutterApp.phone,color: Colors.white),
                    SizedBox(width:10),
                    Text('Phone',style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              onTap:() {
                launch("tel://"+ad.contactno.toString());
              },
            ),

          ],
        ),

      ),
    );
  }}



