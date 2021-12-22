import 'dart:async';
import 'dart:convert';
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
import 'dart:io' as io;
class EditProfileDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogoutOverlayStatecard();
}

class LogoutOverlayStatecard extends State<EditProfileDialog>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late http.Response response;
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  Image? imgs ;
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

                    Center(

                        child: Container(
                          margin: EdgeInsets.only(top: 40),
                          child: Text("Edit Profile Data",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              color: HexColor(Globalvireables.basecolor)
                          ),),
                        )),

                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Center(
                        child: InkWell(
                          onTap: () async {


                             imgFile = await ImagePicker.pickImage(
                                source: ImageSource.gallery

                            );
                            setState((){
                              // /100dp  imgs.add(Image.file(imgFile));
                              imgs=Image.file(imgFile);
                              final bytes =
                              imgFile.readAsBytesSync();
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
                    )

                    ,
                    Container(

                        margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                        //  alignment: Alignment.center,
                        child: TextField(

                          controller: namecontroler,

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

                    Container(

                        margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                        //  alignment: Alignment.center,
                        child: TextField(

                          controller: emailcontroler,
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
                hintText:Globalvireables.country,

              ),
            )
        ),
                    Container(
                      margin: EdgeInsets.only(top: 120),
                      height: 55,
                      padding: EdgeInsets.only(right: 2,left: 2),
                      child: ElevatedButton(
                      child: Text('Add'),

                        onPressed: () {
                          if(namecontroler.text.length>2) {
                            if(mobilecontroler.text.length>1)
                              {
                                Globalvireables.name=namecontroler.text;
                                Globalvireables.email=emailcontroler.text;
                                Globalvireables.phone=mobilecontroler.text;
                                Globalvireables.country=countrycontroler.text;
                                Globalvireables.phone=mobilecontroler.text;
                                Globalvireables.password=passwordcontroler.text;
                                Globalvireables.regorupdate="1";
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => verviaction_body()),
                                );
                              }
                              else
                            Editprofile(namecontroler.text, emailcontroler.text, mobilecontroler.text,countrycontroler.text,passwordcontroler.text,context);
                          }else{
                            displayMessage("Add name to cards");
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

      final json = {
        "ID":Globalvireables.ID,
        "Name": name,
        "Email": email,
        "Mobile": mobile,
        "Country":country,
        "ProfileImage": Globalvireables.imagen,
        "Password": password};

      print ("card save");


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

}