import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cards/GlobalVaribales.dart';
import 'package:cards/color/HexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';

class FileDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogoutOverlayState();
}

class LogoutOverlayState extends State<FileDialog>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late AnimationController controller;
  late Animation<double> scaleAnimation;
   Image? imgs ;
String img64="0";
  TextEditingController namecontroler = TextEditingController();

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
  child: Text("Add card file",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    color: HexColor(Globalvireables.basecolor)
                ),)),

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
                            hintText:"Name",

                          ),
                        )
                    )

,
                    Container(
                      margin: EdgeInsets.only(top: 120),
                      height: 55,
                      padding: EdgeInsets.only(right: 2,left: 2),
                      child: ElevatedButton(
                        child: Text('Add'),

                        onPressed: () {


if(namecontroler.text.length>2) {
  SaveFile(namecontroler.text, img64, context);
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



  SaveFile (String name,String path,BuildContext context) async {
    try {
      Uri apiUrl = Uri.parse(Globalvireables.cardfiles);
      showAlert(context,"Saving ...");
      final json = {
        "CustomerId":Globalvireables.ID,
        "ProfileName": name,
        "ProfileImage": path,
      };




      http.Response response=await http.post(apiUrl, body: json);

      response = await http.post(apiUrl, body: json).whenComplete(() {


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
        print("esaf = "+jsonResponse.toString());


      });
    }on TimeoutException catch (_) {
      // displayMessage('out time');
      displayMessage("out time");
      Navigator.pop(context);
      // displayMessage("Login information error");

    }on FormatException catch(_){

      Navigator.pop(context);
      displayMessage("Login information error");


    }
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