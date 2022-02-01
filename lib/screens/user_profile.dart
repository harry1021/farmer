import 'package:farmer/config/config.dart';
import 'package:farmer/presentation/my_flutter_app_icons.dart';
import 'package:farmer/providers/authentication_provider.dart';
import 'package:farmer/providers/myAds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Sizeconfig.dart';
import 'single_view.dart';
//import 'package:universalfarmers/singleview.dart';


class UserProfile extends StatelessWidget {
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    final Myads = Provider.of<MyAds>(context);
    if(auth.dataLoaded == null || auth.dataLoaded == 0){
      auth.authenticated();
    }
    if(auth.dataLoaded == 1 && auth.token != ''){
      if(Myads.dataLoaded == 0) {
          Myads.getads(auth.token);
      }
    }
    return Scaffold(
      backgroundColor: Color(0xffe6e6e6),
      appBar: AppBar(
        elevation: 2.0,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Profile'),
      ),
      body: Column(
        children:[
          Container(
            padding:const EdgeInsets.all(5),
            margin:const EdgeInsets.only(bottom:20,top: 15),
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
            child: Icon(Icons.person,color:Colors.white,size: 50,),
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            leading: (Text('Name',style: AppThemes.detail)),
            trailing: (Text(auth.name.toString(),style: AppThemes.subtitle)),
          ),
          Divider(),
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            leading: (Text('Join date',style: AppThemes.detail)),
            trailing: (Text('22/1/2022',style: AppThemes.subtitle)),
          ),
          Divider(),
          ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            leading: (Text('Email',style: AppThemes.detail)),
            trailing: (Text(auth.email.toString(),style: AppThemes.subtitle)),
          ),

          Divider(),
          Expanded(
              child: Myads.dataLoaded == 0 ? Center(child: CircularProgressIndicator(),) :GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: Myads.addata.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      height: 2,
                      child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                            padding: const EdgeInsets.only(left: 10,right: 10, top: 10,bottom: 5),
                            margin: const EdgeInsets.all(3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Myads.addata[index].attachment != null || Myads.addata[index].attachment != '' ?
                                Image.network(Configuration.PUBLIC_URL+Myads.addata[index].attachment.toString(),
                                  width: MediaQuery.of(context).size.width,
                                  height: 80,
                                ) :
                                Image.asset('assets/images/new-holland.png',
                                  width: MediaQuery.of(context).size.width,
                                  height: 80,
                                ),
                                SizedBox(height:(3)),
                                Expanded(child: Text(Myads.addata[index].adtitle.toString(),maxLines: 1,overflow: TextOverflow.ellipsis,
                                    style: AppThemes.title)),
                                SizedBox(height:(3)),
                                Row(
                                  children: <Widget>[
                                    Icon(MyFlutterApp.rupee,size: 16,),
                                    Expanded(child: Text(Myads.addata[index].price.toString(),maxLines: 1,overflow: TextOverflow.ellipsis,
                                        style: AppThemes.title)),
                                  ],
                                ),
                                SizedBox(height:(3)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text('2017 - '),
                                    Expanded(child: Text(' 70,0000km',style: AppThemes.title)),
                                  ],
                                ),
                                SizedBox(height:(3)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(MyFlutterApp.location,size:15),
                                    Expanded(child: Text(Myads.addata[index].location.toString(),maxLines: 1,overflow: TextOverflow.ellipsis,
                                        style: AppThemes.title_location)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onTap:() {
                            Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){return SingleViewPage(Myads.addata[index].id);
                            }));
                          },

                        ),
                    );
                  }),
          )

        ],

      ),
    );
  }
}
Widget _simplePopup() => PopupMenuButton<int>(
  itemBuilder: (context) => [
    PopupMenuItem(
      value: 1,
      child: Text("Block User"),
    ),
    PopupMenuItem(
      value: 2,
      child: Text("Safety Tips"),
    ),
    PopupMenuItem(
      value:2,
      child: Text("Turn on Safety Tips"),
    )
  ],
  icon: Icon(
    Icons.more_vert,
    size: 20,
    color: Colors.white,
  ),
);
