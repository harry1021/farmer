import 'package:farmer/presentation/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

import 'auth_page.dart';
import 'home_page.dart';
import 'sell_page.dart';

class TabPage extends StatefulWidget{

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.yellow,
        theme: ThemeData(
          primaryColor: Color(0XFF6fc27c),
          //btn
          backgroundColor: Color(0XFF6fc27c),
        ),
      home: DefaultTabController(
        length: 3,
        child: new Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomePage(),
              SellPage(),
              AuthPage()
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                text: 'Home',
                icon: new Icon(MyFlutterApp.home),
              ),
              Tab(
                text: 'Sell',
                icon: new Icon(Icons.camera),
              ),
              Tab(
                  text: 'MyAccount',
                  icon: new Icon(Icons.account_box)
              ),
            ],
            labelColor: Color(0XFF6fc27c),
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.white,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}