import 'dart:async';
import 'package:cards/GlobalVaribales.dart';
import 'package:cards/ui/FingerAuth/FingerPrintAuth.dart';
import 'package:cards/ui/Home/Home_Body.dart';
import 'package:cards/ui/login/Login_Body.dart';
import 'package:cards/ui/login/Login_Main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'color/HexColor.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  GestureBinding.instance?.resamplingEnabled = true;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cards Keeper',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  login ()  {
    Navigator.push(context,
        MaterialPageRoute(builder:
            (context) =>
            Login_Body()));
/*
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool('activefingerprint')!=null){
      if(prefs.getBool('activefingerprint')!){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Login_Body()));

                }else{
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    FingerPrintAuth()));
            }}else{
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) =>
                  FingerPrintAuth()));
            }

    print(prefs.getBool('activefingerprint').toString()+"savvvve");
*/

  }
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>

           /*     Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Login_Body()



            )
        )*/


        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home_Body())),

    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor:Colors.white,
//backgroundColor: HexColor(Globalvireables.basecolor),
    body: Container(
      margin: EdgeInsets.only(top: 200),

      child: Column(children: [
       Center(
         child: new Image.asset('assets/logo.jpg'
       ,height:250 ,width:250 , ),
      ),

    Container(
    margin: EdgeInsets.only(top: 200),
    child: Text("Powered By Galaxy International Group",style: TextStyle(
      color: HexColor(Globalvireables.basecolor),fontSize: 12
    ),),
    )

  ]

    ),
    ));

  }}