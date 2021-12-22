import 'package:cards/ui/login/Login_Body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Card_Body.dart';


void main() {
  runApp(Crad_Main());
}
class Crad_Main extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
goBackToPreviousScreen(BuildContext context) {
//  Navigator.pop(context);


  /* Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Index_Main()),);*/
}

class _MyAppState extends State<Crad_Main> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Card_Body(),
      debugShowCheckedModeBanner: false,
      title: 'title.en',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),




      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}