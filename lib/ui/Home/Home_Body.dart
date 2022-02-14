import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cards/DataBase/SQLHelper.dart';
import 'package:cards/GlobalVaribales.dart';
import 'package:cards/LanguageProvider.dart';
import 'dart:ui' as ui;
import 'package:cards/ui/CardsPage/Cards_Body.dart';
import 'package:cards/ui/EditDataPages/EditFileDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:cards/color/HexColor.dart';
import 'package:cards/ui/NavDrawer.dart';
import 'package:cards/ui/Profile/Body_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';

class Home_Body extends StatefulWidget {

  @override
  _Home_Body createState() => _Home_Body();

}

class _Home_Body extends State<Home_Body>   {
  String albumName ='Media';

  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;

  Widget bodyd() {
    Future.delayed(Duration.zero, () async {
      _refreshJournals(searchcontroler.text);
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
          ],
        ),
      ),
    );
  }
late int cc;
  List<Map<String, dynamic>> _journals = [];
  late List<String> countcards=["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""];
  final picker = ImagePicker();
  var imgFile;
  bool _disposed = false;
  bool _isLoading = true;
  void _refreshJournals(String text) async {
    //_journals.clear();
    var data = await SQLHelper.getItems(text);
   // _journals = data;
  //  countcards.clear();
   // if(_journals.length>0)
/*    for(var i=0;i<_journals.length;i++){


      try {

      var datasize = await SQLHelper.getcountcards(_journals[i]['id']);
      setState(() {
       *//* if(countcards.length>_journals.length)
          countcards.removeAt(i);*//*
        countcards.add(datasize.toString());

      });
      print(countcards.toString()+"tessssr");
      } on Exception catch (_) {
        countcards[i]="0";
      }
    }*/

    // _journals = data;
        setState(() {
          _journals = data;
         // print(_journals.length.toString()+ " islength");

     //     cc=_journals.length;
        });

  }
  void getcount() async {
   // countcards.clear();
    for(var i=0;i<_journals.length;i++){
      try {
        var datasize = await SQLHelper.getcountcards(_journals[i]['id']);
        setState(() {
          countcards[i]=datasize.toString();
        });
        print(countcards.toString()+"tessssr");
      } on Exception catch (_) {
        countcards[i]="0";
      }

    }
    _refreshJournals(searchcontroler.text);
  }
  Image? imgs1 ;
  String img1="";
/* @override
  void dispose() {
   // timer?.cancel();
   // _disposed = true;
    super.dispose();
  }*/
  @override
  void initState() {
  //  cc =  SQLHelper.getcountcards("").toString();

    getcount();

   SQLHelper.db();
    super.initState();

 //Timer.periodic(Duration(seconds: 15), (Timer t) => _refreshJournals(searchcontroler.text));
    _refreshJournals(searchcontroler.text);
  // getcount();
     // Loading the diary when the app starts
  }
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item


  final TextEditingController searchcontroler = TextEditingController();


// Insert a new journal to the database
  Future<void> _addItem() async {
    if(img1!=null)
    await SQLHelper.createItem(
        _titleController.text, img1);
    setState(() {
      _refreshJournals(searchcontroler.text);
    });
    img1="";
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    if(img1!=null)
      await SQLHelper.updateItem(
        id, _titleController.text, img1);
    //setState(() {
      _refreshJournals(searchcontroler.text);
    //});
  }

  // Delete an item
  void _deleteItem(int id) async {

    await SQLHelper.deleteItem(id);
  /*  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a profile!'),
    ));*/
    _refreshJournals(searchcontroler.text);
  }

  @override
  Widget build(BuildContext context) {
  //  _refreshJournals(searchcontroler.text);
  //  countcards.clear();
    getcount();
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
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

                             Row(
                               children: [
                                 Container(
                                    // alignment: Alignment.topLeft,
                                     margin: EdgeInsets.only(right: 0, left: 0, top: 33),

                                     child: Image.asset('assets/logo2.png',height: 60,width: 60,)),

                                 Container(
                                    // alignment: Alignment.topLeft,
                                     margin: EdgeInsets.only(right: 0, left: 0, top: 33),

                                     child:Text("Card Keeper",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16),))
                               ],
                             ),



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

                Row(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(right: 15, left: 15, top: 16),

                        width: 300
                        , height: 55,
                        child: Center(

                            child: TextField(
                              autofocus: false,
                              onChanged: RefreshPage(),
                              controller: searchcontroler,
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
                    ),


                  ],
                )


              ],
            ),
          ),
        ),
        body: _journals.isEmpty
            ?  bodyd()

            : ListView.builder(
            itemCount: _journals.length,
            itemBuilder: (context, index)
                    => Container(
                margin: EdgeInsets.only(top: 40,left: 20,right: 20,bottom: 50),
                height: 200,
                child:Stack(
                    alignment: Alignment.topCenter,
                    fit: StackFit.passthrough,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    overflow: Overflow.visible,
                    children: <Widget>[


                      SizedBox(
                          child:new GestureDetector(
                            onTap: (){

                              Globalvireables.fileindex=_journals[index]['id'].toString();

                              Navigator.push(context,
                                  MaterialPageRoute(builder:
                                      (context) =>
                                      Cards_Body()
                                  )
                              );

                            //  print("Container clicked" +post.Id.toString());
                            },
                            child: Card(

                                elevation: 7,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                child: Container(

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        stops: [
                                          0.5,
                                          0.1,
                                          0.4,
                                          0.1,
                                        ],
                                        colors: [

                                          HexColor(Globalvireables.white2),
                                          HexColor(Globalvireables.white2),
                                          HexColor(Globalvireables.white3),
                                          HexColor(Globalvireables.white3),

                                        ],
                                      )),

                                  /*  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),


                                      image: DecorationImage(
                                        image: NetworkImage("http://cardskeeper-001-site1.ftempurl.com"+post.ProfileImage),
                                        fit: BoxFit.cover,
                                      ),

                                    ),*/
                                  child: Container(
                                    child: SingleChildScrollView(
                                      child: Column(

                                        children: [

                                          Center(
                                            child: Container(

                                                margin: EdgeInsets.only(left: 14,top: 77),
                                                alignment: Alignment.center,
                                                //margin: EdgeInsets.only(top: 40),
                                                child: Text(_journals[index]['title'],style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w800),)
                                            ),
                                          ),
                                          Row(

                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(top: 10,left: 5,right: 5)
                                                  ,
                                                  child: new GestureDetector(
                                                    onTap: (){
                                                      showAlertDialog(context,index);
                                                     // Globalvireables.fileindex=post.Id.toString();

                                                      //showAlertDialog(context);

                                                    },
                                                    child: Container(
                                                        alignment: Alignment.bottomLeft,
                                                        child: Icon(
                                                          Icons.delete,
                                                          size: 30.0,
                                                          color:HexColor(Globalvireables.basecolor),

                                                        )
                                                    ),
                                                  ),
                                                ),



                                                Container(
                                                  margin: EdgeInsets.only(top: 10,left: 10,right: 10)
                                                  ,
                                                  child: new GestureDetector(
                                                    onTap: (){
                                                     // Globalvireables.fileindex=post.Id.toString();

                                                 Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => EditFileDialog(_journals[index]['title'],_journals[index]['path'],_journals[index]['id'])),);

                                                    setState(() {
                                                     // Navigator.of(context).pop();
                                                    // _showFormEdit(_journals[index]['id'],context);
                                                    });
                                                    },
                                                    child: Container(
                                                        alignment: Alignment.bottomLeft,
                                                        child: Icon(
                                                          Icons.edit,
                                                          size: 30.0,
                                                          color:HexColor(Globalvireables.basecolor),
                                                        )
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                if(countcards.length==_journals.length)
                                                Container(
                                                      margin: EdgeInsets.only(left: 15,right: 15,top: 13),
                                                    child: Text(countcards[index] ,style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.w800),)),

                                              /*    Container(

                                                      child: Text("0",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w800),)
                                                  ),*/

                                              ])
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          )
                      ),
                      if(_journals[index]['path']!=null)
                        if(_journals[index]['path'].toString().length>5)
                          Positioned(
                            top: -50,
                            child:   new GestureDetector(
                          onTap: (){

                          Globalvireables.fileindex=_journals[index]['id'].toString();

                          Navigator.push(context,
                          MaterialPageRoute(builder:
                          (context) =>
                          Cards_Body()
                          )
                          );

                          //  print("Container clicked" +post.Id.toString());
                          },
                              child: Container(

                                  width: MediaQuery.of(context).size.height,
                                  height: 120,

                                  child: Container(
                                      margin: const EdgeInsets.only(top: 33.0,left: 10,right: 10),

                                      alignment: Alignment.center,

                                      child:

                                      Container(
                                        width: 90.0,
                                        height: 90.0,

                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(50.0),
                                            child: Image.file(
                                              File(_journals[index]['path']),
                                              gaplessPlayback: true,
                                            )
                                        ),


                                        /*decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                  *//*  image: DecorationImage(
                      image: NetworkImage("http://cardskeeper-001-site1.ftempurl.com"+post.ProfileImage),
                      fit: BoxFit.cover,
                    ),*//*

                    borderRadius: BorderRadius.all( Radius.circular(40.0)),
                    border: Border.all(
                      color: HexColor(Globalvireables.white),
                      width: 0.0,
                    ),
                  ),*/
                                      ))),
                            )),
                      /*Image.network("http://cardskeeper-001-site1.ftempurl.com"+post.ProfileImage,*//*
                //  height: 200,
                // width: 200,

                ),
                ),
                *//*child: Image.network("http://cardskeeper-001-site1.ftempurl.com"+post.ProfileImage,height: 100,width: 100,) ,) *//*
                )*/

                    ])/* */

            )),






