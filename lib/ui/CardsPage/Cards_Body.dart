
import 'dart:async';
import 'dart:convert';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cards/GlobalVaribales.dart';
import 'package:cards/LanguageProvider.dart';
import 'package:cards/Models/HttpService.dart';
import 'package:cards/Models/cards.dart';
import 'package:cards/color/HexColor.dart';
import 'package:cards/ui/CardView/Card_Body.dart';
import 'package:cards/ui/EditDataPages/EditCardDialog.dart';
import 'package:cards/ui/NavDrawer.dart';
import 'package:cards/ui/Profile/Body_profile.dart';
import 'package:cards/ui/Regeister/Register_Body.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../CardsDialog.dart';
import '../FileDialog.dart';
class Cards_Body extends StatefulWidget {
  goBackToPreviousScreen(BuildContext context){
    // Navigator.pop(context);
    /* Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Index_Main()),);*/
  }
  @override
  _Cards_Body createState() => _Cards_Body();
}



goBackToPreviousScreen(BuildContext context) {

  /* Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Index_Main()),);*/
  //Navigator.pop(context);





}

class _Cards_Body extends State<Cards_Body> with SingleTickerProviderStateMixin {
  final HttpService httpService = HttpService();
  TextEditingController searchController = TextEditingController();
  late Future<List<cards>> ListPage=httpService.getcards(searchController.text);

  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  var username;
  @override
  void initState() {
    super.initState();
RefreshPage();  // Defining controller with animation duration of two seconds
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    // Defining both color and size animations
    colorAnimation =
        ColorTween(end: HexColor(Globalvireables.bluedark), begin: HexColor(Globalvireables.bluedark)).animate(controller);
    sizeAnimation = Tween<double>(begin: 70.0, end: 75.0).animate(controller);

    /* colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
*/
    // Rebuilding the screen when animation goes ahead
    controller.addListener(() {
      //setState(() {});
    });

    // Repeat the animation after finish
    controller.repeat();

    //For single time
    //controller.forward()

    //Reverses the animation instead of starting it again and repeats
    //controller.repeat(reverse: true);
  }

  TextEditingController timeinput = TextEditingController();
  TextEditingController timeout = TextEditingController();
  TextEditingController longtimecontroler = TextEditingController();
  String date = "";
  String timelong = "";
  User? user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // resizeToAvoidBottomInset : false,
      drawer: NavDrawer(),
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

