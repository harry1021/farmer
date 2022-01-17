import 'package:farmer/config/config.dart';
import 'package:farmer/providers/authentication_provider.dart';
import 'package:farmer/providers/myAds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      backgroundColor: Colors.white,
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text('Profile',style: TextStyle(fontFamily: 'Montserrat-Regular',fontWeight: FontWeight.bold)),
            backgroundColor: Colors.blue,
            /*actions: <Widget>[
              Padding(
                padding: (EdgeInsets.all(2)),
                child: _simplePopup(),
              ),
            ]*/
        ),
      ),
      body: Column(
        children:[
          Container(
            padding: EdgeInsets.fromLTRB(8,25,8,8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        border: Border.all(
                          color:Color(0xFF555353),
                          width: 2.2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Icon(Icons.person,color:Colors.blue,size: 50,),
                    ),
                    Column(
                      children: [
                        Padding(padding: EdgeInsets.all(4)),
                        Text(
                          auth.name.toString(),
                          style: TextStyle(
                            fontSize:16,
                            color:Colors.black,
                            fontFamily: 'Montserrat-Regular',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(4)),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
          Container (
            height: 7,
            color: Color(0xFFedeae6),
            width: 100,
            margin: EdgeInsets.fromLTRB(0,15,0,0),
          ),
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
                              Expanded(child: Text(Myads.addata[index].adtitle.toString())),
                              SizedBox(height:(3)),
                              Row(
                                children: <Widget>[
                                  Text(' RS: '),
                                  Expanded(child: Text(Myads.addata[index].price.toString())),
                                ],
                              ),
                              /*SizedBox(height:(3)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('2017 - '),
                                Expanded(child: Text(' 70,0000km')),
                              ],
                            ),*/
                              SizedBox(height:(3)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.location_on,size:15),
                                  Expanded(child: Text(Myads.addata[index].location.toString())),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onTap:() {
                          /*Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){return SingleViewPage(Myads.addata[index].id);
                          }));*/
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
