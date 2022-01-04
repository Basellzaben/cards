import 'dart:async';
import 'dart:convert';
import 'package:cards/LanguageProvider.dart';
import 'package:cards/Models/Users.dart';
import 'package:cards/ui/Home/Home_Body.dart';
import 'package:cards/ui/login/Login_Body.dart';
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
  String selected="cxA";

  //List<String> country = ["+9620", "+62", "+96v2", "+9g62"];
   List<String> country=["+973","+964","+962","+961","+970","+966","+965","+968","+963","+974"];
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SmsAutoFill smsAutoFill = SmsAutoFill();
  late String strVerificationId;
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
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
String? _selectedCountry="+962";

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
                    if(showVerifyNumberWidget) Text(LanguageProvider.getTexts('Enteraphone').toString(),style: TextStyle(color: Colors.white),),
                    if(showVerificationCodeWidget) Text(LanguageProvider.getTexts('confirmationcode').toString(),style: TextStyle(color: Colors.white)),

                    if(showVerifyNumberWidget) Container(
                      color: HexColor(Globalvireables.basecolor),



                      child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                          Align(

                            child: Container(
height: 55,

                            width: 75,
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                             //   color: Theme.of(context).primaryColor,
                                color: Colors.white,  borderRadius: BorderRadius.circular(10)),
                            child: DropdownButton<String>(
                              onChanged: (value) {
                                setState(() {
                                  _selectedCountry = value;
                                });
                              },
                              value: _selectedCountry,

                              // Hide the default underline
                              underline: Container(),
                              hint: Center(
                                  child: Text(
                                    'Select the aniaml you love',
                                    style: TextStyle(color: Colors.white),
                                  )),

                              isExpanded: true,

                              // The list of options
                              items: country
                                  .map((e) => DropdownMenuItem(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    e,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                value: e,
                              ))
                                  .toList(),

                              // Customize the selected item
                              selectedItemBuilder: (BuildContext context) => country
                                  .map((e) => Center(
                                child: Text(
                                  e,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                                  .toList(),
                            ),
                        ),
                          ),
                            Container(
                              width: 220,
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
                          ],
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

                        child: Container(
                          margin: EdgeInsets.only(left: 50,right: 50),

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              //  shape: CircleBorder(),
                                primary: Colors.white
                              // primary: HexColor("#ff4a3d")
                            ),
                            child: Container(
                              width: 500,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Text(
                                LanguageProvider.getTexts('Sendcode').toString(),
                                style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold ,color: Colors.black87),
                              ),
                            ),
                            onPressed: () {
                            phoneNumberVerification();
                            if(phoneNumEditingController.text!=null)
                              if(phoneNumEditingController.text.startsWith("07"))
                            {
                          //    phoneNumEditingController.text= phoneNumEditingController.text.replaceRange(0, 1, _selectedCountry!);

                              Globalvireables.phone= phoneNumEditingController.text.replaceRange(0, 1, _selectedCountry!);
                            }else{
                                Globalvireables.phone= phoneNumEditingController.text;
                              }


                       },
                          ),
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
                    if(showVerificationCodeWidget)  Center(
                          child: Center(
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 300,

                              color: HexColor(Globalvireables.basecolor),
                              child: TextFormField(
                                maxLength: 6,
                                keyboardType: TextInputType.number,
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
                          ),
                          /*Container(
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
                         ),*/


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
                            LanguageProvider.getTexts('Continue').toString(),
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
                ),
          ),
        ));
  }

  Future<void> phoneNumberVerification() async {

    PhoneVerificationCompleted phoneVerificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await firebaseAuth.signInWithCredential(phoneAuthCredential);

      if(Globalvireables.languageCode=="en")
      displayMessage("Phone number is automatically verified and user signed in");
      else
       displayMessage("يتم التحقق تلقائيًا من رقم الهاتف وتسجيل دخول المستخدم");

      setState(() {
        showVerifyNumberWidget = false;
        showVerificationCodeWidget = false;
        showSuccessWidget = true;
      });
    };

    PhoneVerificationFailed phoneVerificationFailed =
        (FirebaseAuthException authException) {
      if(Globalvireables.languageCode=="en")
      displayMessage('فشل التحقق من رقم الهاتف');
    else
      displayMessage("Phone number verification failed");

    };

    PhoneCodeSent phoneCodeSent =
        (String verificationId, [int? forceResendingToken]) async {
      if(Globalvireables.languageCode=="ar")
      displayMessage('يرجى التحقق من هاتفك للحصول على رمز التحقق');
      else
        displayMessage("Please check your phone for a verification code");
      strVerificationId = verificationId;
      setState(() {
        showVerifyNumberWidget = false;
        showVerificationCodeWidget = true;
      });
    };

    PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout =
        (String verificationId) {
    //  displayMessage("verification code: " + verificationId);
      strVerificationId = verificationId;
      setState(() {
        showVerifyNumberWidget = false;
        showVerificationCodeWidget = true;
      });
    };

    try {
var x="";
      if(phoneNumEditingController.text!=null)
        if(phoneNumEditingController.text.startsWith("07"))
        {
        x= phoneNumEditingController.text.replaceRange(0, 1, _selectedCountry!);
        }else{
         x= phoneNumEditingController.text;
        }


      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: x,
          timeout: const Duration(seconds: 5),
          verificationCompleted: phoneVerificationCompleted,
          verificationFailed: phoneVerificationFailed,
          codeSent: phoneCodeSent,
          codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
    } catch (e) {
      if(Globalvireables.languageCode=="ar")
        displayMessage('فشل التحقق من رقم الهاتف');
      else
        displayMessage("Phone number verification failed");

    }
  }

  void displayMessage(String message) {
    globalKey.currentState!.showSnackBar(SnackBar(content: Text(message)));
  }

  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: strVerificationId,
        smsCode: smsEditingController1.text/*+smsEditingController2.text+smsEditingController3.text
        +smsEditingController4.text+smsEditingController5.text+smsEditingController6.text,
*/      );

      final User? user = (await firebaseAuth.signInWithCredential(credential)).user;
