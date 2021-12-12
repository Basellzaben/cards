import 'dart:async';
import 'package:cards/GlobalVaribales.dart';
import 'package:cards/ui/login/Login_Body.dart';
import 'package:cards/ui/login/Login_Main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'color/HexColor.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Login_Body()

            )
        )
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
       ,height:280 ,width:250 , ),
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