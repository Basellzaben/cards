
import 'dart:async';
import 'dart:convert';

import 'package:cards/GlobalVaribales.dart';
import 'package:cards/LanguageProvider.dart';
import 'package:cards/Models/HttpService.dart';
import 'package:cards/Models/Fileofcards.dart';
import 'package:cards/Models/Fileofcards.dart';
import 'package:cards/color/HexColor.dart';
import 'package:cards/ui/CardsPage/Cards_Body.dart';
import 'package:cards/ui/EditDataPages/EditFileDialog.dart';
import 'package:cards/ui/NavDrawer.dart';
import 'package:cards/ui/Profile/Body_profile.dart';
import 'package:cards/ui/Regeister/Register_Body.dart';
import 'package:cards/ui/login/Login_Body.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../FileDialog.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class Home_Body extends StatefulWidget {

  @override
  _Home_Body createState() => _Home_Body();

}

class _Home_Body extends State<Home_Body> with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  final HttpService httpService = HttpService();

   final globalKey = GlobalKey<ScaffoldState>();
   var username;
  late Future<List<Fileofcards>> ListPage=httpService.getPosts(searchController.text);

  RefreshPage(){
    if(searchController.text.toString().length>0){
    print("refresh ... ");
    setState(() {
      ListPage=httpService.getPosts(searchController.text);

    });
  }else{
      ListPage=httpService.getPosts(searchController.text);
    }


  }

  @override
  void initState() {
    if(Globalvireables.languageCode=="en")
    {
    Globalvireables.lantext="اللغة العربية";
    }
    else {

      Globalvireables.lantext="English Language";

    }
    super.initState();
  /*  const oneSecond = const Duration(seconds: 25);
    new Timer.periodic(oneSecond, (Timer t) => setState((){

      RefreshPage();

    }));
     */
    RefreshPage();

  }

  TextEditingController timeinput = TextEditingController();
  TextEditingController timeout = TextEditingController();
  TextEditingController longtimecontroler = TextEditingController();
  String date = "";
  String timelong = "";
  User? user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//final GlobalKey<ScaffoldState> scafold=new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    setState(() {

      RefreshPage();

    });
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        //endDrawer: ,
        backgroundColor: HexColor(Globalvireables.white2),
        drawerEnableOpenDragGesture: false,
        // resizeToAvoidBottomInset : false,
        endDrawer: NavDrawer(),
          appBar: PreferredSize(

            preferredSize: Size.fromHeight(150), // Set this height
              child: Container(

      decoration: new BoxDecoration(
      borderRadius: BorderRadius.vertical(
      bottom: Radius.elliptical(
      MediaQuery.of(context).size.width, 50.0)),
                color: HexColor(Globalvireables.bluedark)),
                child: Column(
                  //    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Container(
                  color: HexColor(Globalvireables.bluedark),
                  child: Material(
                    color: HexColor(Globalvireables.bluedark),


                  child: ClipRRect(

                      child: Row(

                          children: <Widget>[
                            Container(
                              child: InkWell(

                                onTap: () {

                                  Navigator.push(context,
                                      MaterialPageRoute(builder:
                                          (context) =>
                                          Body_profile()
                                      )
                                  );


                                },
                                  child: Row(

                                      children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 5, left: 5, top: 40),

                                  child: Icon(
                                    Icons.person_rounded,
                                    size: 40.0,
                                    color: Colors.white,
                                  )),

                             Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(right: 0, left: 0, top: 45),
                              child: Text(Globalvireables.name,
                                style: TextStyle(color: Colors.white, fontSize: 16),),
                            ),])




                              ),),
Spacer(),
                            InkWell(

                              onTap: () {
                                _scaffoldKey.currentState!.openEndDrawer();
                               /* Navigator.push(context,
                                    MaterialPageRoute(builder:
                                        (context) =>
                                        Body_profile()
                                    )
                                );
*/

                              },
                              child: Container(
                                alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(right: 5, left: 5, top: 40),

                                  child: Icon(
                                    Icons.menu,
                                    size: 40.0,
                                    color: Colors.white,
                                  )),
                            ),


                          ]),


                  ),

                  ),



                ),

                    Center(
                      child: Container(
                        margin: EdgeInsets.only(right: 0, left: 0, top: 16),

                        width: 290
                        , height: 55,
                        child: Center(

                            child: TextField(
                              autofocus: false,
                              onChanged: RefreshPage(),
                              controller: searchController,
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: LanguageProvider.getTexts('search').toString(),

                                prefixIcon: Icon(Icons.search),
                                hintStyle: TextStyle(color: Colors.black12),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20.0)),
                                  //      borderSide: BorderSide(color: Colors.green, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20.0)),
                                  //   borderSide: BorderSide(color: Colors.green, width: 2),
                                ),
                              ),)

                        ),
                      ),
                    )


                  ],
                ),
              ),

          ),
          body: new FutureBuilder<List<Fileofcards>>(
            future: ListPage,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();
              List<Fileofcards>? posts = snapshot.data;
            if(!date.isEmpty || !posts!.isEmpty){
              return Container(
                child: Stack(
                    alignment: Alignment.topCenter,
                    fit: StackFit.passthrough,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    overflow: Overflow.visible,
                    children: <Widget>[
                  new ListView(
                    children: posts!.map((post) => Container(

margin: EdgeInsets.only(top: 40,left: 20,right: 20,bottom: 22),
                       height: 170,
                        child:Stack(

                            alignment: Alignment.topCenter,
                            fit: StackFit.passthrough,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            overflow: Overflow.visible,
                            children: <Widget>[
                          SizedBox(

                            child:new GestureDetector(
                              onTap: (){

  Globalvireables.fileindex=post.Id.toString();

                                Navigator.push(context,
                                    MaterialPageRoute(builder:
                                        (context) =>
                                        Cards_Body()
                                    )
                                );

                                print("Container clicked" +post.Id.toString());
                              },
                              child: Card(
                                  elevation: 7,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                child: Container(
                                /*  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),


                                    image: DecorationImage(
                                      image: NetworkImage("http://cardskeeper-001-site1.ftempurl.com"+post.ProfileImage),
                                      fit: BoxFit.cover,
                                    ),

                                  ),*/
                                  child: Container(
                                    child: Column(

                                      children: [

                                        Center(
                                          child: Container(

                                            margin: EdgeInsets.only(left: 14,top: 77),
alignment: Alignment.center,
                                              //margin: EdgeInsets.only(top: 40),
                                              child: Text(post.ProfileName ,style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w800),)
                                          ),
                                        ),


              Row(

              children: [
                Container(
                  margin: EdgeInsets.only(top: 10,left: 5,right: 5)

                  ,
                                          child: new GestureDetector(
                                            onTap: (){

                                            showAlertDialog(context);

                                            },
                                            child: Container(
                                                alignment: Alignment.bottomLeft,
                                                child: Icon(
                                                  Icons.delete,
                                                  size: 30.0,
                                                  color: Colors.red,
                                                )
                                            ),
                                          ),
                                        ),



                                        Container(
                                          margin: EdgeInsets.only(top: 10,left: 10,right: 10)
                                          ,
                                          child: new GestureDetector(
                                            onTap: (){

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => EditFileDialog(post.ProfileName,post.ProfileImage)),);


                                            },
                                            child: Container(
                                                alignment: Alignment.bottomLeft,
                                                child: Icon(
                                                  Icons.edit,
                                                  size: 30.0,
                                                  color: Colors.lightGreen,
                                                )
                                            ),
                                          ),
                                        )
                                        ])
                                      ],
                                    ),
                                  ),
                                )),
                            )
                          ),
              Positioned(
              top: -50,
              child:   Container(
              width: MediaQuery.of(context).size.height,
              height: 120,

              child: Container(
              margin: const EdgeInsets.only(top: 33.0,left: 10,right: 10),

              alignment: Alignment.center,

              child:

              Container(
                width: 100.0,
                height: 120.0,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    image: NetworkImage("http://cardskeeper-001-site1.ftempurl.com"+post.ProfileImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all( Radius.circular(100.0)),
                  border: Border.all(
                    color: HexColor(Globalvireables.white),
                    width: 0.0,
                  ),
                ),
              )))),
                /*Image.network("http://cardskeeper-001-site1.ftempurl.com"+post.ProfileImage,*//*
              //  height: 200,
              // width: 200,

              ),
              ),
              *//*child: Image.network("http://cardskeeper-001-site1.ftempurl.com"+post.ProfileImage,height: 100,width: 100,) ,) *//*
              )*/

              ])/* */

                    )).toList(),
                  ),



              Positioned(
              top: 220 ,
                child:Container(
                alignment: Alignment.bottomCenter,
                height: 100,
                width: 100,
                margin: EdgeInsets.only(top: 200),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      //  primary: HexColor("#4267b2")
                      primary:  HexColor(Globalvireables.basecolor)
                  ),
                  child: Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Text(
                      LanguageProvider.getTexts('add').toString(),
                      style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w300,),
                    ),
                  ),
                  onPressed: () {

                    setState(() {
                      RefreshPage();
                    });

                    //  getUser();
                    showDialog(
                      context: context,
                      builder: (_) => FileDialog(),
                    );
//RefreshPage();


                  },
                ),
              ),
              )

               ] ),
              );}else{
return bodyd();
      };
              },
          ),),
    );
  }





  Widget bodyd() {
    Future.delayed(Duration.zero, () async {
      RefreshPage();
    });
    return Container(
      child: SingleChildScrollView(

        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 100),
                child: Text(LanguageProvider.getTexts('addfirstfile').toString(), style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    color: HexColor(Globalvireables.bluedark)
                             ),)),


        Container(
          margin: EdgeInsets.only(top: 20),
          child: Icon(
            Icons.credit_card_outlined,
            size: 80.0,
            color: HexColor(Globalvireables.bluedark),
          ))
    ,
            Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              width: 100,
            margin: EdgeInsets.only(top: 200),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  //  primary: HexColor("#4267b2")
                    primary:  HexColor(Globalvireables.basecolor)
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Text(
                    LanguageProvider.getTexts('add').toString(),

                    style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w300,),
                  ),
                ),
                onPressed: () {
                //  getUser();
               showDialog(
                    context: context,
                    builder: (_) => FileDialog(),
                  );

                },
              ),
            ),

          ],
        ),
      ),
    );
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

  delete () async {
    try {
print("tis delete profile link "+Globalvireables.cardfiles);
      Uri apiUrl = Uri.parse(Globalvireables.cardfiles+"/"+Globalvireables.fileindex);
showAlert(context,LanguageProvider.getTexts('deleting').toString());
showAlert(context,LanguageProvider.getTexts('deleting').toString());
      final json = {
        "Id": Globalvireables.fileindex ,
        "CustomerId":Globalvireables.ID
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
   RefreshPage();

    }on TimeoutException catch (_) {
      // displayMessage('out time');
      // displayMessage("out time");
   //   Navigator.pop(context);
      // displayMessage("Login information error");

    }on FormatException catch(_){

     // Navigator.pop(context);
      // displayMessage("Login information error");


    }
   // Navigator.pop(context);
  }
  void showAlert(BuildContext context,String text) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(text),
        ));
  }
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(LanguageProvider.getTexts('Cancel').toString()),
      onPressed:  () {        Navigator.of(context).pop(); // dismiss dialog
      },
    );
    Widget continueButton = TextButton(
      child: Text(LanguageProvider.getTexts('Continue').toString()),
      onPressed:  () {

        Navigator.of(context).pop();
        delete(); // dismiss dialog
       // launchMissile();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(LanguageProvider.getTexts('delete').toString()),
      content: Text(LanguageProvider.getTexts('deletetext').toString()),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}