print(Globalvireables.regorupdate+"regorupdate");
     // displayMessage("Successfully signed in UID: ${user!.uid}");
if(Globalvireables.regorupdate.contains("0"))
  Regester(Globalvireables.name,Globalvireables.email,Globalvireables.phone,"",Globalvireables.photoURL,Globalvireables.password);
else if(Globalvireables.regorupdate.contains("1"))
  Editprofile(Globalvireables.name,Globalvireables.email,Globalvireables.phone,Globalvireables.country,Globalvireables.password,context);

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

var countrypostion=-1;
    for (var i = 0; i < 10; i++) {
print (i.toString()+"  = postion");
      if(mobile.substring(0,4)==Globalvireables.countryzipcode[i]){
        print (i.toString()+"  = postion true");

        country=Globalvireables.countryname[i];
      }
    }

    final json = {
      "Name": name,
      "Email": email,
      "Mobile": mobile,
      "Country":country,
      "ProfileImage": profileimage,
      "Password": password};
    http.Response response=await http.post(apiUrl, body: json);
    try {

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
if(Globalvireables.languageCode=="en")
        displayMessage('The number is registered, please log in');
else
  displayMessage('الرقم مسجل ، الرجاء تسجيل الدخول');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login_Body()),);
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


/*      response = await http.post(apiUrl, body: json).whenComplete(() {
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

      });*/
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
  Editprofile(String name,String email,String mobile,String country,String password,BuildContext context) async {
    try {
      Globalvireables.regorupdate="0";
      Uri apiUrl = Uri.parse(Globalvireables.regesterapi+"/"+Globalvireables.ID);
     // showAlert(context,"Editing ...");

      final json = {
        "ID":Globalvireables.ID,
        "Name": name,
        "Email": email,
        "Mobile": mobile,
        "Country":country,
        "ProfileImage": Globalvireables.imagen,
        "Password": password};

      print ("card save");
      Globalvireables.name=name;

      //await http.post(apiUrl,body: jsone);

      http.Response response=await http.put(apiUrl, body: json);

      var jsonResponse = jsonDecode(response.body);

if(!jsonResponse.toString().contains("error")) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login_Body()),);
//  Globalvireables.regorupdate="0";
}
      print("jsooooon"+jsonResponse.toString());


      if (!jsonResponse.toString().contains("ID: 0")) {

        print("succ = "+jsonResponse.toString());
        Navigator.pop(context);

      }
      else {
        Navigator.pop(context);
        displayMessage("Login information error");
        /* displayMessage('out time');*/
        print("error="+jsonResponse.toString());
      }
      print("succ = "+jsonResponse.toString());

      //  print("esaf = "+jsonResponse.toString());

      /*   response = await http.post(apiUrl, body: jsone).whenComplete(() {


        var jsonResponse = jsonDecode(response.body);

        if (!jsonResponse.toString().contains("ID: 0")) {

          print("succ = "+jsonResponse.toString());
          Navigator.pop(context);

        }
        else {
          Navigator.pop(context);
          displayMessage("Login information error");
          *//* displayMessage('out time');*//*
          print("error="+jsonResponse.toString());
        }
        print("succ = "+jsonResponse.toString());

        //  print("esaf = "+jsonResponse.toString());


      });*/
    }on TimeoutException catch (_) {
      // displayMessage('out time');
      displayMessage("out time");
      Navigator.pop(context);
      // displayMessage("Login information error");

    }on FormatException catch(_){

      Navigator.pop(context);
      displayMessage("Login information error");


    }
    Navigator.pop(context);
  }
}