
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:typed_data';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:cards/LanguageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

import 'package:http/http.dart';
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cards/GlobalVaribales.dart';
import 'package:cards/Models/Cardinfo.dart';
import 'package:cards/Models/HttpService.dart';
import 'package:cards/Models/cards.dart';
import 'package:cards/color/HexColor.dart';
import 'package:cards/ui/NavDrawer.dart';
import 'package:cards/ui/Profile/Body_profile.dart';
import 'package:cards/ui/Regeister/Register_Body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../CardsDialog.dart';
import '../FileDialog.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
class Card_Body extends StatefulWidget {

  @override
  _Card_Body createState() => _Card_Body();
}


class _Card_Body extends State<Card_Body> {
  final HttpService httpService = HttpService();

  var data;
  String _dataString = "Hello from this QR";
  @override
  void initState() {
    super.initState();
   // shareImage();
  }

  GlobalKey globalKey = new GlobalKey();
 // String dataString = "Hello from this QR";
  TextEditingController timeinput = TextEditingController();
  TextEditingController timeout = TextEditingController();
  final BaseCacheManager baseCacheManager = DefaultCacheManager();
  //final _globalKey = GlobalKey();
  //late Uint8List pngBytes;
//bool isBtn2=false;
  Future<Cardinfo> getCardData() async {
    Uri apiUrl = Uri.parse(Globalvireables.getCardsBYID+Globalvireables.cardindex);


    http.Response response = await http.get(apiUrl);

    var jsonResponse = jsonDecode(response.body);

    // var parsedJson = json.decode(jsonResponse);
    data = Cardinfo.fromJson(jsonResponse);
    print(jsonResponse.toString()+"resssssspnse");
    return data;


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
   /*     appBar: PreferredSize(

            preferredSize: Size.fromHeight(100), // Set this height
            child: Container(

                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 50.0)),
                    color: HexColor(Globalvireables.bluedark)),
                child: Column(
                  //    mainAxisAlignment: MainAxisAlignment.center,
                    children: [



                      ]))),*/
body: SingleChildScrollView(

    child: FutureBuilder<Cardinfo>(
    future: getCardData(),
    builder: (context, snapshot) {
     // print(snapshot.data!.ExpiryDate.toString()+"dfsfdf");
    if (snapshot.hasData) {
    var data = snapshot.data;


    return
       SingleChildScrollView(
        child: Column(
children: [

 Container(
width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 10.0)),
                      color: HexColor(Globalvireables.bluedark)),
                  child: Column(
                    //    mainAxisAlignment: MainAxisAlignment.center,
                      children: [

Container(alignment: LanguageProvider.Align() ,margin:EdgeInsets.only(top: 46,left: 10),child: Text(data!.CardName,style: TextStyle(color: Colors.white,fontSize: 25),),)

                      ])),


 //Container(alignment:Alignment.topLeft,margin: EdgeInsets.only(top: 10,left: 10),child:Text("Card Data",style: TextStyle(fontSize: 15),)),
if(Globalvireables.languageCode=="en")
 Row(
   children: [

       Container(alignment:LanguageProvider.Align(),margin: EdgeInsets.only(top: 20,left: 20),child:Text("Card No :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500))),
       Container(alignment:LanguageProvider.Align(),margin: EdgeInsets.only(top: 20,left: 20),child:Text(data.CardNo,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),)),
   ],
 )
  else
  Row(
  children: [

      Container(alignment:LanguageProvider.Align(),margin: EdgeInsets.only(top: 20,left: 20),child:Text(data.CardNo,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),)),
      Container(alignment:LanguageProvider.Align(),margin: EdgeInsets.only(top: 20,left: 20),child:Text("Card No :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500))),

      ],
      ),
  if(Globalvireables.languageCode=="en")
    Row(
      children: [

        Container(alignment:Alignment.topLeft,margin: EdgeInsets.only(top: 15,left: 20),child:Text("Card Type :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500))),
        Container(alignment:Alignment.topLeft,margin: EdgeInsets.only(top: 15,left: 20),child:Text(data.CardType,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),)),
      ],
  )
  else
      Row(
      children: [
      Container(alignment:Alignment.topLeft,margin: EdgeInsets.only(top: 15,left: 20),child:Text(data.CardType,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),)),

      Container(alignment:Alignment.topLeft,margin: EdgeInsets.only(top: 15,left: 20),child:Text("Card Type :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500))),
      ],
      ),
  if(Globalvireables.languageCode=="en")
    Row(
      children: [
        Container(alignment:Alignment.topLeft,margin: EdgeInsets.only(top: 15,left: 20),child:Text("Expiry Date :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500))),
        Container(alignment:Alignment.topLeft,margin: EdgeInsets.only(top: 15,left: 20),child:Text(data.ExpiryDate.replaceAll("T00:00:00", ""),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),)),
      ],
  )else
    Row(
      children: [
        Container(alignment:Alignment.topLeft,margin: EdgeInsets.only(top: 15,left: 20),child:Text(data.ExpiryDate.replaceAll("T00:00:00", ""),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),)),

        Container(alignment:Alignment.topLeft,margin: EdgeInsets.only(top: 15,left: 20),child:Text("Expiry Date :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500))),
      ],
    ),


  SingleChildScrollView(
      child: Column(
          children: <Widget>[
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: [
                      if(data.CardImage1!=null)
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Image.network(
                          "http://cardskeeper-001-site1.ftempurl.com"+data.CardImage1,  width: MediaQuery.of(context).size.width,
                          height: 300,
                          fit: BoxFit.fill,
                        ),
                      ),
if(data.CardImage2!=null)
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Image.network(
                          "http://cardskeeper-001-site1.ftempurl.com"+data.CardImage2,  width: MediaQuery.of(context).size.width,
                          height: 300,
                          fit: BoxFit.fill,
                        ),
                      ),

                      if(data.CardImage3!=null)

                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Image.network(
                          "http://cardskeeper-001-site1.ftempurl.com"+data.CardImage3,  width: MediaQuery.of(context).size.width,
                          height: 300,
                          fit: BoxFit.fill,
                        ),
                      ),



                    ])),



          ])),




  Container(
    width: MediaQuery.of(context).size.width,
margin: EdgeInsets.only(top: 55),
      alignment: Alignment.center,
      child: Row(
        children: [
          Spacer(),
          IconButton(
            iconSize: 35,
            color: Colors.red,
            icon: new Icon(Icons.delete),
            highlightColor: Colors.pink,
            onPressed: (){

              delete();

            },
          ),
          Spacer(),
          IconButton(
            iconSize: 35,
            color: Colors.black87,
            icon: new Icon(Icons.share),
            highlightColor: Colors.pink,
            onPressed: (){
              Share.share( "http://cardskeeper-001-site1.ftempurl.com"+data.CardImage1, subject:
              'Using Cards Keeper app'
                  '\n Card No : '+data.CardNo+""+"\n Card Type :"+data.CardType+""+
                  "\n Expiry Date :"+data.ExpiryDate);

            },
          ),

          Spacer(),

          IconButton(
            color: Colors.lightGreen,
            iconSize: 35,
            icon: new Icon(Icons.qr_code),
            highlightColor: Colors.pink,
            onPressed: (){
              print("ffffff");
            //_captureAndSharePng();

            },
          ),
          Spacer(),

        ],
      ),
  ),




         ] ),
      );
    }else return

     Container(
         margin: EdgeInsets.only(top: 400),
         child: Center(child: CircularProgressIndicator()));

    }))



    );}


