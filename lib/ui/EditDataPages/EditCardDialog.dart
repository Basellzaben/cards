import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cards/DataBase/SQLHelper.dart';
import 'package:cards/LanguageProvider.dart';
import 'package:cards/ui/CardView/Card_Body.dart';
import 'package:flutter/services.dart';
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
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:barcode_scan/barcode_scan.dart';

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
  final picker = ImagePicker();
  final String name;
  final String no;
  final String date;
  final String type;
   String img1;
   String img2;


  List<String> imgsPath = [];
  List<int> imgsid = [];


  String img3;
  LogoutOverlayStatecard( this.name, this.no, this.date, this.type,this.img1,this.img2,this.img3){
  }

   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late http.Response response;
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  List<Map<String, dynamic>> _journals = [];

  List<Map<String, dynamic>> imageadded = [];

  List<Map<String, dynamic>> imagesc = [];
  Future<void> deleteimage(String index) async {
    await SQLHelper.deleteimage(index);
    getallimages();

  }
  void getallimages() async {
    var data = await SQLHelper.getcardimages(Globalvireables.cardindex);

    setState(() {
      imagesc = data+imageadded;
      print(data.toString()+"    =thisimageee");
    });

  }

  void _refreshkeys() async {
    var data = await SQLHelper.getKeys();
    /*  setState(() {

    //  _isLoading = false;
    });*/

    setState(() {
      _journals = data;
    });

  }
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
    _refreshkeys();
    getallimages();
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
    return new WillPopScope(
      onWillPop: () async {


        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Card_Body()),);

        return true;

      },
      child: Center(
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
if(Globalvireables.languageCode=="en")
                      Center(
                          child: Text("Edit Card",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              color: HexColor(Globalvireables.basecolor)
                          ),))else
  Center(
        child: Text("تعديل البطاقة",style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
            color: HexColor(Globalvireables.basecolor)
        ),))
                            ,

                      Column(
                        children: [
                          Container(

                            height: 150,

                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: imagesc.length,
                              itemBuilder: (context, index)
                              => Container(

                                child: new InkWell(
                                  onTap: () async {
                                    setState(() {

                                      _showPicker(context, 1,imagesc[index]['id']);




                                             });  },
                                  child:
                                  SingleChildScrollView(
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: <Widget>[

                                          Container(
                                            margin: EdgeInsets.all( 10),

                                            width: 150,
                                            height: 150,
                                            child:  Container(
                                              child: ClipRRect(
                                                //  borderRadius: BorderRadius.circular(50.0),
                                                  child: Image.file(
                                                    File(imagesc[index]['path']),

                                                  )
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: -15,
                                            left: -10,
                                            child: Center(
                                              child: IconButton(
                                                icon: Icon(Icons.clear,color: Colors.red,size: 25,),
                                                onPressed: () async {
                                                var d=  await SQLHelper.getcardimages(Globalvireables.cardindex);
                                                if(index>=d.length) {
                                                  setState(() {

                                                    print("isindexdelete"+(index - d.length).toString());

                                                    imageadded.removeAt(index - d.length);
                                                    imgsPath.removeAt(index - d.length);
                                                  });
                                                getallimages();
                                                }
                                                  else
                                                  deleteimage(imagesc[index]['id'].toString());
                                               //   });


                                                },
                                              ),
                                            ),


                                          ),
                                        ],
                                      )
                                  )
                                  /*Container(
                                    margin: EdgeInsets.all( 20),
                                    child: Image.file(

                                      File(imagesc[index]['path']),
                                      height: MediaQuery.of(context).size.width/4,
                                      width: MediaQuery.of(context).size.width/4,

                                      gaplessPlayback: true,
                                      fit: BoxFit.fill,

                                    ),
                                  ),*/
                                ),/*Container(

            child: Image.file(

              File(imagesc[index]['path']),
              height: MediaQuery.of(context).size.width/4,
              width: MediaQuery.of(context).size.width/4,

              gaplessPlayback: true,
              fit: BoxFit.fill,

            ),
       ),*/
                              ),
                            ),

                          ),


                          Container(
                            margin: EdgeInsets.only(top: 10),
                            color: Colors.white,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,),
                              child: Icon(
                                Icons.image,
                                size: 30.0,
                                color: HexColor(Globalvireables.basecolor),
                              ),
                              onPressed:
                                  () async {

                                setState((){
                                  _showPicker(context, 1,-1);


                                  // /100dp  imgs.add(Image.file(imgFile));
                                });
                              },
                            ),
                          ),


                        ],
                      ),


