import 'package:cards/GlobalVaribales.dart';
import 'package:cards/LanguageProvider.dart';
import 'package:cards/color/HexColor.dart';
import 'package:cards/ui/Home/Home_Body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'Profile/Body_profile.dart';
import 'login/Login_Body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    SharedPreferences prefs;
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

            leading: Icon(Icons.share,color: Colors.lightGreen,),
            title: Container(alignment:LanguageProvider.Align(),child: Text(LanguageProvider.getTexts('ShareApp').toString())),
            onTap: () => {

            Share.share( "https://play.google.com/store/apps/details?id=com.galaxyinternational.cards&hl=ar&gl=US", subject:''),
          //  Share.share('https://play.google.com/store/apps/details?id=com.baselalzaben99.myapplicationmaps&hl=ar&gl=US', subject: 'Look what I made!')

            },
          ),
  /*        ListTile(
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
          )*/

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Container(alignment:LanguageProvider.Align(),child: Text(LanguageProvider.getTexts('logout').toString())),

            onTap: () async => {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop')

/*
     prefs = await SharedPreferences.getInstance(),

    prefs.setString("Login","0"),


    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login_Body()),)
*/

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

              SharedPreferences prefs = await SharedPreferences.getInstance();

              prefs.setString("Login","0");


              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home_Body()));

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

          Container(
            height: 280,
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