import 'package:farmer/config/config.dart';
import 'package:farmer/helpers/location_helper.dart';
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
      backgroundColor: Colors.white,
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
            ad.attachment != null || ad.attachment != '' ?
            Image.network(Configuration.PUBLIC_URL+ad.attachment.toString(),
              width: MediaQuery.of(context).size.width,
              height: 200,
            ) :
            Image.asset('assets/images/new-holland.png',
              width: MediaQuery.of(context).size.width,
              height: 200,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height:(5)),
                  Text(ad.adtitle.toString()),
                  SizedBox(height:(5)),
                  Row(
                    children: <Widget>[
                      Text(' RS: '),
                      Text(ad.price.toString()),
                    ],
                  ),
                  SizedBox(height:(5)),
                  Row(
                    children: <Widget>[
                      Icon(Icons.location_on,size: 15,),
                      Text(ad.location.toString()),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Description'),
                  SizedBox(height:(5)),
                  Text(ad.desc.toString()),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  //color: Theme.of(context).primaryColor,
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
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
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
                    Icon(Icons.phone,color: Colors.white),
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



