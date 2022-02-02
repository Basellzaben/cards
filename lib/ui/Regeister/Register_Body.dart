
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cards/GlobalVaribales.dart';
import 'package:cards/LanguageProvider.dart';
import 'package:cards/color/HexColor.dart';
import 'package:cards/ui/login/Login_Body.dart';
import 'package:cards/ui/vervicationpage/vervication_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Future<bool> _onWillPop() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Login","0");
    return true;
  }
  String img64=Globalvireables.imagen;
  final TextEditingController _controller = new TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  var items = ['+962', '+999', '+565'];
  SmsAutoFill smsAutoFill = SmsAutoFill();
  late String strVerificationId;
  bool showVerifyNumberWidget = true;
  bool showVerificationCodeWidget = false;
  bool showSuccessWidget = false;
  Image? imgs ;
  final picker = ImagePicker();

  var imgFile;
  @override
  Widget build(BuildContext context) {
    _controller.text="+962";
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
      resizeToAvoidBottomInset : false,
key: globalKey,
      backgroundColor: Colors.white,
      body: Container(

      child: SingleChildScrollView(
        child: Column(children: [

       /* Container(
        *//* decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/signincover.png"),
          fit: BoxFit.cover,
        ),
  ),*//*

        // margin: EdgeInsets.only(top: 80),

        child: new Image.asset('assets/signupcovernew.jpg'
        , ),
        ),*/
        Container(
          margin: EdgeInsets.only(top: 40,left: 15),
          alignment: Alignment.topLeft,
            child: Text(LanguageProvider.getTexts('Registernow').toString(),style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: HexColor(Globalvireables.basecolor)
            ),)
        ),

           Container(
            margin: EdgeInsets.only(top: 30),
            child: Center(
              child: InkWell(
                onTap: () async {


                   imgFile = await picker.getImage(
                      source: ImageSource.gallery

                  );
                   File selected = File(imgFile.path);

                   setState((){
                    // /100dp  imgs.add(Image.file(imgFile));
                    imgs=Image.file(selected);
                    final bytes =
                    selected.readAsBytesSync();
                    img64 = base64Encode(bytes);
                  });

                },
                child: image(),

                /*ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset('assets/emptycards.png',
                                    width: 110.0, height: 110.0),
                              ),*/
              ),
            ),
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

                  labelText:LanguageProvider.getTexts('name').toString(),


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

        labelText:LanguageProvider.getTexts('email').toString(),


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

        labelText:LanguageProvider.getTexts('password').toString(),


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
              controller: password2,
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

                  labelText:LanguageProvider.getTexts('confirmpassword').toString(),


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
        child: Text(LanguageProvider.getTexts('next').toString()),
        onPressed: () {/*phoneNumberVerification();*/

if(name.text.isEmpty || password.text.isEmpty ){
  if(Globalvireables.languageCode=="en")
  displayMessage("Your name and password are information that must be entered");
else
      displayMessage("اسمك وكلمة مرورك من المعلومات التي يجب إدخالها");


}else if(password.text.toString().length<6){
  if(Globalvireables.languageCode=="en")
  displayMessage("The password must be at least six characters long");
  else
  displayMessage("يجب أن تتكون كلمة المرور من ستة أحرف على الأقل");

}
else if(password.text!=null && password.text==password2.text){
  Globalvireables.photoURL=img64;
  Globalvireables.name = name.text;
  Globalvireables.email = email.text;
  Globalvireables.password = password.text;


  Navigator.push(context,
          MaterialPageRoute(builder:
              (context) =>
              verviaction_body()
          )
  );
}else{
  if(Globalvireables.languageCode=="ar")
  displayMessage("أعد كتابة كلمة المرور بشكل صحيح");
else
  displayMessage("Retype the password correctly");
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


          if(Globalvireables.languageCode=="en")
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
else
            Row(children: [
              Spacer(),
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
                          child: Text(" سجل الدخول ",style: TextStyle(fontWeight: FontWeight.bold,
                              color: HexColor(Globalvireables.basecolor),fontSize: 14
                          ),),
                        )),

                  )),
              Container(
                margin: EdgeInsets.only(top: 20,left: 5,right: 5),
                child: Text("هل تمتلك حساب بالفعل ؟   ",style: TextStyle(fontWeight: FontWeight.bold,
                    color: HexColor(Globalvireables.black),fontSize: 13
                ),),
              ),


              Spacer(),

            ],)

        ]

        ),
      ),

      )),
    );

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
  Widget image(){
    if(imgs !=null)
      return SingleChildScrollView(
        child: Container(
            width: 150,
            height: 150,
            child:imgs
        ),
      );
    else
      return Container(
        //child: Image.asset('assets/emptyfile.png'),
        child: Icon(
          Icons.person_rounded,
          size: 100.0,
          color: HexColor(Globalvireables.basecolor),
        ),
      );
  }
}