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
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
class BarCodePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogoutOverlayStatecard();
}

class LogoutOverlayStatecard extends State<BarCodePage>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Center(

      child: Scaffold(
          body: Center(
              child: Container(
                margin: EdgeInsets.only(top: 100,left: 20,right: 20),

                //   height: 120,

                child: Column(
                  children: [
                    Container(
                      width: 300,
                      height: 180,
                      child: SfBarcodeGenerator(
                        value: Globalvireables.barcodedata,
                      ),
                    ),

                    Center(child: Container(
                      margin: EdgeInsets.only(top: 40),
                        child: Text(Globalvireables.barcodedata,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25),)))

                  ],
                ),
              ))),
      );

  }

}