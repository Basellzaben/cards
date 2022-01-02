import 'dart:async';
import 'dart:convert';
import 'package:cards/GlobalVaribales.dart';
import 'package:cards/LanguageProvider.dart';
import 'package:cards/Models/Users.dart';
import 'package:cards/color/HexColor.dart';
import 'package:cards/ui/EditDataPages/EditProfileDialog.dart';
import 'package:cards/ui/Home/Home_Body.dart';
import 'package:cards/ui/Regeister/Register_Body.dart';
import 'package:cards/ui/login/Login_Body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
late bool isSwitched=false;

Rememper() async {

  print("activefingerprint"+isSwitched.toString());

  SharedPreferences prefs = await SharedPreferences.getInstance();
  if( prefs.getBool('activefingerprint')!=null);
  isSwitched=prefs.getBool('activefingerprint')!;

  if(Globalvireables.languageCode=="en")
  {
    Globalvireables.lantext="اللغة العربية";

  }
  else {

    Globalvireables.lantext="English Language";

  }

}

@override
initState()  {

  Rememper();

}
class _Body_profile extends State<Body_profile> {

  var textValue = 'Switch is OFF';
  bool hidden=true;

String _imageBase64="";
  var bytes;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
          title: Text(LanguageProvider.getTexts('profile').toString()),
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
                child: getImagenBase64(Globalvireables.photoURL),

       /*     child: ClipRRect(
              borderRadius: BorderRadius.circular(9.0),
              child: Image.network(
                'https://media-exp1.licdn.com/dms/image/C4E03AQFRm-g6gIqkzg/profile-displayphoto-shrink_800_800/0/1609987052943?e=1645056000&v=beta&t=-xlXbObyLKaUNx5Kpka5l1Pdsv4HsnyiqBDSxyu0FLM',
                width: 130.0,
                height: 130.0,
                fit: BoxFit.fill,
              ),
            ),*/
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


if(Globalvireables.email!=null)
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


                if(Globalvireables.phone!="null")
                Card(
                  
                  margin: EdgeInsets.only(top:40,left: 12,right: 12),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(

                        children: <Widget>[
                          Icon(Icons.phone,size: 30,color: HexColor(Globalvireables.bluedark),),
                          Container( margin:EdgeInsets.only(left: 8,right: 8),
                              child: Text(Globalvireables.phone.toString(),style: TextStyle(fontSize: 18),)),
                        ]
                    ),
                  ),
                ),
                if(Globalvireables.email!=null)
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
                if(Globalvireables.country!=null)
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
                if(Globalvireables.password!="null")
                Card(

                  margin: EdgeInsets.only(top:40,left: 12,right: 12),

                  child: Container(
                    padding: EdgeInsets.all(10),

                    child: Row(
                      children: <Widget>[

                        Icon(Icons.password,size: 30,color: HexColor(Globalvireables.bluedark),),

                        if(!hidden)
                          Container( margin:EdgeInsets.only(left: 8,right: 8),
                            child: Text(Globalvireables.password.toString(),style: TextStyle(fontSize: 18),))
                        else
Container( margin:EdgeInsets.only(left: 8,right: 8),
    child: Text("******",style: TextStyle(fontSize: 18),)),




    Spacer(),
if(hidden)
                        new InkWell(
                            onTap: () async {
setState(() {
  hidden=!hidden;

});
                            },child: Icon(Icons.lock,size: 30,color: HexColor(Globalvireables.bluedark),)
                        )else
  new InkWell(
      onTap: () async {
        setState(() {
          hidden=!hidden;

        });
      },child: Icon(Icons.remove_red_eye,size: 30,color: HexColor(Globalvireables.bluedark),)
  )
                        ,

                      ]
                  ),
                ),),

            new InkWell(
              onTap: () async {

                if(Globalvireables.languageCode=="en")
              {    Globalvireables.languageCode="ar";
              Globalvireables.lantext="English Language";

              }
                else {
                  Globalvireables.languageCode = "en";
                  Globalvireables.lantext="اللغة العربية";

                }
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Login_Body()));


              },
                  child: Card(
                    margin: EdgeInsets.only(top:40,left: 12,right: 12),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                          children: <Widget>[
                            Icon(Icons.language,size: 30,color: HexColor(Globalvireables.bluedark),),

                            Container( margin:EdgeInsets.only(left: 8,right: 8),
                                child: Text( Globalvireables.lantext.toString(),style: TextStyle(fontSize: 18),)),
                          ]
                      ),
                    ),),
                ),
                Card(
                  margin: EdgeInsets.only(top:40,left: 12,right: 12),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                        children: <Widget>[
                          Icon(Icons.fingerprint,size: 30,color: HexColor(Globalvireables.bluedark),),

                          Container( margin:EdgeInsets.only(left: 8,right: 8),
                              child: Text( Globalvireables.lantext.toString(),style: TextStyle(fontSize: 18),)),
Spacer(),

                          Transform.scale(
                              scale: 1.5,
                              child: Switch(
                                onChanged: toggleSwitch,
                                value: isSwitched,
                                activeColor: HexColor(Globalvireables.white2),
                                activeTrackColor: HexColor(Globalvireables.basecolor),
                                inactiveThumbColor:HexColor(Globalvireables.basecolor),
                                inactiveTrackColor: HexColor(Globalvireables.white3) ,
                              )
                          ),


                        ]
                    ),
                  ),),


                Card(
                  margin: EdgeInsets.only(top:40,left: 12,right: 12,bottom: 30),
                  child: new InkWell(
                    onTap: () async {
                     await _googleSignIn.signOut();
                      await _auth.signOut();
                      Navigator.push(
                        context,
                         MaterialPageRoute(builder: (context) => Login_Body()),);
                              },
                    child: Container(
                      padding: EdgeInsets.all(10),

                      child: Row(
                          children: <Widget>[

                            Icon(Icons.logout,size: 30,color: HexColor(Globalvireables.bluedark),),

                          Container(margin:EdgeInsets.only(left: 8,right: 8),
                                child: Text(LanguageProvider.getTexts('logout').toString().toString(),style: TextStyle(fontSize: 18),)),
                          ]
                      ),
                    ),
                  ),),

