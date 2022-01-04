import 'dart:async';
import 'dart:convert';
import 'package:cards/GlobalVaribales.dart';
import 'package:cards/Models/Users.dart';
import 'package:cards/color/HexColor.dart';
import 'package:cards/ui/FingerAuth/FingerPrintAuth.dart';
import 'package:cards/ui/Home/Home_Body.dart';
import 'package:cards/ui/Regeister/Register_Body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import '../../LanguageProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../LocalAuthApi.dart';

import '../ScanScreen.dart';
class Login_Body extends StatefulWidget {
  goBackToPreviousScreen(BuildContext context){
    // Navigator.pop(context);
   /* Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Index_Main()),);*/





  }
  @override
  _Login_Body createState() => _Login_Body();
}
goBackToPreviousScreen(BuildContext context) {

 /* Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Index_Main()),);*/
  //Navigator.pop(context);
}

class _Login_Body extends State<Login_Body> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController passwordcontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;

  //final fbLogin = FacebookLogin();
  TextEditingController timeinput = TextEditingController();
  TextEditingController timeout = TextEditingController();
  TextEditingController longtimecontroler = TextEditingController();
  String date="";
  String timelong="";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();



  login () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    if(prefs.getBool('activefingerprint')!=null &&   prefs.getString("Login")!=null)
      if(prefs.getBool('activefingerprint')! &&   prefs.getString("Login")=="0"){

        passwordcontroler.text=prefs.getString('password')!;
        emailcontroler.text=prefs.getString('email')!;
        try {
        final isAuthenticated = await LocalAuthApi.authenticate();
          print(isAuthenticated.toString() + " state");
          if (isAuthenticated) {

            Login(prefs.getString('email')!,prefs.getString('password')!,context);
           /* Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Login_Body()),
            );*/
          }
        }on PlatformException catch(e){
          print(e.message.toString()+"  error");
        }
       /* Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                FingerPrintAuth()));*/

      }

    print(prefs.getBool('activefingerprint').toString()+"savvvve");

  }


  @override
   initState(){
   /* SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool('activefingerprint')!=null)
      if(prefs.getBool('activefingerprint')!){


        passwordcontroler.text=prefs.getString('password')!;
        emailcontroler.text=prefs.getString('email')!;


      }*/
   // login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Globalvireables.regorupdate="0";
    SharedPreferences   prefs;
    login();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          key: _scaffoldKey,
         // resizeToAvoidBottomInset : false,

backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
   child: SingleChildScrollView(

   /* decoration: BoxDecoration(

          image: DecorationImage(

            image: AssetImage("assets/signincover.png"),

            fit: BoxFit.cover,

          ),

      ),*/



   // margin: EdgeInsets.only(top: 80),



                child: new Image.asset('assets/signincovernew.jpg')


  ),
),
              SingleChildScrollView(
                child: Row(children: [
                  Column(children: [
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Card Keeper ",style: TextStyle(color: HexColor(Globalvireables.basecolor),
                            fontSize: 27,fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),


                    Container(
                      width: 150,
                      margin: EdgeInsets.only(top: 10,left: 20),
                      child: Align
                      (
                      alignment: Alignment.centerLeft,
                      child: Text(LanguageProvider.getTexts('Allyour').toString(),textDirection: LanguageProvider.getDirection(),style: TextStyle(color: HexColor(Globalvireables.secondarycolor),
                      fontSize: 16,/*fontWeight: FontWeight.bold*/
                     ),
                     ),
                     ),
                     ),
                  ],),



              /*    Container (
  margin: EdgeInsets.only(left: 0,top: 20),
                   child: new Image.asset('assets/logo.png'
                   , width: 100,height: 100,),
                            )*/

             ] ),
              ),
              Container(
                color: Colors.transparent,
                margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 40.0,bottom: 12.0),

                //  color: Colors.white,
                width: MediaQuery.of(context).size.height,
                // height: MediaQuery.of(context).size.height,
                child: TextFormField(
                  controller: emailcontroler,
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
                  controller: passwordcontroler,
                  obscureText: true,
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


Row(children: [
  Spacer(),
  ElevatedButton(
      style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            primary: HexColor("#4267b2")
      ),
      child: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Text(
            'F',
            style: TextStyle(fontSize: 24,fontWeight:FontWeight.bold ),
          ),
      ),
      onPressed: () {/*signInWithFacebook();*/},
  ),
  ElevatedButton(
      style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            primary: HexColor("#ff4a3d")
      ),
      child: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Text(
            'G+',
            style: TextStyle(fontSize: 24,fontWeight:FontWeight.bold ),
          ),
      ),
      onPressed: () {signInwithGoogle(context,LanguageProvider.getTexts('Signing').toString());},
  ),
  Spacer(),


],),




             /* Container(
                  margin: const EdgeInsets.only(left: 30.0,right: 30.0,top: 30.0,bottom: 0.0),
                  color: HexColor(Globalvireables.basecolor),
                  //      color: Colors.deepPurple,
                  width: MediaQuery.of(context).size.height,
                  height:60,
                  child: ElevatedButton(

                    onPressed: () async {

                    },
                    child: Text('login'),
                  )
              ),
*/

              Container(
                margin: EdgeInsets.only(top: 30),
                height: 55,
                child: ElevatedButton(
                  child: Text(LanguageProvider.getTexts('login').toString()),

                  onPressed: () {  /*signIn_post();*/

if(emailcontroler.text.toString().length>5 && passwordcontroler.text.toString().length>5)
                 Login(emailcontroler.text,passwordcontroler.text,context);
else
  displayMessage(LanguageProvider.getTexts('loginhint').toString());



                  /*  Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) =>
                                ScanScreen()
                        )
                    );*/

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
                  child: Text(LanguageProvider.getTexts('Donthaveaccount').toString(),style: TextStyle(fontWeight: FontWeight.bold,
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
                  margin: EdgeInsets.only(top: 20),
                  child: Text(LanguageProvider.getTexts('Registernow').toString(),textDirection: LanguageProvider.getDirection(),style: TextStyle(fontWeight: FontWeight.bold,
                      color: HexColor(Globalvireables.basecolor),fontSize: 14
                  ),),
                )),

                Spacer(),

              ])
  else
                  Row(children: [
                  Spacer(),


              new GestureDetector(
                  onTap: () async {

                       prefs = await SharedPreferences.getInstance();
                    prefs.setString("Login","1");

                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) =>
                            Register_Body()
                        )
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(LanguageProvider.getTexts('Registernow').toString(),textDirection: LanguageProvider.getDirection(),style: TextStyle(fontWeight: FontWeight.bold,
                        color: HexColor(Globalvireables.basecolor),fontSize: 14
                    ),),
                  )),

                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(LanguageProvider.getTexts('Donthaveaccount').toString(),style: TextStyle(fontWeight: FontWeight.bold,
                          color: HexColor(Globalvireables.black),fontSize: 13
                      ),),
                    ),


              Spacer(),

            ],

              )

            ]

          ),

      ),
        )),
    );

  }
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
  Future<String?> signInwithGoogle(BuildContext context,String text) async {
  //  if(check()==true){
    try {
      signOutFromGoogle();
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      showAlert(context,text);

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final googleAccount = await FirebaseAuth.instance.signInWithCredential(credential);

      await _auth.signInWithCredential(credential).then((value) => {

        print("google account email"+googleAccount.user!.email.toString()),

          if(googleAccount.user?.email!=null){
          print(googleAccount.user!.email.toString()+"email google"),
          print(googleAccount.user!.displayName.toString()+"name"),
          print(googleAccount.user!.phoneNumber.toString()+"phone"),
          print(googleAccount.user!.photoURL.toString()+"phone"),
          //print(user!.metadata.toString()+"phone");
            Globalvireables.email=googleAccount.user!.email.toString(),
            Globalvireables.name=googleAccount.user!.displayName.toString(),

            Globalvireables.phone=googleAccount.user!.phoneNumber.toString(),
            Globalvireables.photoURL=googleAccount.user!.photoURL.toString(),
            Globalvireables.password="null",

          }else{
          //Navigator.pop(context)
      },
     //   print();

        print(googleAccount.user!.emailVerified.toString()+"falid"+

     googleAccount.user!.displayName.toString()+
      googleAccount.user!.email.toString()+
      googleAccount.user!.phoneNumber.toString()+
       ""+ googleAccount.user!.photoURL.toString()+ "null"


        ),
print ("nulluser"+googleAccount.user!.emailVerified.toString()),
        if(googleAccount.user!.emailVerified==true){
          Regester(googleAccount.user!.displayName.toString(),
              googleAccount.user!.email.toString(),
              googleAccount.user!.phoneNumber.toString()
              , "", googleAccount.user!.photoURL.toString(), "null"),
        }else
          {
            print ("nulluser"),
            showAlert(context,LanguageProvider.getTexts('problemlogging').toString())
          }
    });

    } on Exception catch (e) {
    print(e.toString()+"errrrrrrror");

      if(check()==false){
        showAlert(context,'لا يوجد اتصال انترنت');
      }else{
        print("prooble "+e.toString());
        showAlert(context,LanguageProvider.getTexts('problemlogging').toString());
      }
      print("errorb"+e.toString());
    }


    /*}else{

    //  displayMessage('لا يوجد اتصال انترنت');
      showAlert(context,"No Internet ...");
print("no internet ... ");
    }*/
  }
  Future<void> signOutFromGoogle() async{
    await _googleSignIn.signOut().then((value) => {
     _auth.signOut()

    });
  }
  void showAlert(BuildContext context,String text) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(text),
        ));
  }
  Regester(String name,String email,String mobile,String country,String profileimage,String password) async {
var img;
    Uri apiUrl = Uri.parse(Globalvireables.regesterapi);
Globalvireables.email=email;
//if(password!="null")
img=Globalvireables.imagen;

   final json = {
      "Name":name,
      "Email":email,
      "Mobile":mobile,
      "Country":country,
      "ProfileImage":img,
      "Password": password};

    print("json"+json.toString());
    print("name + email + pass + image"+password.toString());


    try {
      http.Response response=await http.post(apiUrl, body: json);
      var jsonResponse = jsonDecode(response.body);
      Navigator.pop(context);
      Users user = Users.fromJson(jsonResponse);

      print(response.toString() + " ussssersss");

        Globalvireables.email=email;
        Globalvireables.phone=mobile;
        Globalvireables.name=name;
        Globalvireables.password=password;
        Globalvireables.country=country;
      if(password=="null")
        Globalvireables.photoURL=profileimage;
      else
        Globalvireables.photoURL=user.ProfileImage;

      Globalvireables.ID=user.getid();

       // print("immmmge"+Globalvireables.photoURL);

      print(email);
      print("0"+password+"0");

      if (user.getid().toString()!="0") {

        print("id ==== regester  "+jsonResponse.toString());
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Home_Body()),);

      }
      else {
        print("id ==== login now  "+jsonResponse.toString());

        Login(email, "null", context);

      }
      /*if(email.length>5 && name != null)
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Home_Body()),);
*/

    }on TimeoutException catch (_) {
   //   displayMessage('out time');
    //  Navigator.pop(context);
print("outoftime");
        showAlert(context,LanguageProvider.getTexts('problemlogging').toString());

    }
  }
 /* void displayMessage(String message) {
    globalKey.currentState?.showSnackBar(SnackBar(content: Text(message)));
  }*/
  void displayMessage(String value) {
    _scaffoldKey.currentState!.showSnackBar(new SnackBar(content: new Text(value)));
  }

  /*Future signInFB() async {
    final FacebookLoginResult result = await fbLogin.logIn(["email"]);
    final String token = result.accessToken.token;
    final response = await http.get('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
    final profile = jsonDecode(response.body);
    print(profile);
    return profile;
  }*/


 /* void signInUsingFacebook() async {
    final FacebookLogin facebookLogin = FacebookLogin();
    final FacebookLoginResult facebookLoginResult =
    await facebookLogin.logIn(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.loggedIn:
        setState(() {
       //   showSpinner = true;
        });
        // TODO: Handle this case.
        FirebaseAuth.instance
            .signInWithCredential(
          FacebookAuthProvider.getCredential(
              accessToken: facebookLoginResult.accessToken.token),
        )
            .then((user) async {
          await _pushNotificationService.initialise();
          final graphResponse = await http.get(
              'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${facebookLoginResult.accessToken.token}');
          final profile = JSON.jsonDecode(graphResponse.body);

          final DocumentSnapshot doc =
          await usersRef.document(user.user.uid).get();
          //Storing the user data in the firestore database

          if (!doc.exists) {

            print ("succ");

           *//* final userDetails = await Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => CreateAccount()));
*//*
     *//*       _db.collection("users").document(user.user.uid).setData({
              "username": userDetails[0],
              "displayName": userDetails[1],
              "email": profile['email'],
              "photUrl": "N/A",
              "gender": userDetails[2],
              "timestamp": timestamp,
              "signin_method": 'Facebook',
              "location": userDetails[4],
              "uid": user.user.uid,
              "points": 0,
              "bio": userDetails[3],
            });*//*
          }
          setState(() {
           // showSpinner = false;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home_Body(),
            ),
          );
        });

        break;
      case FacebookLoginStatus.cancelledByUser:
      // TODO: Handle this case.
        setState(() {
        //  showSpinner = false;
        });

        break;
      case FacebookLoginStatus.error:
      // TODO: Handle this case.
        setState(() {
         // showSpinner = false;
        });

        break;
    }
  }*/

 /* Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final res = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final facebookAuthCredential =
    FacebookAuthProvider.credential(res.accessToken!.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }*/
