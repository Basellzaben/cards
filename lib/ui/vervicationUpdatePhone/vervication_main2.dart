import 'package:cards/ui/vervicationUpdatePhone/vervication_body2.dart';
import 'package:cards/ui/vervicationpage/vervication_body.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(vervication_main2());
}

class vervication_main2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: verviaction_body2(),
    );
  }
}