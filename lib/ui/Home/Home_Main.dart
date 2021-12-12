import 'package:cards/ui/Home/Home_Body.dart';
import 'package:cards/ui/login/Login_Body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home_Main());
}
class Home_Main extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
goBackToPreviousScreen(BuildContext context) {
//  Navigator.pop(context);


  /* Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Index_Main()),);*/
}

class _MyAppState extends State<Home_Main> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home_Body(),
      debugShowCheckedModeBanner: false,
      title: 'title.en',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),




      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
