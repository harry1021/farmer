import 'package:farmer/config/config.dart';
import 'package:farmer/providers/ads.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'single_view.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Ads? ads;
   late Position _currentPosition;
   String currentAddress = '';
   Position? position;
   LocationPermission? permission;

  bool searchTapped = false;
  Widget appBarTitle = new Text("", style: new TextStyle(color: Colors.white),);
  Icon actionIcon = new Icon(Icons.search, color: Colors.white,);
  TextEditingController searchText = TextEditingController();

  bool _IsSearching = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  getPermission() async {
    permission = await Geolocator.requestPermission();
    getLocation();
  }
  getLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('location');
    print(position!.longitude.toString()+','+position!.latitude.toString());
    List<Placemark> placemarks = await placemarkFromCoordinates(position!.latitude, position!.longitude);
    print(placemarks[0].name);
    setState(() {
       currentAddress = placemarks[0].name.toString();
    });

  }
  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(Icons.search, color: Colors.white,);
      this.appBarTitle =
      new Text("", style: new TextStyle(color: Colors.white),);
      _IsSearching = false;
      searchText.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    if(permission == null){
      getPermission();
    }
    ads = Provider.of<Ads>(context);
    print(ads!.dataLoaded );
    if(ads!.dataLoaded == 0){
      ads!.getads();
    }
    return Scaffold(

        body: ads!.dataLoaded  == 0 ? Center(child: CircularProgressIndicator(),) :CustomScrollView(
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
              title: appBarTitle,
              actions: <Widget>[
                new IconButton(icon: actionIcon, onPressed: () {
                  setState(() {
                    if (this.actionIcon.icon == Icons.search) {
                      this.actionIcon = new Icon(Icons.close, color: Colors.white,);
                      this.appBarTitle = new TextField(
                        controller: searchText,
                        onChanged: (value){
                          ads!.searchAds(value);
                        },
                        style: new TextStyle(
                          color: Colors.white,

                        ),
                        decoration: new InputDecoration(
                            prefixIcon: new Icon(Icons.search, color: Colors.white),
                            hintText: "Search...",
                            hintStyle: new TextStyle(color: Colors.white)
                        ),
                      );
                       _handleSearchStart();
                    }
                    else {
                      _handleSearchEnd();
                    }
                  });
                },),


              ],
              flexibleSpace:  FlexibleSpaceBar(
                title: Text(currentAddress,style: TextStyle(fontSize: 16,color: Colors.white)),
                //background: ,
              ),
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(230), bottomRight: Radius.circular(230))),
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
                            ads!.addata[index].attachment != null || ads!.addata[index].attachment != '' ?
                            Image.network(Configuration.PUBLIC_URL+ads!.addata[index].attachment.toString(),
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                            ) :
                            Image.asset('assets/images/new-holland.png',
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                            ),
                            SizedBox(height:(3)),
                            Expanded(child: Text(ads!.addata[index].adtitle.toString())),
                            SizedBox(height:(3)),
                            Row(
                              children: <Widget>[
                                Text(' RS: '),
                                Expanded(child: Text(ads!.addata[index].price.toString())),
                              ],
                            ),
                            /*SizedBox(height:(3)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('2017 - '),
                                Expanded(child: Text(' 70,0000km')),
                              ],
                            ),*/
                            SizedBox(height:(3)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.location_on,size:15),
                                Expanded(child: Text(ads!.addata[index].location.toString())),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap:() {
                        Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){return SingleViewPage(ads!.addata[index].id);
                        }));
                      },

                    ),
                  );
                },
                childCount: ads!.addata.length,
              ),
            ),

          ],
        ));
  }}