/*  _shareImage() async {
    try {
      final ByteData bytes = await rootBundle.load('http://cardskeeper-001-site1.ftempurl.com'+'/Content/Profiles/36/1.jpg');
      final Uint8List list = bytes.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/image.jpg').create();
      file.writeAsBytesSync(list);

      final channel = const MethodChannel('channel:me.albie.share/share');
      channel.invokeMethod('shareFile', 'image.jpg');

    } catch (e) {
      print('Share error: $e');
    }
  }*/
 /* void shareImage() async {
    Uri url = Uri.parse("http://cardskeeper-001-site1.ftempurl.com/Content/Profiles/36/1.jpg");
    Future<Null> saveAndShare() async {
      setState(() {
        isBtn2 = true;
      });
      final RenderObject? box = context.findRenderObject();
      if (Platform.isAndroid) {
      //  var url = 'https://www.winklix.com/blog/wp-content/uploads/2020/01/6t1pv3xcd.png';
        var response = await get(url);
        final documentDirectory = (await getExternalStorageDirectory())!.path;
        File imgFile = new File('$documentDirectory/flutter.png');
        imgFile.writeAsBytesSync(response.bodyBytes);

        Share.shareFiles(['$documentDirectory/flutter.png'],
            subject: 'URL conversion + Share',
            text: 'Hey! Checkout the Share Files repo',
        );
      } else {
        Share.share('Hey! Checkout the Share Files repo',
            subject: 'URL conversion + Share',
         );
      }
      setState(() {
        isBtn2 = false;
      });
    }
  }*/

/*DeleteCard(String Id)async{

    Uri apiUrl = Uri.parse(Globalvireables.loginapi);
    showAlert(context,"Signing in ...");
    final json = {
      "Id":Id
      "ProfileId": Globalvireables.fileindex ,
      "CardName": d,
      "CardImage": path,
      "CardNo": cardnocontroler.text,
      "Barcode": "barcode",
      "ExpiryDate": "2021/5/12",
      "CardType": typecontroler.text,
    };




    http.Response response=await http.delete(apiUrl, body: json);

    response = await http.post(apiUrl, body: json);

  }*/
        void showAlert(BuildContext context,String text) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(text),
          ));
    }

  Future<void> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary =
      globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
     // RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();       final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);
      final channel = const MethodChannel('channel:me.alfian.share/share');
      channel.invokeMethod('shareFile', 'image.png');
      print("succf in barcode");

    } catch(e) {
      print(e.toString()+"errror in barcode");
    }
  }


  delete () async {
    try {

      Uri apiUrl = Uri.parse(Globalvireables.addCards+"/"+Globalvireables.cardindex);
      showAlert(context,LanguageProvider.getTexts('saving').toString());
      final json = {
        "Id": Globalvireables.fileindex ,
      };
      print ("card save");


      //await http.post(apiUrl,body: jsone);

      http.Response response=await http.delete(apiUrl, body: json);

      var jsonResponse = jsonDecode(response.body);

      if (!jsonResponse.toString().contains("ID: 0")) {

        print("succ = "+jsonResponse.toString());
        Navigator.pop(context);

      }
      else {
        Navigator.pop(context);
      //  displayMessage("Login information error");
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
     // displayMessage("out time");
      Navigator.pop(context);
      // displayMessage("Login information error");

    }on FormatException catch(_){

      Navigator.pop(context);
     // displayMessage("Login information error");


    }
    Navigator.pop(context);
  }




















}