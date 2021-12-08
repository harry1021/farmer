import 'package:flutter/material.dart';

import 'register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool passwordVisible=true;
  /*void initState() {
    passwordVisible = true;
  }
*/
  final _formKey = GlobalKey<FormState>();
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
              colors: [ Colorc, Color(0xffffffff),]),*/
             //color: Color(0xffe6e6e6),
             borderRadius: BorderRadius.only(
               //bottomRight: Radius.circular(40),
               //bottomLeft: Radius.circular(40),
             ),
         ),
         //padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
         child: Center(
           child: SingleChildScrollView(
             child: Form(
               key: _formKey,
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
                       // The validator receives the text that the user has entered.
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'Please enter email address';
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
                       // The validator receives the text that the user has entered.
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
                         child: Text('Login',style: TextStyle(color: Colors.white),),
                       ),
                     ),
                     onTap:() {
                       // Validate returns true if the form is valid, or false otherwise.
                       if (_formKey.currentState!.validate()) {
                         // If the form is valid, display a snackbar. In the real world,
                         // you'd often call a server or save the information in a database.
                         
                         ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(content: Text('Processing Data')),
                         );
                       }
                       /*Navigator.of(context).push(MaterialPageRoute<Null>(
                                   builder: (BuildContext context) {
                                      return Registerpage();
                                   }
                       ));*/
                     },
                   ),
                   SizedBox(height:30),
                   Container(
                     margin: EdgeInsets.only(left: 20, right: 20),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         InkWell(
                           child: Text('Forgot Password?'),
                           onTap:() {
                             /*Navigator.of(context).push(MaterialPageRoute<Null>(
                                 builder: (BuildContext context) {
                                    return Registerpage();
                                 }
                             ));*/
                           },
                         ),

                         SizedBox(height:10),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             Text("Don't have an account"),
                             SizedBox(width:5),
                             InkWell(
                               child: Text("SignUp",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w900)),
                               onTap:() {
                                 Navigator.of(context).push(MaterialPageRoute<Null>(
                                     builder: (BuildContext context) {
                                       return RegisterPage();
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