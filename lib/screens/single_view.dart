import 'package:flutter/material.dart';

class SingleViewPage extends StatefulWidget {

  @override
  _SingleViewPageState createState() => _SingleViewPageState();
}

class _SingleViewPageState extends State<SingleViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: Theme.of(context).primaryColor,
      //backgroundColor: Color(0xff336600),
      appBar: AppBar(
        //leading: Icon(Icons.location_on,color: Color(0xff336600),size:30),
        backgroundColor: Theme.of(context).primaryColor,
        //backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/new-holland.png',width: MediaQuery.of(context).size.width,),
            Divider(),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height:(5)),
                  Text('New Holland'),
                  SizedBox(height:(5)),
                  Row(
                    children: <Widget>[
                      Text(' RS: '),
                      Text(' 7,000000'),
                    ],
                  ),
                  SizedBox(height:(5)),
                  Row(
                    children: <Widget>[
                      Text('2017'),
                      Text(' 70,0000km'),
                    ],
                  ),
                  SizedBox(height:(5)),
                  Row(
                    children: <Widget>[
                      Icon(Icons.location_on,size: 15,),
                      Text('Ambala'),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Description'),
                  SizedBox(height:(5)),
                  Text('Please refer to the image in question. I tried several methods but couldn'),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  //color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Icon(Icons.person,color:Colors.black,size: 30,),
              ),
              title: Text('John'),
              subtitle: Text('Member Since 2020/9/19'),
            ),
            Divider(),
            Image.asset('assets/images/map.jpg',width: MediaQuery.of(context).size.width,)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width/ 2,
                decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  border: Border.all(
                    color: Colors.white,
                    width: 0,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.chat_bubble,color: Colors.white),
                    SizedBox(width:10),
                    Text('Chat',style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              onTap:() {
                  /*Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){return HomePage();
                }));*/
              },
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width/ 2,
                decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  border: Border.all(
                    color: Colors.white,
                    width: 0,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.phone,color: Colors.white),
                    SizedBox(width:10),
                    Text('Phone',style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              onTap:() {
                /*Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){return HomePage();
                }));*/
              },
            ),

          ],
        ),

      ),
    );
  }}



