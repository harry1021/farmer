import 'package:farmer/Sizeconfig.dart';
import 'package:farmer/providers/Categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sell_form.dart';


class SellPage extends StatefulWidget {

  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  Categories? categories;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    categories = Provider.of<Categories>(context);
    if(categories!.dataLoaded == 0){
      categories!.getCategories();
    }
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Color(0xffe6e6e6),
      appBar: AppBar(
        //leading: Icon(Icons.location_on,color: Color(0xff336600),size:30),
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text('What are you offering',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,

      ),
        body: categories!.dataLoaded == 0 ? Center(child: CircularProgressIndicator() ) :GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: createGrid(),
        ),
    );
  }

  List<Widget> createGrid() {
    List<Widget> categoriesList = [];
    categories!.categories.forEach((element) {
      categoriesList.add(
        InkWell(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
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
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22),
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.directions_car,size:30,color: Theme.of(context).primaryColor),
                Padding(padding: EdgeInsets.all(5)),
                Text(element.category_name.toString(),style: AppThemes.subtitle),
              ],
            ),
          ),
          onTap:() {
            Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {return SellFormPage(element.id);
            }));
          },
        ),
      );
    });
    return categoriesList;
  }}
