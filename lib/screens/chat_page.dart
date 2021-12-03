import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  var selectedValue = 0;
  var isLargeScreen = false;

  Widget build(BuildContext context) {
    return Material(
      //child: Container(height: MediaQuery.of(context).size.height * 0),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                 //title: Text('Sell Any Item',style: TextStyle(fontFamily: 'Montserrat-Regular',fontWeight: FontWeight.bold)),
                backgroundColor: Color.fromRGBO(76, 165, 13, 1),
                title:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.arrow_back, color: Colors.white,size: 24),
                            Padding(padding: new EdgeInsets.all(5.0)),
                          ],
                      ),
                        onTap: () => Navigator.pop(context),
                      ),
                      InkWell(
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin:EdgeInsets.fromLTRB(0,5,0,0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'images/user_pro.jpg',
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(7,10,0,0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('John Singh',overflow: TextOverflow.ellipsis,style: TextStyle(fontSize:18,fontWeight: FontWeight.w600)),
                                  Padding(padding: EdgeInsets.all(1.0)),
                                  Text(' last see today 05:59pm',overflow: TextOverflow.ellipsis,style: TextStyle(fontSize:12,fontWeight: FontWeight.normal,color: Colors.black54)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        onTap:() {
                         /* Navigator.of(context).push(MaterialPageRoute<Null>(
                              builder: (BuildContext context) {
                                return UserProfile();
                              }
                          ));*/
                        },
                      ),
                      //Padding(padding: EdgeInsets.all(5)),
                      Icon(Icons.phone, color: Colors.white),
                      //Padding(padding: EdgeInsets.fromLTRB(12,0,0,0)),
                      Icon(Icons.flag, color: Colors.white),
                      //Padding(padding: EdgeInsets.all(2)),
                      Padding(
                        padding: (EdgeInsets.all(0)),
                        child: _simplePopup(),
                      ),
                      ///Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
            ),
          ),
          body: Container(
           child:Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: _contentcol(),
              ),
             Container(
               height: 55,
               color: Colors.grey,
               child:Column(
                          children:[
                            ListTile(
                              //isThreeLine: true,
                              leading: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                child: Container(
                                  width: 0,
                                  height:0,
                                  alignment: Alignment.center,
                                  child: Icon(Icons.attach_file,color: Colors.black,size: 25),
                                ),
                              ),
                              trailing: const Icon(Icons.keyboard_voice,color: Colors.blueAccent,size:25),
                              title: new TextFormField(style: TextStyle(
                                height:1.5,
                                color: Colors.black,
                              ),
                                decoration: InputDecoration.collapsed(  hintText:'Type a message',
                                  //labelStyle: new TextStyle(color: Colors.black),
                                  //contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                                 // enabledBorder: OutlineInputBorder(
                                   // borderSide: BorderSide(color: Color(0xFF9c9892)),
                                  //),
                                  //focusedBorder: OutlineInputBorder(
                                   // borderSide: BorderSide(color: Color(0xFF9c9892)),
                                  //),
                                  //hintStyle: TextStyle(fontSize:17.0,color:Colors.black),
                                ),
                                //style: new TextStyle(color: Colors.white),
                                keyboardType :
                                TextInputType.emailAddress,
                              ),
                              dense: true,
                            ),
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

Widget _chatEnvironment (){
  return IconTheme(
    data: new IconThemeData(color: Colors.blue),
    child: new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                color: Color(0xFFc4bcb1),
                margin: EdgeInsets.fromLTRB(0,20,0,0),
                child: Column(
                  children: [
                    ListTile(
                      //isThreeLine: true,
                      leading: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          width: 0,
                          height:0,
                          padding: EdgeInsets.all(1),
                          margin: EdgeInsets.all(1),
                          alignment: Alignment.center,
                          child: Icon(Icons.attach_file,color: Colors.black,size: 28),
                        ),
                      ),
                      trailing: const Icon(Icons.keyboard_voice,color: Colors.blueAccent,size:30),
                      title: new TextFormField(
                        decoration: InputDecoration.collapsed(hintText:'Type a message',
                          hintStyle: TextStyle(fontSize:17.0,color:Colors.black),
                        ),
                        style: new TextStyle(color: Colors.grey),
                        autofocus: true,
                        autocorrect: true,
                        keyboardType :
                        TextInputType.emailAddress,
                      ),
                      dense: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _contentcol (){
  return IconTheme(
    data: new IconThemeData(color: Colors.blue),
    child: new Container(
      child: ListView(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: <Widget>[
                    Padding(padding:EdgeInsets.all(10)),
                    Text('Toady, 12 sep',style: TextStyle(fontSize: 17)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      //height: 80,
                      //width: 300,
                      margin: EdgeInsets.fromLTRB(10,20,35,10),
                      padding:EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Color(0xFFdbd5b8),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text('Lorem Ipsum is simply dummy text of the printing.',style: TextStyle(fontSize:16,fontFamily: 'Montserrat-Regular')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      //height: 80,
                      //width: 250,
                      margin: EdgeInsets.fromLTRB(35,10,10,0),
                      padding:EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.lightBlueAccent,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text('Lorem Ipsum Lorem Ipsum is simply dummy text of the printing. dummy text of the',style: TextStyle(fontSize:16,fontFamily: 'Montserrat-Regular')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      //height: 80,
                      //width: 250,
                      margin: EdgeInsets.fromLTRB(0,15,7,0),
                      padding:EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.lightBlueAccent,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(7),
                            child: Text('hlo',style: TextStyle(fontSize:16,fontFamily: 'Montserrat-Regular')),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      child: new CircleAvatar(child: Image.asset(
                        'images/user_pro.jpg',
                      ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            color: Colors.lightBlueAccent,
                            border: Border.all(
                              color: Color(0xFFdbd5b8),
                              width: 8.5,
                              style: BorderStyle.solid,
                            ),
                          ),
                        margin: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'images/new_hind.jpg',
                          width: 300.0,
                          height: 200.0,
                        )
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(padding:EdgeInsets.all(10)),
                    Text('Toady, 07:17pm',style: TextStyle(fontSize: 17),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      //height: 80,
                      //width: 300,
                      margin: EdgeInsets.fromLTRB(10,20,0,10),
                      padding:EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Color(0xFFdbd5b8),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(7),
                            child: Text('hi',style: TextStyle(fontSize:16,fontFamily: 'Montserrat-Regular')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _simplePopup() => PopupMenuButton<int>(
  itemBuilder: (context) => [
    PopupMenuItem(
      value: 1,
      child: Text("Block User"),
    ),
    PopupMenuItem(
      value: 2,
      child: Text("Safety Tips"),
    ),
    PopupMenuItem(
      value:2,
      child: Text("Turn on Safety Tips"),
    )
  ],
  child: Container(
    child: Icon(Icons.more_vert),
  ),
  offset: Offset(20, 100),
);

