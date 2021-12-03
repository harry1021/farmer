import 'package:flutter/material.dart';
class PrivacyPolicy extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Don't show the leading button
        backgroundColor: new Color(0xFF4CA50D),
        centerTitle: true,
        title: Text('Privacy Policy',style: TextStyle(
          fontSize:20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat-Regular',
        )),
      ),
      body: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
    );
  }
}