/*  Future<String?> signInWithFacebook() async {
  try {
    print("try  ");
    final _instance = FacebookAuth.instance;
    final result = await _instance.login(permissions: ['email']);
    if (result.status == LoginStatus.success) {
      final OAuthCredential credential =
      FacebookAuthProvider.credential(result.accessToken!.token);
      final a = await _auth.signInWithCredential(credential);
      await _instance.getUserData().then((userData) async {
        print("auth==" + _auth.currentUser!.email.toString());
        await _auth.currentUser!.email; *//*updateEmail(userData['email']);*//*
      });
      *//* return null;
      } else if (result.status == LoginStatus.cancelled) {
        return 'Login cancelled';
      } else {
        return 'Error';
      }
      print("succ");
    } catch (e) {
      print("succ"+e.toString());

      return e.toString();*//*
    } else {
      print("error;;;;");
    }
  }catch (e) {
    print("succerroooor" + e.toString());
  }
  }*/



  Login(String emailorphone,String password,BuildContext context) async {
    try {
    Uri apiUrl = Uri.parse(Globalvireables.loginapi);
    showAlert(context,LanguageProvider.getTexts('Signing').toString());
   final json = {
     "Email": emailorphone,
     "Password": password,
   /* "Name": "null",
     "Mobile": "null",
     "Country":"null",
     "ProfileImage": "null"*/

   };

print("this password"+password);


    http.Response response=await http.post(apiUrl, body: json);

      response = await http.post(apiUrl, body: json).whenComplete(() {

//print("reeees"+response.body.toString());
        var jsonResponse = jsonDecode(response.body);

        Users user = Users.fromJson(jsonResponse);

        print(user.getid() + " ussssersss");

        Globalvireables.email=user.getEmail();
        Globalvireables.phone=user.getMobile();
        Globalvireables.name=user.getname();
        Globalvireables.password=user.getPassword();
        Globalvireables.country=user.getCountry();
        if(password!="null")
        Globalvireables.photoURL=user.getProfileImage();

        Globalvireables.ID=user.getid();
print("usel login ID ="+user.getid());

      /*  if (!jsonResponse.toString().contains("ID: 0")) {

          print("succ = "+jsonResponse.toString());
        //  Navigator.pop(context);




          Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) =>
                  Home_Body()));

        } else*/
        if(user.getid()!="0"){
       //   Navigator.pop(context);
print("loginyess");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home_Body()),);
        }
        else {
          Navigator.pop(context);
          displayMessage(LanguageProvider.getTexts('problemlogging').toString());
         /* displayMessage('out time');*/ print("error");
        }
        print("esaf = "+jsonResponse.toString());


      });
    }on TimeoutException catch (_) {
     // displayMessage('out time');
      displayMessage("out time");
      Navigator.pop(context);
     // displayMessage("Login information error");

    }on FormatException catch(_){
      Navigator.pop(context);
      displayMessage(LanguageProvider.getTexts('problemlogging').toString());

    }
  //  Navigator.pop(context);

  }

  Future<bool> _onWillPop() async {
/*
    // This dialog will exit your app on saying yes
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('leave'),
        content: new Text('leave confirm'),
        actions: <Widget>[

          new TextButton(
            onPressed: () {Navigator.of(context).pop(false);},
            style: TextButton.styleFrom(
              primary: Colors.white10,
            ),
            child: Text('cancel'),
          ),
          new FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('cancel'),
            ),
          new TextButton(
            onPressed: () {return;},
            style: TextButton.styleFrom(
              primary: Colors.white10,
            ),
            child: Text('Yes'),
          ),
          new FlatButton(
              // onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: '', ))),

              onPressed: () { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login_Body()),);} ,
              child: new Text('Yes'),

            ),
        ],
      ),
    )) ??*/
    return false;
  }
}