import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cards/LanguageProvider.dart';
import 'package:http/http.dart' as http;
import 'package:cards/GlobalVaribales.dart';
import 'package:cards/color/HexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'Home/Home_Body.dart';

class FileDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogoutOverlayState();
}

class LogoutOverlayState extends State<FileDialog>
    with SingleTickerProviderStateMixin {

  Image? imgs1 ;
  Image? imgs2 ;
  Image? imgs3 ;
  String img1="";


  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
   var imgFile;
  late AnimationController controller;
  late Animation<double> scaleAnimation;
   Image? imgs ;
String img64="0";
   final picker = ImagePicker();
  TextEditingController namecontroler = TextEditingController();
  late http.Response response;
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
              height: 500.0,
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

                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Center(
                        child: InkWell(
                          onTap: () async {

                            _showPicker(context,1);
                   /*          imgFile = await picker.getImage(
                                source: ImageSource.gallery

                            );
                             File selected = File(imgFile.path);
                            setState((){
                              // /100dp  imgs.add(Image.file(imgFile));
                              imgs=Image.file(selected);
                              final bytes =
                              selected.readAsBytesSync();
                              img64 = base64Encode(bytes);
                            })*/;

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
                            hintText:LanguageProvider.getTexts('name').toString(),

                          ),
                        )
                    )

,
                    Container(
                      margin: EdgeInsets.only(top: 120),
                      height: 55,
                      padding: EdgeInsets.only(right: 2,left: 2),
                      child: ElevatedButton(
                        child: Text(                              LanguageProvider.getTexts('add').toString(),

                        ),

                        onPressed: () {


if(namecontroler.text.length>2) {
  SaveFile(namecontroler.text, img1, context);
}else{
  displayMessage("Add name to cards file");
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
    if(imgs1 !=null)
      return SingleChildScrollView(
        child: Container(
            width: 200,
            height: 150,
          child:imgs1
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



  SaveFile (String name,String path,BuildContext context) async {


    print("(H   "+path+"     H)");

    try {
      Uri apiUrl = Uri.parse(Globalvireables.cardfiles);
      showAlert(context,LanguageProvider.getTexts('saving').toString());
      final json;
      if(path.length>5)
      json= {
        "CustomerId":Globalvireables.ID,
        "ProfileName": name,
        "ProfileImage": path,
      };
      else
        json= {
          "CustomerId":Globalvireables.ID,
          "ProfileName": name,
          "ProfileImage": Globalvireables.uploadimage,

        };
print ("file save");



   http.Response response=await http.post(apiUrl, body: json);

print(json.toString());
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
      //  print("esaf = "+jsonResponse.toString());



/*      response = await http.post(apiUrl, body: json).whenComplete(() {

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
  // Home_Body.RefreshPage();
    Navigator.pop(context);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
            (context) =>
            Home_Body()
        )
    );

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

   _showPicker(context,var x) {
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

                         imgFile = await picker.getImage(
                             source: ImageSource.gallery

                         );
                         File selected = await FlutterNativeImage.compressImage(imgFile.path,
                           quality: 50,);
                        // File selected = File(imgFile.path);

                         setState(() {
                           if(x==1){
                             imgs1=Image.file(selected);
                             img1 = base64Encode(selected.readAsBytesSync());

                           }



                         });
                         //_imgFromGallery();
                       }),
                   new ListTile(
                     leading: new Icon(Icons.photo_camera),
                     title: new Text('Camera'),
                     onTap: () async {
                       Navigator.of(context).pop();

                       imgFile = await picker.getImage(
                           source: ImageSource.camera

                       );
                     //  File selected = File(imgFile.path);
                       File selected = await FlutterNativeImage.compressImage(imgFile.path,
                         quality: 50,);
                       setState(() {

                         if(x==1){
                           imgs1=Image.file(selected);
                           img1 = base64Encode(selected.readAsBytesSync());

                         }
                         else if(x==2){
                           imgs2=Image.file(selected);
                           img1 = base64Encode(selected.readAsBytesSync());
                         }
                         else{
                           imgs3=Image.file(selected);
                           img1 = base64Encode(selected.readAsBytesSync());

                         }

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