import 'dart:async';
import 'dart:convert';
import 'package:cards/GlobalVaribales.dart';
import 'package:cards/Models/Users.dart';
import 'package:cards/color/HexColor.dart';
import 'package:cards/ui/Home/Home_Body.dart';
import 'package:cards/ui/Regeister/Register_Body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
class Body_profile extends StatefulWidget {

  @override
  _Body_profile createState() => _Body_profile();
}


class _Body_profile extends State<Body_profile> {
  String _imageBase64="";
  var bytes;

  final globalKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController country = TextEditingController();


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData=MediaQuery.of(context);

    return Scaffold(
        key: _scaffoldKey,
        // resizeToAvoidBottomInset : false,
        appBar: AppBar(
          backgroundColor: HexColor(Globalvireables.bluedark),
          title: Text('profile'),
        ),
        backgroundColor: HexColor(Globalvireables.white2),
        body: Container(
          margin: EdgeInsets.only(top: 10 ,left: 5,right: 5),
        child: Card(
          shadowColor: HexColor(Globalvireables.white2),
          child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            //  crossAxisAlignment: CrossAxisAlignment.center //Center Row contents vertically,
              children: [


               Center(
                child: Container(
                  margin: EdgeInsets.only(top: 18,),
               //   child: getImagenBase64(Globalvireables.photoURL),),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(9.0),
              child: Image.network(
                'https://media-exp1.licdn.com/dms/image/C4E03AQFRm-g6gIqkzg/profile-displayphoto-shrink_800_800/0/1609987052943?e=1645056000&v=beta&t=-xlXbObyLKaUNx5Kpka5l1Pdsv4HsnyiqBDSxyu0FLM',
                width: 130.0,
                height: 130.0,
                fit: BoxFit.fill,
              ),
            ),
                )
              ),




                Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    alignment: Alignment.center,
                    child: Text(
                      Globalvireables.name,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )

                ),



                Container(
                  margin: const EdgeInsets.only(top: 0.0),

                  child: Text(
                    Globalvireables.email,
                    style: TextStyle(
                        textBaseline: TextBaseline.alphabetic,
                        fontSize: 15,
                        color: Colors.black26,
                        ),
                  )

                  ,),



                Card(
                  
                  margin: EdgeInsets.only(top:40,left: 12,right: 12),

                  child: Container(
                    padding: EdgeInsets.all(10),

                    child: Row(
                        children: <Widget>[

                          Icon(Icons.phone,size: 30,color: HexColor(Globalvireables.bluedark),),

                          Container( margin:EdgeInsets.only(left: 8,right: 8),
                              child: Text("0777546874".toString(),style: TextStyle(fontSize: 18),)),
                        ]
                    ),
                  ),
                ),

                Card(

                  margin: EdgeInsets.only(top:40,left: 12,right: 12),

                  child: Container(
                    padding: EdgeInsets.all(10),

                  child: Row(
                      children: <Widget>[

                        Icon(Icons.email,size: 30,color: HexColor(Globalvireables.bluedark),),
                        Container( margin:EdgeInsets.only(left: 8,right: 8),
                            child: Text(Globalvireables.email.toString(),style: TextStyle(fontSize: 18),)),
                      ]
                  ),
                ),),
                Card(

                  margin: EdgeInsets.only(top:40,left: 12,right: 12),

                  child: Container(
                    padding: EdgeInsets.all(10),

                  child: Row(
                      children: <Widget>[

                        Icon(Icons.account_balance_rounded,size: 30,color: HexColor(Globalvireables.bluedark),),

                        Container( margin:EdgeInsets.only(left: 8,right: 8),
                            child: Text(Globalvireables.country.toString(),style: TextStyle(fontSize: 18),)),
                      ]
                  ),
                ),),

                Card(

                  margin: EdgeInsets.only(top:40,left: 12,right: 12,bottom: 30),

                  child: Container(
                    padding: EdgeInsets.all(10),

                    child: Row(
                      children: <Widget>[

                        Icon(Icons.password,size: 30,color: HexColor(Globalvireables.bluedark),),

                        Container( margin:EdgeInsets.only(left: 8,right: 8),
                            child: Text(Globalvireables.password.toString(),style: TextStyle(fontSize: 18),)),
                      ]
                  ),
                ),),

              ])),
        )


        ));}


  Widget getImagenBase64(String imagen) {

  //  imagen=Globalvireables.imagen;
    _imageBase64 = imagen;
    const Base64Codec base64 = Base64Codec();
    bytes = base64.decode(_imageBase64);
    if (_imageBase64 == null)
      return
       Container(

        //child: Image.asset('assets/emptyfile.png'),
        child: Icon(
          Icons.person_rounded,
          size: 100.0,
          color: HexColor(Globalvireables.basecolor),
        ),
      );
   else
    return new Container(
          height: 100.0,
          width: 100.0,
          decoration: new BoxDecoration(
            color: const Color(0xff7c94b6),
            borderRadius: BorderRadius.all(const Radius.circular(50.0)),
            border: Border.all(color: const Color(0xFF28324E)),
          ),
          child: Image.memory(
            bytes,
            width: 300,
            fit: BoxFit.fitWidth,

          ),
      );

  }
}