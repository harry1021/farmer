// @dart=2.9
import 'package:farmer/providers/Categories.dart';
import 'package:farmer/providers/authentication_provider.dart';
import 'package:farmer/providers/myAds.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/ads.dart';
import 'screens/tab_controller.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Auth _auth = Auth();
  final int isLogged = await _auth.isLogged();
  if(isLogged == 1){
    _auth.authenticated();
  }
  final MyApp myApp = MyApp();
  runApp(myApp);
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  /*Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //primarySwatch: Colors.red,
        primaryColor: const Color(0XFF6fc27c),
        primarySwatch: Colors.red,
        //t-f-b
        canvasColor: Colors.white,
        //btn
        backgroundColor: Color(0XFF6fc27c),
        //cdc
        //cardColor: Color(0xff0f4d19),
        cardColor: Colors.white,
        //icon colors
        cursorColor: Colors.black,
        //card icon single page
        iconTheme: IconThemeData(
            color: Colors.black,
            size: 28
        ),

        accentIconTheme: IconThemeData(
            color: Colors.pink,
            size: 32
        ),
        primaryIconTheme: IconThemeData(
            color: Colors.white,
            size: 24
        ),

        accentColor: Colors.white12,

      ),
      //home: LoginPage(),
      home: TabPage(),
    );
  }*/
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProvider.value(
            value: Ads(),
          ),
          ChangeNotifierProvider.value(
            value: MyAds(),
          ),
          ChangeNotifierProvider.value(
            value: Categories(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Foodtime',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              //primarySwatch: Colors.red,
              primaryColor: const Color(0XFF6fc27c),
              primarySwatch: Colors.red,
              //t-f-b
              canvasColor: Colors.white,
              //btn
              backgroundColor: Color(0XFF6fc27c),
              //cdc
              //cardColor: Color(0xff0f4d19),
              cardColor: Colors.white,
              //icon colors
              cursorColor: Colors.black,
              //card icon single page
              iconTheme: IconThemeData(
                  color: Colors.black,
                  size: 28
              ),

              accentIconTheme: IconThemeData(
                  color: Colors.pink,
                  size: 32
              ),
              primaryIconTheme: IconThemeData(
                  color: Colors.white,
                  size: 24
              ),

              accentColor: Colors.white12,

            ),
          home: TabPage(),
        )
    );
  }
}

