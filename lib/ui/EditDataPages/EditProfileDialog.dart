import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cards/LanguageProvider.dart';
import 'package:cards/ui/vervicationUpdatePhone/vervication_body2.dart';
import 'package:cards/ui/vervicationpage/vervication_body.dart';
import 'package:http/http.dart' as http;
import 'package:cards/GlobalVaribales.dart';
import 'package:cards/color/HexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter_native_image/flutter_native_image.dart';

import 'dart:io' as io;
class EditProfileDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogoutOverlayStatecard();
}

class LogoutOverlayStatecard extends State<EditProfileDialog>
    with SingleTickerProviderStateMixin {
   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late http.Response response;
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  Image? imgs ;
   final picker = ImagePicker();

   var imgFile;
  String img64="0";
  TextEditingController namecontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController mobilecontroler = TextEditingController();
  TextEditingController countrycontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();




  @override
  void initState() {
    super.initState();

    namecontroler.text=Globalvireables.name;
    emailcontroler.text=Globalvireables.email;
    mobilecontroler.text=Globalvireables.phone;
    countrycontroler.text=Globalvireables.country;
    passwordcontroler.text=Globalvireables.password;


    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        body: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            //  margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(15.0),
              height: MediaQuery.of(context).size.height,
              width: 500,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0))),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    if(Globalvireables.languageCode=="en")
                      Center(
                          child: Text("Edit profile data",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              color: HexColor(Globalvireables.basecolor)
                          ),))else
                      Center(
                          child: Text("تعديل الملف الشخصي",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              color: HexColor(Globalvireables.basecolor)
                          ),)),

                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Center(
                        child: InkWell(
                          onTap: () async {


                           /*  imgFile = await picker.getImage(
                                source: ImageSource.gallery

                            );*/
                             /*File selected = await FlutterNativeImage.compressImage(imgFile.path,
                               quality: 50,);*/

                             setState((){
                               _showPicker(context);
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
                    )

                    ,
                    Container(

                        margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                        //  alignment: Alignment.center,
                        child: TextField(

                          controller: namecontroler,

                          // enabled: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_rounded),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:HexColor(Globalvireables.basecolor), width: 0.0),
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 0.0),
                                borderRadius: BorderRadius.circular(10.0)

                            ),


                            contentPadding: EdgeInsets.only(
                                top: 18, bottom: 18, right: 20, left: 20),
                            fillColor: Colors.white,
                            filled: true,
                            hintText:Globalvireables.name,

                          ),
                        )
                    ),



                    /*      child: TextField(

                          controller: ExpiryDatecontroler,
                          // enabled: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.drive_file_rename_outline),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:HexColor(Globalvireables.basecolor), width: 0.0),
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 0.0),
                                borderRadius: BorderRadius.circular(10.0)

                            ),


                            contentPadding: EdgeInsets.only(
                                top: 18, bottom: 18, right: 20, left: 20),
                            fillColor: Colors.white,
                            filled: true,
                            hintText:"ExpiryDate",

                          ),
                        )*/
if(Globalvireables.email!=null)
  if(Globalvireables.email.length>0)
                    Container(

                        margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                        //  alignment: Alignment.center,
                        child: TextField(

                          controller: emailcontroler,
                          // enabled: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:HexColor(Globalvireables.basecolor), width: 0.0),
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 0.0),
                                borderRadius: BorderRadius.circular(10.0)

                            ),


                            contentPadding: EdgeInsets.only(
                                top: 18, bottom: 18, right: 20, left: 20),
                            fillColor: Colors.white,
                            filled: true,
                            hintText:Globalvireables.email,

                          ),
                        )
                    )

                    ,Container(

                        margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                        //  alignment: Alignment.center,
                        child: TextField(

                          controller: mobilecontroler,
                          // enabled: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                color:HexColor(Globalvireables.basecolor), width: 0.0),
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                color: Colors.black, width: 0.0),
                                borderRadius: BorderRadius.circular(10.0)
                            ),


                            contentPadding: EdgeInsets.only(
                                top: 18, bottom: 18, right: 20, left: 20),
                            fillColor: Colors.white,
                            filled: true,
                            hintText:Globalvireables.phone,

                          ),
                        )
                    ),


              Container(

          margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
            //  alignment: Alignment.center,
            child: TextField(

              controller: passwordcontroler,
              // enabled: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password_outlined),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:HexColor(Globalvireables.basecolor), width: 0.0),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black, width: 0.0),
                    borderRadius: BorderRadius.circular(10.0)

                ),


                contentPadding: EdgeInsets.only(
                    top: 18, bottom: 18, right: 20, left: 20),
                fillColor: Colors.white,
                filled: true,
                hintText:Globalvireables.password,

              ),
            )
        ),

              Container(
          margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
            //  alignment: Alignment.center,
            child: TextField(

              controller: countrycontroler,
              // enabled: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_balance_rounded),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                    color:HexColor(Globalvireables.basecolor), width: 0.0),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                    color: Colors.black, width: 0.0),
                    borderRadius: BorderRadius.circular(10.0)

                ),


                contentPadding: EdgeInsets.only(
                top: 18, bottom: 18, right: 20, left: 20),
                fillColor: Colors.white,
                filled: true,
                hintText:Globalvireables.country,

              ),
            )
        ),
                    Container(
                      margin: EdgeInsets.only(top: 120),
                      height: 55,
                      padding: EdgeInsets.only(right: 2,left: 2),
                      child: ElevatedButton(
                      child: Text(LanguageProvider.getTexts('save').toString()),

                        onPressed: () {
                          if(namecontroler.text.length>2 && passwordcontroler.text!=null) {
                            print(Globalvireables.phone);
                            print(mobilecontroler.text.toString());

                            if(mobilecontroler.text.length>0 && (mobilecontroler.text.toString().contains(Globalvireables.phone)))
                              {
                                Globalvireables.regorupdate="1";
                                Globalvireables.name=namecontroler.text;
                               /* if(emailcontroler.text!=null)
                                  if(emailcontroler.text.length>5)*/
                                if(img64!=null)
                                  if(img64.length>10)
                                Globalvireables.imagen=img64;
                                Globalvireables.email=emailcontroler.text;
                                Globalvireables.phone=mobilecontroler.text;
                                Globalvireables.country=countrycontroler.text;
                                Globalvireables.phone=mobilecontroler.text;
                                Globalvireables.password=passwordcontroler.text;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => verviaction_body2()),
                                );
                              }
                              else if(passwordcontroler.text.length>5)
                            Editprofile(namecontroler.text, emailcontroler.text, mobilecontroler.text,countrycontroler.text,passwordcontroler.text,context);
                          }else{
                            displayMessage("All information must be filled out");
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
                  ],
                ),
              )),
        ),
      ),
    );
  }
  Widget image(){
    if(imgs !=null)
      return SingleChildScrollView(
        child: Container(
            width: 200,
            height: 150,
            child:imgs
        ),
      );
    else
      return Container(

        //child: Image.asset('assets/emptyfile.png'),
        child: Icon(
          Icons.image,
          size: 100.0,
          color: HexColor(Globalvireables.basecolor),
        ),
      );
  }



  Editprofile(String name,String email,String mobile,String country,String password,BuildContext context) async {
    try {

      Uri apiUrl = Uri.parse(Globalvireables.regesterapi+"/"+Globalvireables.ID);
      showAlert(context,"Editing ...");

      print (Globalvireables.imagen+"immmmmgh");

      var json;
       json = {
        "ID":Globalvireables.ID,
        "Name": name,
        "Email": email,
        "Mobile": mobile,
        "Country":country,
        "ProfileImage": Globalvireables.imagen,
        "Password": password};
if(email==null)
  json = {
    "ID":Globalvireables.ID,
    "Name": name,
    "Mobile": mobile,
    "Country":country,
    "ProfileImage": Globalvireables.imagen,
    "Password": password};
      print ("card save");


      Globalvireables.name=namecontroler.text;
      Globalvireables.email=emailcontroler.text;
      Globalvireables.phone=mobilecontroler.text;
      Globalvireables.country=countrycontroler.text;
      Globalvireables.phone=mobilecontroler.text;
      Globalvireables.password=passwordcontroler.text;
      Globalvireables.regorupdate="1";

      //await http.post(apiUrl,body: jsone);

      http.Response response=await http.put(apiUrl, body: json);

      var jsonResponse = jsonDecode(response.body);


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
  void showAlert(BuildContext context,String text) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(text),
        ));
  }
  void displayMessage(String value) {
    _scaffoldKey.currentState!.showSnackBar(new SnackBar(content: new Text(value)));
  }

   _showPicker(context) {
     var imgFile;
     var bytes;
     showModalBottomSheet(
         context: context,
         builder: (BuildContext bc) {
           return SafeArea(
             child: Container(
               child: new Wrap(
                 children: <Widget>[
                   new ListTile(
                       leading: new Icon(Icons.photo_library),
                       title: new Text('Photo Library'),
                       onTap: () async {
                         Navigator.of(context).pop();
                         imgFile = await picker.pickImage(
                             source: ImageSource.gallery
                         );



//                        File selected = File(imgFile.path);
                         File selected = await FlutterNativeImage.compressImage(imgFile.path,
                           quality: 50,);


                         setState(() {
                           imgs=Image.file(selected);
                           img64 =  base64Encode(selected.readAsBytesSync());
                           print("  end2");
                         });
                         //_imgFromGallery();
                       }),
                   new ListTile(
                     leading: new Icon(Icons.photo_camera),
                     title: new Text('Camera'),
                     onTap: () async {
                       Navigator.of(context).pop();

                       imgFile = await picker.pickImage(
                           source: ImageSource.camera

                       );
                       // File selected = File(imgFile.path);

                       File selected = await FlutterNativeImage.compressImage(imgFile.path,
                         quality: 50,);

                       setState(() {

                         imgs=Image.file(selected);
                         img64 =  base64Encode(selected.readAsBytesSync());
                         print("  end2");

                       });
                       //_imgFromCamera();
                     },
                   ),
                 ],
               ),
             ),
           );
         }
     );



   }
}