/*                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: [

                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () async {

                                        setState((){
                                          _showPicker(context,1);
                                        });
                                      },
                                      child: image(imgs1,img1,1),


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
                                      child: image(imgs2,img2,2),

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
                                      child: image(imgs3,img3,3),
                                    ),
                                  ),
                                )

                              ])),*/

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
                           // keyboardType: TextInputType.numberWithOptions(decimal: true),
                            controller: cardnocontroler,
                            // enabled: false,
                            decoration: InputDecoration(

                              suffixIcon: IconButton(
                                onPressed: barcodeScanning,
                                icon: Icon(Icons.camera_alt,color: Colors.black26

                                  ,),
                              ),

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
        /*              SingleChildScrollView(
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
                          child: Text(LanguageProvider.getTexts('save').toString()),

                          onPressed: () async {


                            if(namecontroler.text.length>2) {
                              print ("images this="+ img164+"  ---  "+ img164);
                              if(imagesc[0]["path"]==null || imagesc[0]["path"].toString().length<2)
                                displayMessage("Add name to cards");
else
                              SQLHelper.updateCard(Globalvireables.cardindex,Globalvireables.fileindex
                              ,namecontroler.text,  imagesc[0]["path"], img2, img3,cardnocontroler.text,ExpiryDatecontroler.text,typecontroler.text);
                           //   EditFile(namecontroler.text,  img1, img2, img3, context);


                              _addKey(typecontroler.text);
                             // Navigator.pop(context);

                              for(var i=0;i<imgsPath.length;i++){
                                await SQLHelper.addimagetocard(imgsPath[i],Globalvireables.cardindex);
                          //  print("saveisdone = $idofcardsaved")
                            }

                            }else{
                              displayMessage("Add name to cards");
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Card_Body()),);


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
      ),
    );
  }
  Widget image(Image? img,String imgg,int x){

    if(imgg!=null)
    {if(imgg.length>5)
      return SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[

              Container(
                width: 200,
                height: 150,
                child:  Container(
                  child: ClipRRect(
                    //  borderRadius: BorderRadius.circular(50.0),
                      child: Image.file(
                        File(imgg),
                      )
                  ),
                ),
              ),
              Positioned(
                top: -15,
                left: -10,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.clear,color: Colors.red,size: 25,),
                    onPressed: () {

                      setState(() {
if(x==1)
                        img1="";
        else if(x==2)
        img2="";
    else
      img3="";
                       // x=1;
                      });


                    },
                  ),
                ),


              ),
            ],
          )
);

    else return Container(

        //child: Image.asset('assets/emptyfile.png'),
        child: Icon(
          Icons.image,
          size: 100.0,
          color: HexColor(Globalvireables.basecolor),
        ),
      );

    }else{

      if(imgs1 !=null && img1.length>10)
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

/*
    if(imgg != null) {
      if (imgg.length > 10)
        return SingleChildScrollView(
          child: Container(
              width: 200,
              height: 150,
              child: Image.memory(
                base64.decode(imgg),
                gaplessPlayback: true,
              )
          ),

        );
      else
      return Container(
        child: Icon(
          Icons.image,
          size: 100.0,
          color: HexColor(Globalvireables.basecolor),
        ),   );
    } else
      return Container(
    child: Icon(
        Icons.image,
        size: 100.0,
        color: HexColor(Globalvireables.basecolor),
      ),   );
*/

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
      displayMessage("error");


    }
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Card_Body()),);

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



  _showPicker(context,var x,int id) {
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

                    //      print("paathgg"+imgFile.path);

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
                            img1 = selected.path;

                          }
                          else if(x==2){
                            imgs2=Image.file(selected!);
                            img2 = selected.path;
                          }
                          else if(x==3){
                            imgs3=Image.file(selected!);
                            img3 = selected.path;

                          }
                          _createFileFromString(base64Encode(selected!.readAsBytesSync()),id);



                        });
                        //_imgFromGallery();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () async {
                      Navigator.of(context).pop();
                      imgFile = await picker.pickImage(
                          source: ImageSource.camera,
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
                          img1 = selected.path;
                        }
                        else if(x==2){
                          imgs2=Image.file(selected!);
                          img2 = selected.path;
                        }
                        else if(x==3){
                          imgs3=Image.file(selected!);
                          img3 = selected.path;
                        }
                        _createFileFromString(base64Encode(selected!.readAsBytesSync()),id);

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
  Future<String> _createFileFromString(String base,int id) async {
    final encodedStr = base;
    Uint8List bytes = base64.decode(encodedStr);
    String dir =
        "/storage/emulated/0/Android/data/com.galaxyinternational.cards/files/" + DateTime.now().millisecondsSinceEpoch.toString() + ".jpg";
    /*(await getApplicationDocumentsDirectory()).path;*/
    File file = File(dir);
    await file.writeAsBytes(bytes).then((value) => {
      setState(() {

        imageadded.add(
          {"id": -1, "path":file.path, "cardid": Globalvireables.cardindex}
      );
        //imageadded.removeAt(index)
        getallimages();
        Globalvireables.imagen=file.path;
        //img1=file.path;

        img364 =file.path;
        if(id>=0)
deleteimage(id.toString())
;        // img364 = base64Encode(selected.readAsBytesSync());
        imgsPath.add(img364);

        print ("adddone"+img364);
      })
    });


    return file.path;
  }
  /*_cropImage(filePath) async {
    File croppedImage = await ImageCropper.cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
    );*/
  Future<void> _addKey(String title) async {
    if(title.length>0)
      await SQLHelper.createKey(title);
    //  _refreshJournals();
  }
  Future barcodeScanning() async {
    try {
      ScanResult barcode = await BarcodeScanner.scan();
      setState(() =>  cardnocontroler.text=barcode.rawContent/*print(barcode.rawContent+"  bars")*/);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          cardnocontroler.text = 'No camera permission!';
        });
      } else {
        setState(() =>  cardnocontroler.text = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() =>  cardnocontroler.text =
      'Nothing captured.');
    } catch (e) {
      setState(() =>  cardnocontroler.text = 'Unknown error: $e');
    }
  }
}