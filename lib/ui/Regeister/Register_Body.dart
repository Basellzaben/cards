
import 'dart:math';

import 'package:cards/GlobalVaribales.dart';
import 'package:cards/color/HexColor.dart';
import 'package:cards/ui/login/Login_Body.dart';
import 'package:cards/ui/vervicationpage/vervication_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
class Register_Body extends StatefulWidget {
  goBackToPreviousScreen(BuildContext context){
    // Navigator.pop(context);
    /* Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Index_Main()),);*/
  }
  @override
  _Register_Body createState() => _Register_Body();
}
goBackToPreviousScreen(BuildContext context) {

  /* Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Index_Main()),);*/
  //Navigator.pop(context);
}

class _Register_Body extends State<Register_Body> {


  final TextEditingController _controller = new TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final globalKey = GlobalKey<ScaffoldState>();
  var items = ['+962', '+999', '+565'];
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SmsAutoFill smsAutoFill = SmsAutoFill();
  late String strVerificationId;
  bool showVerifyNumberWidget = true;
  bool showVerificationCodeWidget = false;
  bool showSuccessWidget = false;
  @override
  Widget build(BuildContext context) {
    _controller.text="+962";
    return Scaffold(
    resizeToAvoidBottomInset : false,
key: globalKey,
    backgroundColor: Colors.white,
    body: Container(

    child: Column(children: [

    Container(
    /* decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/signincover.png"),
      fit: BoxFit.cover,
    ),
  ),*/

    // margin: EdgeInsets.only(top: 80),

    child: new Image.asset('assets/signuplogo.png'
    , ),
    ),

      Container(
        color: Colors.transparent,
        margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 40.0,bottom: 12.0),

        //  color: Colors.white,
        width: MediaQuery.of(context).size.height,
        // height: MediaQuery.of(context).size.height,
        child: TextFormField(
          controller: name,
          // textAlign: LanguageProvider.TxtAlign(),
          //controller:passwordE,
          //obscureText: _isObscure,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: HexColor(Globalvireables.basecolor), width: 2),

              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: HexColor(Globalvireables.basecolor)),
              ),

              border: UnderlineInputBorder(),

              labelText:"Name",


              labelStyle: TextStyle(

                color:Colors.black87,
              )
          ),
        ),
      ),
    Container(
    color: Colors.transparent,
    margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0,bottom: 12.0),

    //  color: Colors.white,
    width: MediaQuery.of(context).size.height,
    // height: MediaQuery.of(context).size.height,
    child: TextFormField(
      controller: email,

      // textAlign: LanguageProvider.TxtAlign(),
    //controller:passwordE,
    //obscureText: _isObscure,
    decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    borderSide: BorderSide(color: HexColor(Globalvireables.basecolor), width: 2),

    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: HexColor(Globalvireables.basecolor)),
    ),

    border: UnderlineInputBorder(),

    labelText:"Email (optional)",


    labelStyle: TextStyle(

    color:Colors.black87,
    )
    ),
    ),
    ),
    Container(
    color: Colors.transparent,
    margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0,bottom: 12.0),

    //  color: Colors.white,
    width: MediaQuery.of(context).size.height,
    // height: MediaQuery.of(context).size.height,
    child: TextFormField(
      controller: password,
    // textAlign: LanguageProvider.TxtAlign(),
    //controller:passwordE,
    //obscureText: _isObscure,
    decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    borderSide: BorderSide(color: HexColor(Globalvireables.basecolor), width: 2),

    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: HexColor(Globalvireables.basecolor)),
    ),

    border: UnderlineInputBorder(),

    labelText:"Password",


    labelStyle: TextStyle(
    color:Colors.black87,


    )
    ),
    ),
    ),