                  child: InkWell(

                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder:
                              (context) =>
                              Body_profile()


                          )
                      );
                    },
                    child: ClipRRect(

                      child: Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(right: 5, left: 5, top: 40),

                                child: Icon(
                                  Icons.person_rounded,
                                  size: 40.0,
                                  color: Colors.white,
                                )),
                            /* Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Image.asset(
                            'assest/profile.png',
                            height: 30,
                            width: 30,
                          ),


                        ),*/
                            Container(

                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(right: 0, left: 0, top: 45),
                              child: Text(Globalvireables.name,
                                style: TextStyle(color: Colors.white, fontSize: 16),),
                            )
                          ]),


                    ),
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
                        controller: searchController,
                        onChanged: RefreshPage(),
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
        backgroundColor: HexColor(Globalvireables.white2),

      body: new FutureBuilder<List<cards>>(
        future: httpService.getcards(searchController.text),
        builder: (context, snapshot) {
          List<cards>? cardss = snapshot.data;
          print(cardss.toString()+"cardds");

          if(snapshot.hasData && cardss.toString().length>10){
            return Container(
              child: Stack(
                  alignment: Alignment.topCenter,
                  fit: StackFit.passthrough,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    new ListView(
                      children: cardss!.map((post) => Container(
                          margin: EdgeInsets.only(top: 30,left: 10,right: 10,bottom: 5),
                          height: 150,
                          child:Stack(
                              alignment: Alignment.topCenter,
                              fit: StackFit.passthrough,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              overflow: Overflow.visible,
                              children: <Widget>[
                                SizedBox(
                                    child:new GestureDetector(
                                      onTap: (){

                                        Globalvireables.cardindex=post.Id.toString();

                                        Navigator.push(context,
                                            MaterialPageRoute(builder:
                                                (context) =>
                                                Card_Body()
                                            )
                                        );
                                        print("Container clicked" +post.CardNo.toString());
                                      },
                                      child: Slidable(
                                        actionPane: SlidableDrawerActionPane(),
                                        child: Card(




/* shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                *//* color:Colors.white70,height:4.5*//*
                                                  color: HexColor(Globalvireables.basecolor), width: 3),
                                              borderRadius: BorderRadius.circular(22))
                                   */        // elevation: 7,
                                         /*   shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),*/
                                            child: Container(


                                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                 image: DecorationImage(
                                    image: AssetImage('assets/cardback.jpg'),
                                    fit: BoxFit.cover,
                                  )

                                ),
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                  Container(
                                                      // margin: const EdgeInsets.only(top: 33.0,left: 10,right: 10),

                                                      alignment: Alignment.center,

                                                      child:

                                                      Container(
                                                        // margin: EdgeInsets.only(left: 14,top: 20),
                                                          alignment: Alignment.center,
                                                          //margin: EdgeInsets.only(top: 40),
                                                          child: Text(post.CardName ,style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.w800),)
                                                      ),



                                                    ),
                                                /*      Container(
                                                          margin: EdgeInsets.only(left: 14,top: 20),
                                                          alignment: Alignment.topLeft,
                                                          //margin: EdgeInsets.only(top: 40),
                                                          child: Text(post.CardName ,style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w800),)
                                                      ),*/
if(post.CardNo!=null && Globalvireables.languageCode=="en")
          Row(
          children: [
           /* IconButton(
              iconSize: 35,
              color: Colors.red,
              icon: new Icon(Icons.delete),
              highlightColor: Colors.pink,
              onPressed: (){

               delete();

              },
            ),*/

            Container(
                margin: EdgeInsets.only(top: 20,left: 10),
                alignment: Alignment.topLeft,
                //margin: EdgeInsets.only(top: 40),
                child: Text("Card No :" ,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w800),)
            ),
            Container(
                margin: EdgeInsets.only(top: 20,left: 10),
                alignment: Alignment.topLeft,
                //margin: EdgeInsets.only(top: 40),
                child: Text(post.CardNo ,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w300),)
            ),

            ])else if(post.CardNo!=null && Globalvireables.languageCode=="ar")
                                                    Row(
                                                        children: [
                                                          Spacer(),


                                                          Container(
                                                              margin: EdgeInsets.only(top: 20,left: 10),
                                                              alignment: Alignment.topLeft,
                                                              //margin: EdgeInsets.only(top: 40),
                                                              child: Text(post.CardNo ,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w300),)
                                                          ),
                                                          Container(
                                                              margin: EdgeInsets.only(top: 20,left: 10,right: 10),
                                                              alignment: Alignment.topLeft,
                                                              //margin: EdgeInsets.only(top: 40),
                                                              child: Text(" : " +"رقم البطاقة",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w800),)
                                                          ),

                                                         /* IconButton(
                                                            iconSize: 35,
                                                            color: Colors.lightGreen,
                                                            icon: new Icon(Icons.edit),
                                                            highlightColor: Colors.pink,
                                                            onPressed: (){

                                                              edit(post.CardName,post.CardNo,post.ExpiryDate,post.CardType
                                                                  ,post.CardImage1,post.CardImage2,post.CardImage3);


                                                            },
                                                          ),*/
                                                        ])
              ,

              if(post.CardType!=null && Globalvireables.languageCode=="en")
          Row(
          children: [
           /* IconButton(
              iconSize: 35,
              color: Colors.lightGreen,
              icon: new Icon(Icons.edit),
              highlightColor: Colors.pink,
              onPressed: (){

                edit(post.CardName,post.CardNo,post.ExpiryDate,post.CardType
                    ,post.CardImage1,post.CardImage2,post.CardImage3);


              },
            ),*/

    Container(
    margin: EdgeInsets.only(top: 10,left: 10),
    alignment: Alignment.topLeft,
    //margin: EdgeInsets.only(top: 40),
    child: Text("Card Type :" ,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w800),)
    ),
    Container(
    margin: EdgeInsets.only(top: 10 ,left: 10),
    alignment: Alignment.topLeft,
    //margin: EdgeInsets.only(top: 40),
    child: Text(post.CardType ,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w300),)
    ),
    ])else  if(post.CardNo!=null && Globalvireables.languageCode=="ar")
      Row(

    children: [

      Spacer(),

      Container(
    margin: EdgeInsets.only(top: 10 ,left: 10),
    alignment: Alignment.topLeft,
    //margin: EdgeInsets.only(top: 40),
    child: Text(post.CardType ,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w300),)
    ),
    Container(
    margin: EdgeInsets.only(top: 10,left: 10),
    alignment: Alignment.topLeft,
    //margin: EdgeInsets.only(top: 40),
    child: Text( " : " +"نوع البطاقة",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w800),)
    ),

   /*   IconButton(
        iconSize: 35,
        color: Colors.red,
        icon: new Icon(Icons.delete),
        highlightColor: Colors.pink,
        onPressed: (){

          delete();

        },
      ),*/

          ]),

                                              /*      if(post.CardType!=null)
                                                      Container(
                                                        margin: EdgeInsets.only(top: 30 ,left: 10),
                                                        alignment: Alignment.topLeft,
                                                        //margin: EdgeInsets.only(top: 40),
                                                        child: Text("Card Type: "+post.CardType ,style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w300),)
                                                    ),
*/

                                                  ],
                                                ),
                                              ),




                                            ),
                                        ),
