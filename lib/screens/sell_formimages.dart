import 'package:flutter/material.dart';

import 'register_page.dart';
import 'sell_formlocation.dart';

class SellFormImages extends StatefulWidget {
  @override
  _SellFormState createState() => _SellFormState();
}

class _SellFormState extends State<SellFormImages> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Color(0xffe6e6e6),
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0.0,),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color:Color(0xffe6e6e6),
        ),
        child: SingleChildScrollView(
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

              SizedBox(height:40),
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
        onTap:() {
            Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){return SellFormLocation();
          }));
        },
      ),
    );
  }
}