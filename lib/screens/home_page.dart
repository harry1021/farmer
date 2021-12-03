import 'package:flutter/material.dart';

import 'single_view.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // backgroundColor: Theme.of(context).primaryColor,
        /*backgroundColor: Color(0xff336600),
    appBar: AppBar(
      leading: Icon(Icons.location_on,color: Color(0xff336600),size:30),
      actions: <Widget>[
        Icon(Icons.search,color: Color(0xff336600),size:30),
        Icon(Icons.person,color: Color(0xff336600),size:30),
      ],
      backgroundColor: Color(0xffffffff),
      elevation: 0,

    ),*/

        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).primaryColor,
              //backgroundColor: Theme.of(context).primarySwatch,
              //backgroundColor: Theme.of(context).backgroundColor,
              elevation: 20.0,
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 120.0,
              leading: Icon(Icons.location_on),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.search),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.person),
                ),
              ],
              flexibleSpace: const FlexibleSpaceBar(
                title: Text('Chandigarh',style: TextStyle(fontSize: 16,color: Colors.white,),),
                //background: ,
              ),
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(230), bottomRight: Radius.circular(230))),
  /*bottom: PreferredSize(
      child: Container(
        color: Colors.orange,
        height: 4.0,
      ),
      preferredSize: Size.fromHeight(4.0)),*/
            ),

            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
                child: Center(
                  //child: Text('Scroll to see the SliverAppBar in effect.'),
                 // child: Container(),
                ),
              ),
            ),

            SliverGrid(
              gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 2.0, mainAxisSpacing: 0.0, crossAxisCount: 2,childAspectRatio: MediaQuery.of(context).size.width /
                  (370 )),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    height: 2,
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),

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
                        padding: const EdgeInsets.only(left: 10,right: 10, top: 10,bottom: 5),
                        margin: const EdgeInsets.all(3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset('assets/images/new-holland.png',
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                            ),
                            SizedBox(height:(3)),
                            Expanded(child: Text('New Holland')),
                            SizedBox(height:(3)),
                            Row(
                              children: <Widget>[
                                Text(' RS: '),
                                Expanded(child: Text(' 7,000000')),
                              ],
                            ),
                            SizedBox(height:(3)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('2017 - '),
                                Expanded(child: Text(' 70,0000km')),
                              ],
                            ),
                            SizedBox(height:(3)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.location_on,size:15),
                                Expanded(child: Text('Ambala')),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap:() {
                        Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){return SingleViewPage();
                        }));
                      },


                      /*Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(42),
                        topLeft: Radius.circular(42),
                      ),
                    ),
                    //height: MediaQuery.of(context).size.height/1.3,
                    padding: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: <Widget>[

                      ],
                    ),*/

                      /*child: GridView.builder(
                      primary: false,
                      shrinkWrap: false,
                      padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                      gridDelegate:
                      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 8.0, mainAxisSpacing: 2.0, crossAxisCount: 2,childAspectRatio: MediaQuery.of(context).size.width /
                          (450 )),
                      itemBuilder: (BuildContext context, int index) {
                        return new GridTile(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          child:
                        );
                      },
                    ),*/
                    ),
                  );
                },
              ),
            ),

          ],
        ));

  }}


/*body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(22),
            bottomLeft: Radius.circular(22),
          ),
        ),
        height: MediaQuery.of(context).size.height/1.3,
        padding: EdgeInsets.only(bottom: 10),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
              padding: const EdgeInsets.all(8),
              child: const Text("tr"),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
              padding: const EdgeInsets.all(8),
              child: const Text("tr"),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
              padding: const EdgeInsets.all(8),
              child: const Text("tr"),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
              padding: const EdgeInsets.all(8),
              child: const Text("tr"),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
              padding: const EdgeInsets.all(8),
              child: const Text("tr"),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
              padding: const EdgeInsets.all(8),
              child: const Text("tr"),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
              padding: const EdgeInsets.all(8),
              child: const Text("tr"),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
              padding: const EdgeInsets.all(8),
              child: const Text("tr"),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
              padding: const EdgeInsets.all(8),
              child: const Text("tr"),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
              padding: const EdgeInsets.all(8),
              child: const Text("tr"),
            ),
          ],
        ),
      ),
    ),*/
