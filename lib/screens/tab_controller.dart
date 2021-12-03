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
                icon: new Icon(Icons.home),
              ),
              Tab(
                text: 'Sell',
                icon: new Icon(Icons.camera_alt),
              ),
              Tab(
                  text: 'MyAccount',
                  icon: new Icon(Icons.account_box)
              ),
            ],
            labelColor: Colors.green,
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