if(Globalvireables.password!="null")
                new InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfileDialog()),);
                  },
                  child: Center(
                    child: Card(
color: HexColor(Globalvireables.basecolor),
                      child: Container(

height: 30,
                        width: 150,
                          margin: EdgeInsets.only(bottom: 0),
                          child: Center(child: Text(LanguageProvider.getTexts('edit').toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),))),
                    ),

                  ),
                ),

Center(
  child: Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text("version 1.0 - 2021",style: TextStyle(color: Colors.black26,fontWeight: FontWeight.w300),)),

),




              ])),
        )


        ));}


  Widget getImagenBase64(String imagen) {
   // print(imagen+"imagen");
if(imagen==null)
  imagen=Globalvireables.imagen;
    if(Globalvireables.password=="null")
      imagen=imagen;
      else
        imagen="http://cardskeeper-001-site1.ftempurl.com"+imagen;

    //  imagen=Globalvireables.imagen;
  //  _imageBase64 = imagen;
    const Base64Codec base64 = Base64Codec();


    //print(imagen+"imagen");
    if (imagen == "http://cardskeeper-001-site1.ftempurl.com")
      return
        Container(

          //child: Image.asset('assets/emptyfile.png'),
          child: Icon(
            Icons.person_rounded,
            size: 100.0,
            color: HexColor(Globalvireables.basecolor),
          ),
        );

    else if(imagen==null)
     new Container(

        height: 150.0,
        width: 150.0,
        decoration: new BoxDecoration(
          //   borderRadius: BorderRadius.all( Radius.circular(100.0)),


          color: Colors.white,
          //  borderRadius: BorderRadius.all(const Radius.circular(50.0)),
         // border: Border.all(color: const Color(0xFF28324E)),
        ),
        child: Image.network(
          "https://www.yallanshtry.com/wp-content/uploads/2020/12/Male_Profile_Round_Circle_Users-512.png",  width: 130.0,
          height: 130.0,
          fit: BoxFit.fill,
        ),

        /*Image.memory(
        bytes,
        width: 300,
        height: 300,
        fit: BoxFit.fitWidth,

      ),*/
      );
    {  //bytes = base64.decode(_imageBase64);
    return new Container(

      height: 150.0,
      width: 150.0,
      decoration: new BoxDecoration(
        //   borderRadius: BorderRadius.all( Radius.circular(100.0)),

        color: Colors.white,

        //  borderRadius: BorderRadius.all(const Radius.circular(50.0)),
     //   border: Border.all(color: const Color(0xFF28324E)),
      ),
      child: Image.network(
        imagen,  width: 130.0,
      height: 130.0,
      fit: BoxFit.fill,
    ),

      /*Image.memory(
        bytes,
        width: 300,
        height: 300,
        fit: BoxFit.fitWidth,

      ),*/
    );
  }



  }


  savelogindata(bool x) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (Globalvireables.email != null)
    {   if (Globalvireables.email.length > 5)
      prefs.setString('email', Globalvireables.email);
    else
      prefs.setString('email', Globalvireables.phone);
    }  else {
      prefs.setString('email', Globalvireables.phone);}

    prefs.setString('password', Globalvireables.password);
    prefs.setBool('activefingerprint', x);

  }
  deletelogindata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("password");
    prefs.remove("email");
    prefs.setBool('activefingerprint', isSwitched);

  }
 toggleSwitch(bool value)  {
    setState(() {
      isSwitched = !isSwitched;
      textValue = 'Switch Button is ON';
    });

  savelogindata(isSwitched);

print('Switch Button is'+isSwitched.toString());
}
}