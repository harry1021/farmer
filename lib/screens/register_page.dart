import 'package:dio/dio.dart';
import 'package:farmer/config/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../db_helper/db_helper.dart';
import '../models/User..dart';
import '../providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'login_page.dart';
import 'tab_controller.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool passwordVisible=true;
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  Auth? auth;
  final _key = GlobalKey<FormState>();

  bool? isLoggedIn =false;

  bool loading = false;
  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }
  insert(token,name,email,picture,type) async {
    // get a reference to the database
    // because this is an expensive operation we use async and await
    Database? db = await DatabaseHelper.instance.database;
    print('name: ${name}');
    print('email: ${email}');
    print('picture: ${picture}');
    print('type: ${type}');
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnToken  : token,
      DatabaseHelper.columnEmail  : email,
      DatabaseHelper.columnPicture  : picture,
      DatabaseHelper.columnName  : name,
      DatabaseHelper.columnUserType  : type
    };
    var resultData = await db!.query(DatabaseHelper.table);
    if(resultData.length == 0) {
      // do the insert and get the id of the inserted row
      int id = await db.insert(DatabaseHelper.table, row);
    }
    // show the results: print all rows in the db
    resultData = await db.query(DatabaseHelper.table);
  }
   register() async {
     if (_key.currentState!.validate()) {
       loading = true;
       // If the form is valid, display a snackbar. In the real world,
       // you'd often call a server or save the information in a database.
       var dio = Dio();
       dio.options.headers['Accept'] = 'application/json';
       try{
         var response = await dio.post(
             Configuration.API_URL+'register', data:{'username': _userNameController.text, 'email': _emailController.text, 'password': _passwordController.text, 'contact': _phoneController.text});
         print('response.data');
         print(response.data);
         onLoginStatusChanged(true);
         Result result = Result.fromJson(response.data);
         Users user =  result.success;
         await insert(user.token,user.name,user.email, user.picture,user.userType);
         await auth!.authenticated();
         setState(() {
           loading = false;
         });
         Fluttertoast.showToast(
             msg: "Registered successfully",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.BOTTOM,
             backgroundColor: Colors.black,
             textColor: Colors.white,
             fontSize: 16.0
         );
         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TabPage()),(route) => false,);

       }on DioError catch (e) {
         print('e.error');
         print(e.error);
         print(e.response);
         Fluttertoast.showToast(
             msg: e.response.data['message'],
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.BOTTOM,
             backgroundColor: Colors.black,
             textColor: Colors.white,
             fontSize: 16.0
         );

       }
       ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content: Text('Processing Data')),
       );
     }

  }

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<Auth>(context);
    return Scaffold(
      backgroundColor: Color(0xffe6e6e6),
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0.0,automaticallyImplyLeading: false,),
      body: loading == true ? Center(child: CircularProgressIndicator(),) :Container(
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
            child: Form(
              key: _key,
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
                      controller: _userNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter user name';
                        }
                        return null;
                      },
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
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email address';
                        }
                        bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                        if (!emailValid) {
                          return 'Please enter valid email address';
                        }
                        return null;
                      },
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
                      controller: _phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter mobile number';
                        }
                        if (value.length != 10) {
                          return 'Please enter valid mobile number';
                        }
                        return null;
                      },
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
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height:20),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width/ 1,
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
                      child: Center(
                        child: Text('SignUp',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    onTap:() {
                      register();
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
      ),
    );
  }


}