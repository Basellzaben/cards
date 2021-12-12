
import 'dart:async';
import 'dart:convert';

import 'package:cards/GlobalVaribales.dart';
import 'package:cards/color/HexColor.dart';
import 'package:cards/ui/NavDrawer.dart';
import 'package:cards/ui/Regeister/Register_Body.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Home_Body extends StatefulWidget {
  goBackToPreviousScreen(BuildContext context){
    // Navigator.pop(context);
    /* Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Index_Main()),);*/
  }
  @override
  _Home_Body createState() => _Home_Body();
}
goBackToPreviousScreen(BuildContext context) {

  /* Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Index_Main()),);*/
  //Navigator.pop(context);





}

class _Home_Body extends State<Home_Body> with SingleTickerProviderStateMixin {
   late AnimationController controller;
   late Animation colorAnimation;
   late Animation sizeAnimation;
   final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // Defining controller with animation duration of two seconds
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    // Defining both color and size animations
    colorAnimation =
        ColorTween(end: HexColor(Globalvireables.basecolor), begin: HexColor(Globalvireables.secondarycolor)).animate(controller);
    sizeAnimation = Tween<double>(begin: 70.0, end: 75.0).animate(controller);

   /* colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
*/
    // Rebuilding the screen when animation goes ahead
    controller.addListener(() {
      //setState(() {});
    });

    // Repeat the animation after finish
    controller.repeat();

    //For single time
    //controller.forward()

    //Reverses the animation instead of starting it again and repeats
    //controller.repeat(reverse: true);
  }

  TextEditingController timeinput = TextEditingController();
  TextEditingController timeout = TextEditingController();
  TextEditingController longtimecontroler = TextEditingController();
  String date = "";
  String timelong = "";
  User? user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset : false,
        drawer: NavDrawer(),
        appBar: PreferredSize(

          preferredSize: Size.fromHeight(150), // Set this height
          child: Container(

    decoration: new BoxDecoration(
    borderRadius: BorderRadius.vertical(
    bottom: Radius.elliptical(
    MediaQuery.of(context).size.width, 50.0)),
            color: HexColor(Globalvireables.basecolor)),
            child: Column(
              //    mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(right: 5, left: 5, top: 40),

                          child: Icon(
                            Icons.person_rounded,
                            size: 40.0,
                            color: Colors.white,
                          )),
                      /* Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Image.asset(
                          'assest/profile.png',
                          height: 30,
                          width: 30,
                        ),


                      ),*/
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(right: 0, left: 0, top: 45),
                        child: Text(Globalvireables.name,
                          style: TextStyle(color: Colors.white, fontSize: 16),),
                      )
                    ]),


                Center(
                  child: Container(
                    margin: EdgeInsets.only(right: 0, left: 0, top: 16),

                    width: 290
                    , height: 55,
                    child: Center(

                        child: TextField(
                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'Search.',

                            prefixIcon: Icon(Icons.search),
                            hintStyle: TextStyle(color: Colors.black12),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)),
                              //      borderSide: BorderSide(color: Colors.green, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)),
                              //   borderSide: BorderSide(color: Colors.green, width: 2),
                            ),
                          ),)

                    ),
                  ),
                )


              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          /*   decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/emptycards.png"), fit: BoxFit.scaleDown)),
        //  child: Text(Globalvireables.email),
*/

            child: bodyd()));
  }


  Widget bodyd() {
    return Container(
      child: SingleChildScrollView(

        child: Column(
          children: [

            Container(
              alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 100),
                child: Text("Add your first card file now", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    color: HexColor(Globalvireables.secondarycolor)
                ),)),


        Container(
          margin: EdgeInsets.only(top: 20),
          child: Icon(
            Icons.credit_card_outlined,
            size: 80.0,
            color: HexColor(Globalvireables.secondarycolor),
          ))
    ,
            Container(
              alignment: Alignment.bottomCenter,
              height: sizeAnimation.value,
              width: sizeAnimation.value,
            margin: EdgeInsets.only(top: 200),
              child: ElevatedButton(




                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  //  primary: HexColor("#4267b2")
                    primary:  colorAnimation.value
                ),
                child: Container(
                 // width: 100,
                  //height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w300,),
                  ),
                ),
                onPressed: () {},
              ),
            ),

          ],
        ),
      ),
    );
  }
}


