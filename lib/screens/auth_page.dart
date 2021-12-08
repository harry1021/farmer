import 'package:flutter/material.dart';

import 'login_page.dart';


class AuthPage extends StatefulWidget {

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6e6e6),
      //backgroundColor: Theme.of(context).primaryColor,
      //backgroundColor: Color(0xff336600),
      appBar: AppBar(
        //leading: Icon(Icons.location_on,color: Color(0xff336600),size:30),
        //backgroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Icon(Icons.person,color:Colors.white,size: 30,),
              ),
              title: Text('Login'),
              subtitle: Text('Login in to your account'),
            ),
            SizedBox(height: 40),
            Divider(),
            ListTile(
              leading: Icon(Icons.person,color: Theme.of(context).cursorColor,size: 40,),
              title: Text('Help & Support'),
              subtitle: Text('Help center & legal terms'),
              trailing: Icon(Icons.arrow_forward_ios,color: Theme.of(context).cursorColor,size:15),
            ),
            Divider(),
            SizedBox(height: 20),
            InkWell(
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(left: 20, right: 20,bottom: 10),
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
                  child: Text('Login & Signup',style: TextStyle(color: Colors.white),),
                ),
              ),
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
      ),
    );
  }}



