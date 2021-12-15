import 'package:cards/ui/login/Login_Body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main_profile());
}
class Main_profile extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
goBackToPreviousScreen(BuildContext context) {
//  Navigator.pop(context);


  /* Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Index_Main()),);*/
}

class _MyAppState extends State<Main_profile> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login_Body(),
      debugShowCheckedModeBanner: false,
      title: 'profile',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),




      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}