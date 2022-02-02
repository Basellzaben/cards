import 'package:cards/ui/Home/Home_Body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../LocalAuthApi.dart';

class Login_Body extends StatefulWidget {

  @override
  _Login_Body createState() => _Login_Body();
}
class _Login_Body extends State<Login_Body> {

/*  login() async {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Home_Body()),
    );
*//*    try {
      final isAuthenticated = await LocalAuthApi.authenticate();
      print(isAuthenticated.toString() + " state");
      if (isAuthenticated) {

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Home_Body()),
        );
      }
    }on PlatformException catch(e){
      print(e.message.toString()+"  error");
    }*//*

  }*/

  @override
   initState(){
   // login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
backgroundColor: Colors.white
    );
      }}