/*          : ListView.builder(
          itemCount: _journals.length,
          itemBuilder: (context, index) => Card(
            color: HexColor(Globalvireables.white),
            margin: const EdgeInsets.all(15),
            child: Container(height: 80,
              child: ListTile(
                  leading: Container(

                      child: Image.memory(
                        base64.decode(_journals[index]['path']),
                        gaplessPlayback: true,
                      )

                   *//* child: CircleAvatar(
                      backgroundImage: AssetImage('assets/logo.jpg'), // no matter how big it is, it won't overflow
                    ),*//*
                  ),
                  title: Text(_journals[index]['title']),
               //   subtitle: Text(_journals[index]['path']),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit,color: Colors.lightGreen,),
                          onPressed: () =>setState(() {
                            _showForm(_journals[index]['id'],context);
                          })
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete,color: Colors.deepOrange,),
                          onPressed: () =>
                              _deleteItem(_journals[index]['id']),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),*/

        floatingActionButton: FloatingActionButton(
          backgroundColor: HexColor(Globalvireables.basecolor),
          child: Icon(Icons.add),
          onPressed: () async {
              //Navigator.pop(context);



            //  await Future.delayed(const Duration(milliseconds: 100));
          //    await Future.delayed(Duration(seconds: 1));
      _showForm(null,context);



  }
        ),
      ),
    );
  }




  showAlertDialog(BuildContext context,var index) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(LanguageProvider.getTexts('Cancel').toString()),
      onPressed:  () {
        setState(() {

          Navigator.of(context).pop();
          /* ListPage=httpService.getPosts("x");
          ListPage=httpService.getPosts("");
          RefreshPage*/
          /*  Navigator.push(context,
            MaterialPageRoute(builder: (context) => Home_Body()),);
*/

        });
        // dismiss dialog
      },
    );
    Widget continueButton = TextButton(
      child: Text(LanguageProvider.getTexts('Continue').toString()),
      onPressed:  () {


        setState(() {

          Navigator.of(context).pop();

          _deleteItem(_journals[index]['id']);


        });



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

  RefreshPage() {
setState(() {
  //_showForm(null,context);
  _refreshJournals(searchcontroler.text);


});

  }

  Future<String> _createFileFromString(String base) async {
    final encodedStr = base;
    Uint8List bytes = base64.decode(encodedStr);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File("/storage/emulated/0/Android/data/com.galaxyinternational.cards/files/"
        /*"$dir/"*/ + DateTime.now().millisecondsSinceEpoch.toString() + ".jpg");
    await file.writeAsBytes(bytes).then((value) => {
    setState(() {
    Globalvireables.imagen=file.path;
    img1=file.path;
print ("gg");
    })
    });


    return file.path;
  }
  Future<String> savegalary(String base,int x,String path) async {
    final encodedStr = base;
    Uint8List bytes = base64.decode(encodedStr);
    String dir = (await getTemporaryDirectory()).path;
    File file = File("/storage/emulated/0/Android/data/com.galaxyinternational.cards/files/"+ DateTime.now().millisecondsSinceEpoch.toString() + ".jpg");
    await file.writeAsBytes(bytes).then((value) => {
      setState(() {
        Globalvireables.imagen=file.path;
        //img1=file.path;


        if(x==1){
          img1 =file.path;

        }

        print ("gg");
      })
    });

    print(file.path+"file.pathh");
    return file.path;
  }
  void _showForm(int? id,BuildContext context) async {
   img1="";
   _refreshJournals("");
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
      _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _descriptionController.text = existingJournal['path'];

    }
    showModalBottomSheet(
        context: context,
        elevation: 10,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  padding: EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 15,
                    // this will prevent the soft keyboard from covering the text fields
                    bottom: MediaQuery.of(context).viewInsets.bottom + 120,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [



                        Center(
                          child: InkWell(
                            onTap: () async {
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

/*

                                                    final String path = await imgFile.getApplicationDocumentsDirectory();
                                                    final String fileName = imgFile.basename(imgFile.path); // Filename without extension
                                                    final String fileExtension = imgFile.extension(imgFile.path); // e.g. '.jpg'

                                                    // 6. Save the file by copying it to the new location on the device.
                                                    final String filePath = '$path/$fileName$fileExtension';
                                                    print("path== "+filePath);
*/


                                                  File selected = await FlutterNativeImage.compressImage(imgFile.path,
                                                    quality: 50,);

                                                  // File selected = File(imgFile.path);




                                                  //    print("path=="+selected.path);
                                                  setState(() {
                                                    print("this path    "+selected.path);
                                                    /*  imgs1=Image.file(selected);
                                                      img1 = selected.path;//base64Encode(selected.readAsBytesSync());
                                                 */     imgs1=Image.file(selected);
                                                    img1 =selected.path.toString();// base64Encode(selected.readAsBytesSync());

                                                  });
                                                  savegalary(base64Encode(selected.readAsBytesSync()),1,selected.path);

                                                  //_imgFromGallery();
                                                }),
                                            new ListTile(
                                              leading: new Icon(Icons.photo_camera),
                                              title: new Text('Camera'),
                                              onTap: () async {
                                                Navigator.of(context).pop();

                                                imgFile = await picker.pickImage(
                                                    source: ImageSource.camera

                                                );
                                                File selected = await FlutterNativeImage.compressImage(imgFile.path,
                                                  quality: 50,);
                                                setState(() {
                                                  imgs1=Image.file(selected);

                                                  img1 = selected.path.toString();
                                                });
                                                _createFileFromString(base64Encode(selected.readAsBytesSync()));

                                                //_imgFromCamera();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                              );
                              //  _showPicker(context,1);
                            },
                            child: image(1),
                          ),
                        ),


                        TextField(
                          controller: _titleController,
                          decoration: InputDecoration(hintText: LanguageProvider.getTexts('name').toString()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        /*   TextField(
                            controller: _descriptionController,
                            decoration: const InputDecoration(hintText: 'path'),
                          ),*/
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            // Save new journal
                            if (id == null) {
                              await _addItem();
                            }

                            if (id != null) {
                               _updateItem(id);
                            }

                            // Clear the text fields
                            _titleController.text = '';
                            _descriptionController.text = '';

                            // Close the bottom sheet
                            Navigator.of(context).pop();
                          },
                          child: Center(child: Text(id == null ? LanguageProvider.getTexts('add').toString()
                              : LanguageProvider.getTexts('save').toString())),
                        )
                      ],
                    ),
                  ),);});});
  }
  Widget image(var x){

    if(x==0 && img1!=null)
    {if(img1.length>5)
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
                        File(img1),
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

                        img1="";
                        x=1;
                      });


                    },
                  ),
                ),


              ),
            ],
          )

        /*child: Container(
            width: 200,
            height: 150,
            child:  Container(
          child: ClipRRect(
  //        borderRadius: BorderRadius.circular(50.0),
    child: Image.memory(
    base64.decode(img1),
    gaplessPlayback: true,
    )
    ),
        ),
      )*/);

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
    }}
  void _showFormEdit(int? id,BuildContext context) async {
    img1="";
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
      _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      img1= existingJournal['path'];

    }
    showModalBottomSheet(
        context: context,
        elevation: 10,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  padding: EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 15,
                    // this will prevent the soft keyboard from covering the text fields
                    bottom: MediaQuery.of(context).viewInsets.bottom + 120,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [



                        Center(
                          child: InkWell(
                              onTap: () async {
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

/*

                                                    final String path = await imgFile.getApplicationDocumentsDirectory();
                                                    final String fileName = imgFile.basename(imgFile.path); // Filename without extension
                                                    final String fileExtension = imgFile.extension(imgFile.path); // e.g. '.jpg'

                                                    // 6. Save the file by copying it to the new location on the device.
                                                    final String filePath = '$path/$fileName$fileExtension';
                                                    print("path== "+filePath);
*/


                                                    File selected = await FlutterNativeImage.compressImage(imgFile.path,
                                                      quality: 50,);


                                                    print(selected.path+"   path");


                                                    // File selected = File(imgFile.path);




                                                    //    print("path=="+selected.path);
                                                    setState(() {

                                                      imgs1=Image.file(selected);
                                                      img1 =selected.path.toString();// base64Encode(selected.readAsBytesSync());
                                                      _createFileFromString(base64Encode(selected.readAsBytesSync()));

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

/*
                                                  final String path = await imgFile.getApplicationDocumentsDirectory();
                                                  final String fileName = imgFile.basename(imgFile.path); // Filename without extension
                                                  final String fileExtension = imgFile.extension(imgFile.path); // e.g. '.jpg'

                                                  // 6. Save the file by copying it to the new location on the device.
                                                  final String filePath = '$path/$fileName$fileExtension';
print("path== "+filePath);*/


                                                  //  File selected = File(imgFile.path);
                                                  File selected = await FlutterNativeImage.compressImage(imgFile.path,
                                                    quality: 50,);
                                                  setState(() {
                                                    imgs1=Image.file(selected);
                                                    img1=selected.path.toString();
                                                  });
                                                  _createFileFromString(base64Encode(selected.readAsBytesSync()));

                                                  //_imgFromCamera();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                );
                                //  _showPicker(context,1);
                              },
                              child: //image(0),
                              SingleChildScrollView(
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: <Widget>[
                                      if(img1!=null)
                                        if(img1.length>5)
                                          Container(
                                            width: 200,
                                            height: 150,
                                            child:  Container(
                                              child: ClipRRect(
                                                //  borderRadius: BorderRadius.circular(50.0),
                                                  child: Image.file(
                                                    File(img1),
                                                  )
                                              ),
                                            ),
                                          ),
                                      if(img1!=null)
                                        if(img1.length>5)
                                          Positioned(
                                            top: -15,
                                            left: -10,
                                            child: Center(
                                              child: IconButton(
                                                icon: Icon(Icons.clear,color: Colors.red,size: 25,),
                                                onPressed: () {

                                                  setState(() {

                                                    img1="";
                                                    // x=1;
                                                  });


                                                },
                                              ),
                                            ),


                                          ),
                                      // if(img1!=null)
                                      if(img1.length<5)
                                        Container(
                                          //child: Image.asset('assets/emptyfile.png'),
                                          child: Icon(
                                            Icons.image,
                                            size: 100.0,
                                            color: HexColor(Globalvireables.basecolor),
                                          ),
                                        ),



                                    ],
                                  )

                                /*child: Container(
            width: 200,
            height: 150,
            child:  Container(
          child: ClipRRect(
  //        borderRadius: BorderRadius.circular(50.0),
    child: Image.memory(
    base64.decode(img1),
    gaplessPlayback: true,
    )
    ),
        ),
      )*/)





                          ),
                        ),


                        TextField(
                          controller: _titleController,
                          decoration: InputDecoration(hintText: LanguageProvider.getTexts('name').toString()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        /*   TextField(
                            controller: _descriptionController,
                            decoration: const InputDecoration(hintText: 'path'),
                          ),*/
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            //  primary: HexColor("#4267b2")
                              primary:  HexColor(Globalvireables.basecolor)
                          ),
                          /* style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(HexColor(Globalvireables.basecolor))
                                ,backgroundColor: MaterialStateProperty.all<Color>(HexColor(Globalvireables.basecolor))),
                */  onPressed: () async {
                          // Save new journal
                          if (id == null) {
                            await _addItem();
                          }

                          if (id != null) {
                             _updateItem(id);
                          }

                          // Clear the text fields
                          _titleController.text = '';
                          _descriptionController.text = '';

                          // Close the bottom sheet
                          Navigator.of(context).pop();
                        },
                          child: Center(child: Text(id == null ? LanguageProvider.getTexts('add').toString()
                              : LanguageProvider.getTexts('save').toString())),
                        )
                      ],
                    ),
                  ),);});});
  }


}