/*
                                        actions: <Widget>[
                                          IconSlideAction(
                                            caption: 'Archive',
                                            color: Colors.blue,
                                            icon: Icons.archive,
                                          //  onTap: () => _showSnackBar('Archive'),
                                          ),
                                          IconSlideAction(
                                            caption: 'Share',
                                            color: Colors.indigo,
                                            icon: Icons.share,
                                        //    onTap: () => _showSnackBar('Share'),
                                          ),
                                        ],*/
                                        secondaryActions: <Widget>[
                                      /*IconSlideAction(
                                      caption: 'More',
                                        color: Colors.black45,
                                        icon: Icons.more_horiz,
                                      //  onTap: () => _showSnackBar('More'),
                                      ),*/
                     /*   IconSlideAction(
                          foregroundColor:Colors.red,
                          color:HexColor(Globalvireables.white2),
                          icon: Icons.delete,
                         // onTap: () => _showSnackBar('Delete'),
                        ),
*/
                                          IconButton(
                                            iconSize: 50,
                                            color: Colors.red,
                                            icon: new Icon(Icons.delete),
                                            highlightColor: Colors.pink,
                                            onPressed: (){
delete();
                                             /* edit(data.CardName,data.CardNo,data.ExpiryDate,data.CardType
                                                  ,data.CardImage1,data.CardImage2,data.CardImage3);
*/
                                            },
                                          ),
    ]),




                                    )
                                ),
                        /*        Positioned(
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
                                                  image: NetworkImage("http://cardskeeper-001-site1.ftempurl.com"+post.CardImage),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius: BorderRadius.all( Radius.circular(100.0)),
                                                border: Border.all(
                                                  color: HexColor(Globalvireables.white),
                                                  width: 0.0,
                                                ),
                                              ),
                                            )))),*/
                                /*Image.network("http://cardskeeper-001-site1.ftempurl.com"+post.ProfileImage,*//*
            //  height: 200,
            // width: 200,

            ),
            ),
            *//*child: Image.network("http://cardskeeper-001-site1.ftempurl.com"+post.ProfileImage,height: 100,width: 100,) ,) *//*
            )*/



          /*                      Positioned(
                                    top: -5,

                                      child: Container(

                                        *//*  decoration: new BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                 topLeft:Radius.elliptical(
                                                    MediaQuery.of(context).size.width, 300.0)
                                            ,
                                                topRight:Radius.elliptical(
                                                    MediaQuery.of(context).size.width, 300.0)),
                                          ),
*//*
                                        padding: EdgeInsets.only(top: 5,left: 20,right: 20),
                                      //  margin: EdgeInsets.only(top: 30),
                                      //  color: Colors.white,
                                         // width: MediaQuery.of(context).size.height,
                                         height: 50,

                                          child: Container(
                                             // margin: const EdgeInsets.only(top: 33.0,left: 10,right: 10),

                                              alignment: Alignment.center,

                                              child:

                                              Container(
                                                 // margin: EdgeInsets.only(left: 14,top: 20),
                                                  alignment: Alignment.center,
                                                  //margin: EdgeInsets.only(top: 40),
                                                  child: Text(post.CardName ,style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.w800),)
                                              ),



                                          )),

                                ),

*/


                              ])/* */

                      )).toList(),
                    ),



                    Positioned(
                      top: 250 ,
                      child:Container(
                        alignment: Alignment.bottomCenter,
                        height: sizeAnimation.value,
                        width: sizeAnimation.value,
                        margin: EdgeInsets.only(top: 200),
                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              //  primary: HexColor("#4267b2")
                              primary:  colorAnimation.value
                          ),
                          child: Container(
                            width: 90,
                           height: 90,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Text(
                              LanguageProvider.getTexts('add').toString(),
                              style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300,),
                            ),
                          ),
                          onPressed: () {
                            //  getUser();
                            showDialog(
                              context: context,
                              builder: (_) => CardsDialog(),
                            );



                          },
                        ),
                      ),
                    )

                  ] ),
            );}else{
            return bodyd();
          };
        },
      ),);
  }





  Widget bodyd() {
    return Container(
      child: SingleChildScrollView(

        child: Column(
          children: [

            Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 100),
                child: Text(LanguageProvider.getTexts('addfirstcard').toString(), style: TextStyle(
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
              height: sizeAnimation.value,
              width: sizeAnimation.value,
              margin: EdgeInsets.only(top: 200),
              child: ElevatedButton(




                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    //  primary: HexColor("#4267b2")
                    primary:  colorAnimation.value
                ),
                child: Container(
                  width: 90,
                  height: 90,
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
                    builder: (_) => CardsDialog(),
                  );

                },
              ),
            ),

          ],
        ),
      ),
    );
  }
  RefreshPage(){
    if(searchController.text.toString().length>0){
      print("refresh ... ");
      setState(() {
        ListPage=httpService.getcards(searchController.text);

      });
    }}

  delete () async {
    try {

      Uri apiUrl = Uri.parse(Globalvireables.addCards+"/"+Globalvireables.cardindex);
      showAlert(context,LanguageProvider.getTexts('deleting').toString());
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

  void showAlert(BuildContext context,String text) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(text),
        ));
  }
  edit(String name,String no,String date,String type,String img1,String img2,String img3) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditCardDialog(name,no,date,type,img1,img2,img3)),);
  }
}


