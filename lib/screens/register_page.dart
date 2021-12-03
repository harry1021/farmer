import 'package:flutter/material.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool passwordVisible=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6e6e6),
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0.0,automaticallyImplyLeading: false,),
      body: Container(
        decoration: BoxDecoration(
          /*gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ Color(0xffcccccc), Color(0xffffffff),]),*/
          //color: Colors.white,
          borderRadius: BorderRadius.only(
            //bottomRight: Radius.circular(40),
            //bottomLeft: Radius.circular(40),
          ),
        ),
        padding: EdgeInsets.all(0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                /*Container(
                   padding: EdgeInsets.all(20),
                   margin: EdgeInsets.only(left: 20, right: 20),
                     decoration: BoxDecoration(
                        color: Colors.white,
                     ),
                   ),*/
                Container(
                  padding:const EdgeInsets.all(5),
                  margin:const EdgeInsets.only(bottom:40),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffe6e6e6),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.black12,
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
                Container(
                  padding: EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(15),
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
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      labelStyle: TextStyle(
                          color:Colors.black
                      ),
                      fillColor: Colors.black,
                      //hintText: 'Enter Email'
                      border: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent
                        ),
                      ),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                        child: Icon(Icons.person,color: Theme.of(context).cursorColor),
                      ),   //
                    ),
                    keyboardType :
                    TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height:18),
                Container(
                  padding: EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(15),
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
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color:Colors.black
                      ),
                      fillColor: Colors.black,
                      //hintText: 'Enter Email'
                      border: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent
                        ),
                      ),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                        child: Icon(Icons.mail,color: Theme.of(context).cursorColor),
                      ),   //
                    ),
                    keyboardType :
                    TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height:18),
                Container(
                  padding: EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(15),
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
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                          color:Colors.black
                      ),
                      fillColor: Colors.black,
                      //hintText: 'Enter Email'
                      border: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent
                        ),
                      ),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                        child: Icon(Icons.phone,color: Theme.of(context).cursorColor),
                      ),   //
                    ),
                    keyboardType :
                    TextInputType.phone,
                  ),
                ),
                SizedBox(height:18),
                Container(
                  padding: EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(15),
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
                  child: TextFormField(
                    obscureText : !passwordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color:Colors.black
                      ),
                      fillColor: Colors.black,
                      border: new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent
                        ),
                      ),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                        child: Icon(Icons.lock,color: Theme.of(context).cursorColor),
                      ),
                      suffixIcon: InkWell(
                        child: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off,color: Theme.of(context).cursorColor),
                        onTap: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                    ),
                    keyboardType : TextInputType.visiblePassword,
                  ),
                ),
                SizedBox(height:20),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(left: 20, right: 20),
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
                      child: Text('SignUp',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  onTap:() {
                    /*Navigator.of(context).push(MaterialPageRoute<Null>(
                                   builder: (BuildContext context) {
                                      return Registerpage();
                                   }
                       ));*/
                  },
                ),
                SizedBox(height:20),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(height:10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already have an account"),
                          SizedBox(width:5),
                          InkWell(
                            child: Text("Login",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w900)),
                            onTap:() {
                              Navigator.of(context).push(MaterialPageRoute<Null>(
                                  builder: (BuildContext context) {
                                    return LoginPage();
                                  }
                              ));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height:20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}