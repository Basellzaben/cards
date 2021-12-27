import 'dart:async';
import 'dart:convert';
import 'package:cards/LanguageProvider.dart';
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
class CardsDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogoutOverlayStatecard();
}

class LogoutOverlayStatecard extends State<CardsDialog>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late http.Response response;
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  Image? imgs1 ;
  Image? imgs2 ;
  Image? imgs3 ;
  String img164="";
  String img264="";
  String img364="";
  TextEditingController namecontroler = TextEditingController();
  TextEditingController ExpiryDatecontroler = TextEditingController();
  TextEditingController typecontroler = TextEditingController();
  TextEditingController cardnocontroler = TextEditingController();

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
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(15.0),
              height: MediaQuery.of(context).size.height,
width: 500,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

Center(
  child: Text(LanguageProvider.getTexts('addcardfile').toString(),style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    color: HexColor(Globalvireables.basecolor)
                ),)),

              SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: [

                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Center(
                        child: InkWell(
                          onTap: () async {


                            var imgFile = await ImagePicker.pickImage(
                                source: ImageSource.gallery
                            );
                            setState((){
                              // /100dp  imgs.add(Image.file(imgFile));
                              imgs1=Image.file(imgFile);
                              final bytes =
                              imgFile.readAsBytesSync();
                              img164 = base64Encode(bytes);
                            });

                          },
                          child: image(imgs1),

                          /*ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('assets/emptycards.png',
                                width: 110.0, height: 110.0),
                          ),*/
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Center(
                        child: InkWell(
                          onTap: () async {


                            var imgFile = await ImagePicker.pickImage(
                                source: ImageSource.gallery

                            );
                            setState((){
                              // /100dp  imgs.add(Image.file(imgFile));
                              imgs2=Image.file(imgFile);
                              final bytes =
                              imgFile.readAsBytesSync();
                              img264 = base64Encode(bytes);
                            });

                          },
                          child: image(imgs2),

                          /*ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('assets/emptycards.png',
                                width: 110.0, height: 110.0),
                          ),*/
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Center(
                        child: InkWell(
                          onTap: () async {


                            var imgFile = await ImagePicker.pickImage(
                                source: ImageSource.gallery

                            );
                            setState((){
                              // /100dp  imgs.add(Image.file(imgFile));
                              imgs3=Image.file(imgFile);
                              final bytes =
                              imgFile.readAsBytesSync();
                              img364 = base64Encode(bytes);
                            });

                          },
                          child: image(imgs3),

                          /*ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('assets/emptycards.png',
                                width: 110.0, height: 110.0),
                          ),*/
                        ),
                      ),
                    )

                  ])),

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
                            hintText:LanguageProvider.getTexts('name').toString(),

                          ),
                        )
                    )


                    ,Container(

                        margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                        //  alignment: Alignment.center,

              child: TextFormField(
                readOnly: true,
                controller: ExpiryDatecontroler,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.timer),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                       color: HexColor(Globalvireables.basecolor) , width: 0.0),
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
                  hintText: LanguageProvider.getTexts('Expirydate').toString()

                ),
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2040),
                  ).then((selectedDate) {
                    if (selectedDate != null) {

                      ExpiryDatecontroler.text =
                          DateFormat('yyyy-MM-dd').format(selectedDate);
                    }
                  });

                //  calculatelongtimee();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter date.';
                  }
                  return null;
                },
              )),


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

                          controller: typecontroler,
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
                            hintText:LanguageProvider.getTexts('cardtype').toString(),

                          ),
                        )
                    )

                    ,Container(

                        margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                        //  alignment: Alignment.center,
                        child: TextField(

                          controller: cardnocontroler,
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
                            hintText:LanguageProvider.getTexts('cardno').toString(),


                          ),
                        )
                    )


                    ,
                    Container(
                      margin: EdgeInsets.only(top: 120),
                      height: 55,
                      padding: EdgeInsets.only(right: 2,left: 2),
                      child: ElevatedButton(
                        child: Text(LanguageProvider.getTexts('add').toString()),

                        onPressed: () {


if(namecontroler.text.length>2) {
  SaveFile(namecontroler.text, img164,img264,img364, context);
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
  Widget image(Image? img){
    if(img !=null)
      return SingleChildScrollView(
        child: Container(
            width: 200,
            height: 150,
          child:img
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



  SaveFile (String name,String path1,String path2,String path3,BuildContext context) async {
    try {

      Uri apiUrl = Uri.parse(Globalvireables.addCards);
      showAlert(context,LanguageProvider.getTexts('saving').toString());
      final json = {
        "ProfileId": Globalvireables.fileindex ,
        "CardName": name,
        "CardImage1": path1,
        "CardImage2": path2,
        "CardImage3": path3,
        "CardNo": cardnocontroler.text,
        "Barcode": "null",
        "ExpiryDate": ExpiryDatecontroler.text.replaceAll("-", "/"),
        "CardType": typecontroler.text,
                     };
         print ("card save");


      //await http.post(apiUrl,body: jsone);

      http.Response response=await http.post(apiUrl, body: json);

      var jsonResponse = jsonDecode(response.body);

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