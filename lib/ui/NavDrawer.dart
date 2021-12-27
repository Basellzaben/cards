import 'package:cards/GlobalVaribales.dart';
import 'package:cards/LanguageProvider.dart';
import 'package:cards/color/HexColor.dart';
import 'package:cards/ui/Home/Home_Body.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Profile/Body_profile.dart';
import 'login/Login_Body.dart';

class NavDrawer extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(

            child: Text(
              'Card Keeper From Galaxy Group',
              style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.w300),
            ),
            decoration: BoxDecoration(
                color: HexColor(Globalvireables.basecolor),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/draw.jpg'))),
          ),
        //https://play.google.com/store/apps/details?id=com.baselalzaben99.myapplicationmaps&hl=ar&gl=US
          ListTile(

            leading: Icon(Icons.share),
            title: Container(alignment:LanguageProvider.Align(),child: Text(LanguageProvider.getTexts('ShareApp').toString())),
            onTap: () => {

            Share.share( "https://play.google.com/store/apps/details?id=com.galaxyinternational.cards&hl=ar&gl=US", subject:''),
          //  Share.share('https://play.google.com/store/apps/details?id=com.baselalzaben99.myapplicationmaps&hl=ar&gl=US', subject: 'Look what I made!')

            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Container(alignment:LanguageProvider.Align(),child: Text(LanguageProvider.getTexts('profile').toString())),

            onTap: () => {

            Navigator.push(context,
            MaterialPageRoute(builder:
            (context) =>
            Body_profile()
            )
            )


          },
          ),

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Container(alignment:LanguageProvider.Align(),child: Text(LanguageProvider.getTexts('logout').toString())),

            onTap: () async => {

    await _googleSignIn.signOut(),
    await _auth.signOut(),
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login_Body()),)

            },
          ),
    /*       Column(
            children: <Widget>[
              FlatButton( color: Colors.deepPurple,
                  shape: CircleBorder(),child: Text(Globalvireables.languageCode,


                  ),
                  onPressed: () {

                    if(Globalvireables.languageCode=="en")
                      Globalvireables.languageCode="ar";
                    else
                      Globalvireables.languageCode="en";

                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login_Body()));


                  })
            ],
          ),*/
          Container(
            height: 400,
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text("version 1.0 - 2021",style: TextStyle(color: Colors.black26,fontWeight: FontWeight.w300),)),

          ),

        ],
      ),
    );
  }
}