/*
Container(
  margin: EdgeInsets.only(top: 10,left: 20,right: 20),
  child:Row(children: [
    Container(
      width:90 ,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          suffixIcon: PopupMenuButton<String>(
            icon: const Icon(Icons.arrow_drop_down),
            onSelected: (String value) {
              _controller.text = value;
            },
            itemBuilder: (BuildContext context) {
              return items
                  .map<PopupMenuItem<String>>((String value) {
                return new PopupMenuItem(
                    child: new Text(value), value: value);
              }).toList();
            },
          ),
        ),
      ),
    ),

    Container(

      color: Colors.transparent,
      margin: const EdgeInsets.all(10),

      //  color: Colors.white,
      width: MediaQuery.of(context).size.height/3.43,
      // height: MediaQuery.of(context).size.height,
      child: TextFormField(

        controller: phoneNumEditingController,//  phoneNumEditingController
          // textAlign: LanguageProvider.TxtAlign(),
        //controller:passwordE,
        //obscureText: _isObscure,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: HexColor(Globalvireables.basecolor), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: HexColor(Globalvireables.basecolor)),
            ),
            border: UnderlineInputBorder(),
            labelText:"Phone Number",
            labelStyle: TextStyle(
              color:Colors.black87,
            )
        ),
      ),
    ),

  
  ],),
),*/



    Container(
    margin: EdgeInsets.only(top: 30),
    height: 55,
    child: ElevatedButton(
    child: Text('NEXT'),
    onPressed: () {/*phoneNumberVerification();*/

if(name.text.isEmpty || password.text.isEmpty ){
  displayMessage("Your name and password are information that must be entered");
}else if(password.text.toString().length<5){
  displayMessage("The password must be at least six characters long");
}
else {
  Globalvireables.name = name.text;
  Globalvireables.email = email.text;
  Globalvireables.password = password.text;


  Navigator.push(context,
      MaterialPageRoute(builder:
          (context) =>
          verviaction_body()
      )
  );
}

      },
    style: ElevatedButton.styleFrom(
    primary: HexColor(Globalvireables.basecolor),
    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
    textStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold)),
    ),
    ),



    Row(children: [
    Spacer(),

    Container(
    margin: EdgeInsets.only(top: 20),
    child: Text("Already have an account ? ",style: TextStyle(fontWeight: FontWeight.bold,
    color: HexColor(Globalvireables.black),fontSize: 13
    ),),
    ),
    new GestureDetector(
    onTap: (){
    Navigator.push(context,
    MaterialPageRoute(builder:
    (context) =>
    Register_Body()
    )
    );
    },



   child: Container(
     child: new GestureDetector(
         onTap: (){
           Navigator.push(context,
               MaterialPageRoute(builder:
                   (context) =>
                   Login_Body()
               )
           );
         },
         child: Container(
           margin: EdgeInsets.only(top: 20),
           child: Text("Login now",style: TextStyle(fontWeight: FontWeight.bold,
               color: HexColor(Globalvireables.basecolor),fontSize: 14
           ),),
         )),

    )),

    Spacer(),

    ],)

    ]

    ),

    ));

  }
  void displayMessage(String message) {
    globalKey.currentState!.showSnackBar(SnackBar(content: Text(message)));
  }
/*  Future<void> phoneNumberVerification() async {

    PhoneVerificationCompleted phoneVerificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await firebaseAuth.signInWithCredential(phoneAuthCredential);
      displayMessage(
          "Phone number is automatically verified and user signed in: ${firebaseAuth.currentUser!.uid}");
      setState(() {
        showVerifyNumberWidget = false;
        showVerificationCodeWidget = false;
        showSuccessWidget = true;
      });
    };

    PhoneVerificationFailed phoneVerificationFailed =
        (FirebaseAuthException authException) {
      displayMessage('Phone number verification is failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    PhoneCodeSent phoneCodeSent =
        (String verificationId, [int? forceResendingToken]) async {
      displayMessage('Please check your phone for the verification code.');
      strVerificationId = verificationId;
      setState(() {
        showVerifyNumberWidget = false;
        showVerificationCodeWidget = true;
      });
    };

    PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout =
        (String verificationId) {
      displayMessage("verification code: " + verificationId);
      strVerificationId = verificationId;
      setState(() {
        showVerifyNumberWidget = false;
        showVerificationCodeWidget = true;
      });
    };

    try {
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumEditingController.text,
          timeout: const Duration(seconds: 5),
          verificationCompleted: phoneVerificationCompleted,
          verificationFailed: phoneVerificationFailed,
          codeSent: phoneCodeSent,
          codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
      displayMessage("Successfully to Verify Phone Number: ${e}");
    } catch (e) {
      displayMessage("Failed to Verify Phone Number: ${e}");
    }
  }*/
/*
  void displayMessage(String message) {
    globalKey.currentState!.showSnackBar(SnackBar(content: Text(message)));
  }

  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: strVerificationId,
        smsCode: smsEditingController.text,
      );

      final User? user = (await firebaseAuth.signInWithCredential(credential)).user;

      displayMessage("Successfully signed in UID: ${user!.uid}");

      setState(() {
        showVerificationCodeWidget = false;
        showSuccessWidget = true;
      });
    } catch (e) {
      displayMessage("Failed to sign in: " + e.toString());
    }
  }*/
}