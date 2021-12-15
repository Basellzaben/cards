import 'dart:async';
import 'dart:convert';
import 'package:cards/Models/Users.dart';
import 'package:cards/ui/Home/Home_Body.dart';
import 'package:http/http.dart' as http;
import 'package:cards/GlobalVaribales.dart';
import 'package:cards/color/HexColor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class verviaction_body extends StatefulWidget {
  @override
  _verviaction_body createState() => _verviaction_body();
}

class _verviaction_body extends State<verviaction_body> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SmsAutoFill smsAutoFill = SmsAutoFill();
  late String strVerificationId;
  final globalKey = GlobalKey<ScaffoldState>();
  TextEditingController phoneNumEditingController = TextEditingController();
  TextEditingController smsEditingController1 = TextEditingController();
  TextEditingController smsEditingController2 = TextEditingController();
  TextEditingController smsEditingController3 = TextEditingController();
  TextEditingController smsEditingController4 = TextEditingController();
  TextEditingController smsEditingController5 = TextEditingController();
  TextEditingController smsEditingController6 = TextEditingController();
  bool showVerifyNumberWidget = true;
  bool showVerificationCodeWidget = false;
  bool showSuccessWidget = false;


  @override
  void initState() {
    super.initState();
    getCurrentNumber();
  }

  getCurrentNumber() async {
    phoneNumEditingController.text = (await smsAutoFill.hint)!;
    //smsAutoFill.hint;
                 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(Globalvireables.basecolor),
      /*  appBar: AppBar(
          title: Text('Firebase Phone Authentication Sample'),
        ),*/
        key: globalKey,
      //  resizeToAvoidBottomPadding: false,
        body: Center(
          child: SingleChildScrollView(

            child: Padding(
                padding: EdgeInsets.all(45),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if(showVerificationCodeWidget)Container(
  margin: EdgeInsets.only(bottom: 45),
  child: Icon(Icons.mark_email_read_sharp,color: HexColor(Globalvireables.white),size: 90,),
  /*  child: new Image.asset('assets/vervi.png'
                      , height: 110,width: 110,)*/
),
                    if(showVerifyNumberWidget)Container(
                      margin: EdgeInsets.only(bottom: 45),
                      child: Icon(Icons.phone_android,color:  HexColor(Globalvireables.white),size: 90,),
                      /*  child: new Image.asset('assets/vervi.png'
                      , height: 110,width: 110,)*/
                    ),
                    if(showVerifyNumberWidget) Text("ادخل رقم الهاتف",style: TextStyle(color: Colors.white),),
                    if(showVerificationCodeWidget) Text("ادخل الرمز التاكيد",style: TextStyle(color: Colors.white)),

                    if(showVerifyNumberWidget) Container(
                      color: HexColor(Globalvireables.basecolor),
                      child: TextFormField(

                          controller: phoneNumEditingController,

                          // textAlign: LanguageProvider.TxtAlign(),
                          //controller:passwordE,
                          //obscureText: _isObscure,
                          decoration: InputDecoration(
                              fillColor: Colors.white,filled: true,

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: HexColor(Globalvireables.basecolor), width: 2),

                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: HexColor(Globalvireables.basecolor)),
                              ),

                              border: UnderlineInputBorder(),

                             // labelText:"Name",


                              labelStyle: TextStyle(

                                color:Colors.black87,
                              )
                          ),
                        ),
                    ),



                    SizedBox(
                      height: 25,
                    ),
                    if(showVerifyNumberWidget) Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 45),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        alignment: Alignment.center,

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            //  shape: CircleBorder(),
                              primary: Colors.white
                            // primary: HexColor("#ff4a3d")
                          ),
                          child: Container(
                            width: 200,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Text(
                              'أرسال الرمز',
                              style: TextStyle(fontSize: 24,fontWeight:FontWeight.bold ,color: Colors.black87),
                            ),
                          ),
                          onPressed: () {  phoneNumberVerification();
                          Globalvireables.phone=phoneNumEditingController.text;},
                        ),
                      /*  child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 90),
                          color: Colors.white,
                          child: Text("أرســال", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
                          onPressed: () async {
                            phoneNumberVerification();
                            Globalvireables.phone=phoneNumEditingController.text;
                          },
                        ),*/
                      ),
                    ),
                    if(showVerificationCodeWidget)  Row(
                      children: [
                        Container(
                          height: 70,
                          width: 45,
                          color: HexColor(Globalvireables.basecolor),
                          child: TextFormField(
                            maxLength: 1,
                            controller: smsEditingController1,
                            // textAlign: LanguageProvider.TxtAlign(),
                            //controller:passwordE,
                            //obscureText: _isObscure,
                            decoration: InputDecoration(
                                fillColor: Colors.white,filled: true,

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: HexColor(Globalvireables.basecolor), width: 2),

                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: HexColor(Globalvireables.basecolor)),
                                ),

                                border: UnderlineInputBorder(),

                             //   labelText:"Name",


                                labelStyle: TextStyle(

                                  color:Colors.black87,
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 45,
                          color: HexColor(Globalvireables.basecolor),
                          child: TextFormField(
maxLength: 1,

                            controller: smsEditingController2,
                            // textAlign: LanguageProvider.TxtAlign(),
                            //controller:passwordE,
                            //obscureText: _isObscure,
                            decoration: InputDecoration(
                                fillColor: Colors.white,filled: true,

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: HexColor(Globalvireables.basecolor), width: 2),

                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: HexColor(Globalvireables.basecolor)),
                                ),

                                border: UnderlineInputBorder(),

                                //   labelText:"Name",


                                labelStyle: TextStyle(

                                  color:Colors.black87,
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 45,
                          color: HexColor(Globalvireables.basecolor),
                          child: TextFormField(
                            maxLength: 1,

                            controller: smsEditingController3,
                            // textAlign: LanguageProvider.TxtAlign(),
                            //controller:passwordE,
                            //obscureText: _isObscure,
                            decoration: InputDecoration(
                                fillColor: Colors.white,filled: true,

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: HexColor(Globalvireables.basecolor), width: 2),

                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: HexColor(Globalvireables.basecolor)),
                                ),

                                border: UnderlineInputBorder(),

                                //   labelText:"Name",


                                labelStyle: TextStyle(

                                  color:Colors.black87,
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 45,
                          color: HexColor(Globalvireables.basecolor),
                          child: TextFormField(
                            maxLength: 1,

                            controller: smsEditingController4,
                            // textAlign: LanguageProvider.TxtAlign(),
                            //controller:passwordE,
                            //obscureText: _isObscure,
                            decoration: InputDecoration(
                                fillColor: Colors.white,filled: true,

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: HexColor(Globalvireables.basecolor), width: 2),

                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: HexColor(Globalvireables.basecolor)),
                                ),

                                border: UnderlineInputBorder(),

                                //   labelText:"Name",


                                labelStyle: TextStyle(

                                  color:Colors.black87,
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 45,
                          color: HexColor(Globalvireables.basecolor),
                          child: TextFormField(
                            maxLength: 1,

                            controller: smsEditingController5,
                            // textAlign: LanguageProvider.TxtAlign(),
                            //controller:passwordE,
                            //obscureText: _isObscure,
                            decoration: InputDecoration(
                                fillColor: Colors.white,filled: true,

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: HexColor(Globalvireables.basecolor), width: 2),

                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: HexColor(Globalvireables.basecolor)),
                                ),

                                border: UnderlineInputBorder(),

                                //   labelText:"Name",


                                labelStyle: TextStyle(

                                  color:Colors.black87,
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 45,
                          color: HexColor(Globalvireables.basecolor),
                          child: TextFormField(
                            maxLength: 1,

                            controller: smsEditingController6,
                            // textAlign: LanguageProvider.TxtAlign(),
                            //controller:passwordE,
                            //obscureText: _isObscure,
                            decoration: InputDecoration(
                                fillColor: Colors.white,filled: true,

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: HexColor(Globalvireables.basecolor), width: 2),

                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: HexColor(Globalvireables.basecolor)),
                                ),

                                border: UnderlineInputBorder(),

                                //   labelText:"Name",


                                labelStyle: TextStyle(

                                  color:Colors.black87,
                                )
                            ),
                          ),
                        ),
                      ],
                    ),


                    SizedBox(
                      height: 25,
                    ),
                    if(showVerificationCodeWidget) Container(
                      padding: const EdgeInsets.only(top: 50.0),
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                           // shape: CircleBorder(),
                            primary: HexColor(Globalvireables.white)
                        ),
                        child: Container(
                          width: 200,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Text(
                            'تأكـيد',
                            style: TextStyle(fontSize: 24,fontWeight:FontWeight.bold,color: Colors.black87),
                          ),
                        ),
                        onPressed: () {  signInWithPhoneNumber();},
                      ),

                    /*  child: RaisedButton(
                          color: Colors.white,
                          onPressed: () async {
                            signInWithPhoneNumber();
                          },
                          child: Text("تسجيل الدخول", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black))
                      ),*/
                    ),
                    //if(showSuccessWidget) Text('You are successfully logged in!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))
                  ],
                )),
          ),
        ));
  }

  Future<void> phoneNumberVerification() async {

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
      displayMessage('فشل التحقق من رقم الهاتف');
    };

    PhoneCodeSent phoneCodeSent =
        (String verificationId, [int? forceResendingToken]) async {
      displayMessage('يرجى التحقق من هاتفك للحصول على رمز التحقق');
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
    } catch (e) {
      displayMessage("فشل التحقق من رقم الهاتف");
    }
  }

  void displayMessage(String message) {
    globalKey.currentState!.showSnackBar(SnackBar(content: Text(message)));
  }

  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: strVerificationId,
        smsCode: smsEditingController1.text+smsEditingController2.text+smsEditingController3.text
        +smsEditingController4.text+smsEditingController5.text+smsEditingController6.text,
      );

      final User? user = (await firebaseAuth.signInWithCredential(credential)).user;

     // displayMessage("Successfully signed in UID: ${user!.uid}");

      Regester(Globalvireables.name,Globalvireables.email,Globalvireables.phone,"",Globalvireables.photoURL,Globalvireables.password);


      setState(() {
        showVerificationCodeWidget = false;
        showSuccessWidget = true;
      });
    } catch (e) {
      displayMessage("Failed to sign in: " + e.toString());
    }
  }
  Regester(String name,String email,String mobile,String country,String profileimage,String password) async {

    Uri apiUrl = Uri.parse(Globalvireables.regesterapi);

    final json = {
      "Name": name,
      "Email": email,
      "Mobile": mobile,
      "Country":country,
      "ProfileImage": profileimage,
      "Password": password};
    http.Response response=await http.post(apiUrl, body: json);
    try {
      response = await http.post(apiUrl, body: json).whenComplete(() {
print(response.body.toString() +"respncee");
        var jsonResponse = jsonDecode(response.body);

        Users user = Users.fromJson(jsonResponse);

        print(user.getid() + " ussssersss");

        Globalvireables.email=user.getEmail();
        Globalvireables.phone=user.getMobile();
        Globalvireables.name=user.getname();
        Globalvireables.password=user.getPassword();
        Globalvireables.country=user.getCountry();
        Globalvireables.photoURL=user.getProfileImage();
        Globalvireables.ID=user.getid();



print("rees"+jsonResponse.toString());
        if (user.getid()=="0") {

          displayMessage('The number is registered, please log in');
        }
        else if(user.getid()!="0"){


          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home_Body()),);

        }else{
          displayMessage('error in logup');

        }
      //  if(email.toString().length>5)
          displayMessage('error');

      });
    }on TimeoutException catch (_) {
      displayMessage('out time');

    }
  }


/*
  Future<String?> signInwithGoogle() async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignIn _googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }*/

  /*Future<void> signOutFromGoogle() async{
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
*/

}