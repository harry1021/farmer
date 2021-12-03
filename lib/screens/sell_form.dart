import 'package:flutter/material.dart';

import 'register_page.dart';
import 'sell_formimages.dart';

class SellFormPage extends StatefulWidget {
  @override
  _SellFormState createState() => _SellFormState();
}

class _SellFormState extends State<SellFormPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Color(0xffe6e6e6),
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0.0,automaticallyImplyLeading: false,),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
                child: Icon(Icons.directions_car,color:Colors.white,size: 50,),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(height:18),
                    TextFormField(
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
            Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){return SellFormImages();
          }));
        },
      ),
    );
  }
}