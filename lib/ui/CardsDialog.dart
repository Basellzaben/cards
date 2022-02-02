import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cards/DataBase/SQLHelper.dart';
import 'package:cards/LanguageProvider.dart';
import 'package:http/http.dart' as http;
import 'package:cards/GlobalVaribales.dart';
//nbnbnbnmbnn
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
import 'package:image_cropper/image_cropper.dart';

import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

class CardsDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogoutOverlayStatecard();
}

class LogoutOverlayStatecard extends State<CardsDialog>
    with SingleTickerProviderStateMixin {
   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late http.Response response;
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  Image? imgs1 ;
  Image? imgs2 ;
  Image? imgs3 ;  final picker = ImagePicker();
   List<Map<String, dynamic>> _journals = [];

   void _refreshkeys() async {
     var data = await SQLHelper.getKeys();
     /*  setState(() {

    //  _isLoading = false;
    });*/

     setState(() {
       _journals = data;
     });

   }
   String img164="";
  String img264="";
  String img364="";
  TextEditingController namecontroler = TextEditingController();
  TextEditingController ExpiryDatecontroler = TextEditingController();
  TextEditingController typecontroler = TextEditingController();
  TextEditingController cardnocontroler = TextEditingController();
   Future<void> _addItem(String profileid,String title, String? path1, String? path2, String? path3
       ,String? cardno,String? expirydate,String? cardtype) async {
       await SQLHelper.createCard(profileid, title,  path1,  path2,  path3
           , cardno, expirydate, cardtype);
   //  _refreshJournals();
   }
   Future<void> _addKey(String title) async {
     if(title.length>0)
     await SQLHelper.createKey(title);
     //  _refreshJournals();
   }
  @override
  void initState() {
    _refreshkeys();
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
  child: Text(LanguageProvider.getTexts('addfirstcard').toString(),style: TextStyle(
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
                        _showPicker(context,1);


                          },
                          child: image(imgs1),


                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Center(
                        child: InkWell(
                          onTap: () async {


                            setState((){

                              _showPicker(context,2);

                            });

                          },
                          child: image(imgs2),

                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Center(
                        child: InkWell(
                          onTap: () async {





                         setState((){

                           _showPicker(context,3);

                            });

                          },
                          child: image(imgs3),

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
                  hintText: LanguageProvider.getTexts('ExpiryDate').toString(),

                ),
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
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




                    Container(

                        margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                        //  alignment: Alignment.center,
                        child: TextField(
                      //    keyboardType: TextInputType.numberWithOptions(decimal: true),
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
                    ),
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

,
     /*     SingleChildScrollView(
            scrollDirection: Axis.horizontal,

            child: Row(
              children: [
                new InkWell(
                  onTap: () async {
                    setState(() {
                      typecontroler.text="SHOP";
                    });  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Text("#SHOP",style: TextStyle(fontWeight: FontWeight.w800,color: HexColor(Globalvireables.bluedark)),),

                    margin: EdgeInsets.all(7),

                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(
                                MediaQuery.of(context).size.width, 100.0)),
                        color: HexColor(Globalvireables.white3)),
                  ),
                ),
                new InkWell(
                  onTap: () async {
                    setState(() {
                      typecontroler.text="WORK";
                    });  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Text("#WORK",style: TextStyle(fontWeight: FontWeight.w800,color: HexColor(Globalvireables.bluedark)),),

                    margin: EdgeInsets.all(7),

                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(
                                MediaQuery.of(context).size.width, 100.0)),
                        color: HexColor(Globalvireables.white3)),
                  ),
                ),
                new InkWell(
                  onTap: () async {
                    setState(() {
                      typecontroler.text="STUDY";
                    });  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Text("#STUDY",style: TextStyle(fontWeight: FontWeight.w800,color: HexColor(Globalvireables.bluedark)),),

                    margin: EdgeInsets.all(7),

                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(
                                MediaQuery.of(context).size.width, 100.0)),
                        color: HexColor(Globalvireables.white3)),
                  ),
                ),
                new InkWell(
                  onTap: () async {
                    setState(() {
                      typecontroler.text="BANK";
                    });  },
                  child: Container(
padding: EdgeInsets.all(5),
                    child: Text("#BANK",style: TextStyle(fontWeight: FontWeight.w800,color: HexColor(Globalvireables.bluedark)),),

                    margin: EdgeInsets.all(10),

                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(
                             Radius.elliptical(
                                  MediaQuery.of(context).size.width, 100.0)),
                          color: HexColor(Globalvireables.white3)),
                  ),
                ),
                new InkWell(
                  onTap: () async {
                   setState(() {
                     typecontroler.text="PERSONAL";
                   });  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Text("#PERSONAL",style: TextStyle(fontWeight: FontWeight.w800,color: HexColor(Globalvireables.bluedark)),),

                    margin: EdgeInsets.all(10),

                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(
                                MediaQuery.of(context).size.width, 100.0)),
                        color: HexColor(Globalvireables.white3)),
                  ),
                ),
              ],
            ),
          )
*/
                    if(_journals.length>0)
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _journals.length,
                        itemBuilder: (context, index)
                        => Container(

                          child: new InkWell(
                              onTap: () async {
                                setState(() {
                                  typecontroler.text=_journals[index]['title'].toString();
                                });  },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Center(child: Text(_journals[index]['title'].toString(),style: TextStyle(fontWeight: FontWeight.w800,color: HexColor(Globalvireables.bluedark)),)),

                                margin: EdgeInsets.all(7),

                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(
                                            MediaQuery.of(context).size.width, 200.0)),
                                    color: HexColor(Globalvireables.white3)),
                              ),
                            ),
                        ),

                        ),
                    )

                 ,
        Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 55,
                      padding: EdgeInsets.only(right: 2,left: 2),
                      child: ElevatedButton(
                        child: Text(LanguageProvider.getTexts('add').toString()),

                        onPressed: () {


if(namecontroler.text.length>2) {
  print ("images this="+ img164+"  ---  "+ img164);
  _addItem(Globalvireables.fileindex,namecontroler.text,  img164, img264, img364,cardnocontroler.text,ExpiryDatecontroler.text,typecontroler.text);

  _addKey(typecontroler.text);
  SaveFile(namecontroler.text,  img164, img264, img364, context);
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
                        File? selected = await ImageCropper.cropImage(
                            sourcePath: imgFile.path,
                            compressQuality: 50,
                            aspectRatioPresets: [
                              CropAspectRatioPreset.square,
                              CropAspectRatioPreset.ratio3x2,
                              CropAspectRatioPreset.original,
                              CropAspectRatioPreset.ratio4x3,
                              CropAspectRatioPreset.ratio16x9
                            ],
                            androidUiSettings: AndroidUiSettings(
                                toolbarTitle: 'Cropper',
                                toolbarColor: Colors.deepOrange,
                                toolbarWidgetColor: Colors.white,
                                initAspectRatio: CropAspectRatioPreset.original,
                                lockAspectRatio: false),
                            iosUiSettings: IOSUiSettings(
                              minimumAspectRatio: 1.0,
                            )
                        );
                        setState(() {
if(x==1){
  imgs1=Image.file(selected!);
 // img164 = base64Encode(selected.readAsBytesSync());
  img164 =selected.path;
}
else if(x==2){
  imgs2=Image.file(selected!);
  img264 =selected.path;
}
else{
  imgs3=Image.file(selected!);
  img364 =selected.path;
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
                      File? selected = await ImageCropper.cropImage(
                          sourcePath: imgFile.path,
                          compressQuality: 50,
                          aspectRatioPresets: [
                            CropAspectRatioPreset.square,
                            CropAspectRatioPreset.ratio3x2,
                            CropAspectRatioPreset.original,
                            CropAspectRatioPreset.ratio4x3,
                            CropAspectRatioPreset.ratio16x9
                          ],
                          androidUiSettings: AndroidUiSettings(
                              toolbarTitle: 'Cropper',
                              toolbarColor: Colors.deepOrange,
                              toolbarWidgetColor: Colors.white,
                              initAspectRatio: CropAspectRatioPreset.original,
                              lockAspectRatio: false),
                          iosUiSettings: IOSUiSettings(
                            minimumAspectRatio: 1.0,
                          )
                      );
                      setState(() {

                        if(x==1){
                          imgs1=Image.file(selected!);
                          // img164 = base64Encode(selected.readAsBytesSync());
                          img164 =selected.path;

                        }
                        else if(x==2){
                          imgs2=Image.file(selected!);
                          img264 =selected.path;

//  img264 = base64Encode(selected.readAsBytesSync());
                        }
                        else{
                          imgs3=Image.file(selected!);
                          img364 =selected.path;

                          // img364 = base64Encode(selected.readAsBytesSync());

                        }
                        _createFileFromString(base64Encode(selected.readAsBytesSync()),x);

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

   Future<String> _createFileFromString(String base,int x) async {
     final encodedStr = base;
     Uint8List bytes = base64.decode(encodedStr);
     String dir = (await getApplicationDocumentsDirectory()).path;
     File file = File(
         "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".jpg");
     await file.writeAsBytes(bytes).then((value) => {
       setState(() {
         Globalvireables.imagen=file.path;
         //img1=file.path;


         if(x==1){
           img164 =file.path;

         }
         else if(x==2){
           img264 =file.path;

//  img264 = base64Encode(selected.readAsBytesSync());
         }
         else{
           img364 =file.path;

           // img364 = base64Encode(selected.readAsBytesSync());

         }
         print ("gg");
       })
     });


     return file.path;
   }
}