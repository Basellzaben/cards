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
class EditCardDialog extends StatefulWidget {
  @override
  final String name;
  final String no;
  final String date;
  final String type;
   String img1;
   String img2;
   String img3;

  EditCardDialog(this.name,this.no,this.date,this.type,this.img1,this.img2,this.img3);

  State<StatefulWidget> createState() => LogoutOverlayStatecard(
    name,
    no,
    date,
    type,
    img1,img2,img3
  );

}

class LogoutOverlayStatecard extends State<EditCardDialog>
    with SingleTickerProviderStateMixin {

  final String name;
  final String no;
  final String date;
  final String type;
   String img1;
   String img2;
   String img3;
  LogoutOverlayStatecard( this.name, this.no, this.date, this.type,this.img1,this.img2,this.img3){
  }

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

    namecontroler.text=name;
    ExpiryDatecontroler.text=date;
    typecontroler.text=type;
    cardnocontroler.text=no;

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
                                      // var imgFile= _showPicker(context);

                                      /* = await ImagePicker.pickImage(
                                source: ImageSource.gallery

                            );*/_showPicker(context,1);
                                      //    img164 = base64Encode(Globalvireables.img164);

                                      setState((){


                                        // /100dp  imgs.add(Image.file(imgFile));
                                        /*  imgs3=Image.file(imgFile);
                              final bytes =
                              imgFile.readAsBytesSync();*/
                                      });
                                      /*         var imgFile = await ImagePicker.pickImage(
                                source: ImageSource.gallery
                            );
                            setState((){
                              // /100dp  imgs.add(Image.file(imgFile));
                              imgs1=Image.file(imgFile);
                              final bytes =
                              imgFile.readAsBytesSync();
                              img164 = base64Encode(bytes);
                            });
*/
                                    },
                                    child: image(imgs1,img1),

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

                                      /* = await ImagePicker.pickImage(
                                source: ImageSource.gallery

                            );*/
                                      setState((){
                                        //  var imgFile=  _showPicker(context);

                                        // /100dp  imgs.add(Image.file(imgFile));
                                        /*   imgs3=Image.file(imgFile);
                              final bytes =
                              imgFile.readAsBytesSync();*/
                                        _showPicker(context,2);
                                        // img264 = base64Encode();
                                      });
                                      /*      var imgFile = await ImagePicker.pickImage(
                                source: ImageSource.gallery
                            );
                            setState((){
                              // /100dp  imgs.add(Image.file(imgFile));
                              imgs2=Image.file(imgFile);
                              final bytes =
                              imgFile.readAsBytesSync();
                              img264 = base64Encode(bytes);
                            });
*/
                                    },
                                    child: image(imgs2,img2),

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




                                      /* = await ImagePicker.pickImage(
                                source: ImageSource.gallery

                            );*/
                                      setState((){
                                        /*  var imgFile=  _showPicker(context);
                              // /100dp  imgs.add(Image.file(imgFile));
                              imgs3=Image.file(imgFile);
                              final bytes =
                              imgFile.readAsBytesSync();*/
                                        _showPicker(context,3);
                                        // img364 = base64Encode();
                                      });
                                    },
                                    child: image(imgs3,img3),

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
                            hintText: LanguageProvider.getTexts('ExpiryDate').toString(),

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
                    SingleChildScrollView(
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
                            EditFile(namecontroler.text,  img1, img2, img3, context);
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
  Widget image(Image? img,String? imgg){
    if(img !=null)
      return SingleChildScrollView(
        child: Container(
            width: 200,
            height: 150,
            child:img
        ),
      );
    else if(imgg!=null && imgg.length>5)
      return Container(

        //child: Image.asset('assets/emptyfile.png'),
        child: Image.network('http://cardskeeper-001-site1.ftempurl.com'+imgg,width: 200,height: 150,)
      );
      else return Container(

        //child: Image.asset('assets/emptyfile.png'),
        child: Icon(
          Icons.image,
          size: 100.0,
          color: HexColor(Globalvireables.basecolor),
        ),
      );

  }



  EditFile (String name,String path1,String path2,String path3,BuildContext context) async {
    if(path1==null)
      path1="";
    if(path2==null)
      path2="";
    if(path3==null)
      path3="";
    try {

      Uri apiUrl = Uri.parse(Globalvireables.addCards+"/"+Globalvireables.cardindex);
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
        "Id":Globalvireables.cardindex
      };
      print ("card save"+apiUrl.toString());


      //await http.post(apiUrl,body: jsone);

      http.Response response=await http.put(apiUrl, body: json);

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

                        imgFile = await ImagePicker.pickImage(
                            source: ImageSource.gallery

                        );
                        setState(() {
                          if(x==1){
                            imgs1=Image.file(imgFile);
                            img1 = base64Encode(imgFile.readAsBytesSync());

                          }
                          else if(x==2){
                            imgs2=Image.file(imgFile);
                            img2 = base64Encode(imgFile.readAsBytesSync());
                          }
                          else{
                            imgs3=Image.file(imgFile);
                            img3 = base64Encode(imgFile.readAsBytesSync());

                          }



                        });
                        //_imgFromGallery();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () async {
                      Navigator.of(context).pop();

                      imgFile = await ImagePicker.pickImage(
                          source: ImageSource.camera

                      );
                      setState(() {

                        if(x==1){
                          imgs1=Image.file(imgFile);
                          img164 = base64Encode(imgFile.readAsBytesSync());

                        }
                        else if(x==2){
                          imgs2=Image.file(imgFile);
                          img264 = base64Encode(imgFile.readAsBytesSync());
                        }
                        else{
                          imgs3=Image.file(imgFile);
                          img364 = base64Encode(imgFile.readAsBytesSync());

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