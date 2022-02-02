import 'package:cards/ui/login/Login_Body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'Register_Body.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Register_Main());

}
class Register_Main extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
goBackToPreviousScreen(BuildContext context) {
//  Navigator.pop(context);


  /* Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Index_Main()),);*/
}

class _MyAppState extends State<Register_Main> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Register_Body(),
      debugShowCheckedModeBanner: false,
      title: 'title.en',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),




      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
