
import 'dart:io';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';


class Globalvireables {
  static String languageCode = Platform.localeName.split('_')[0];

  static String lantext="";
  //Colors
 // static String basecolor="#1f319d";
  static String basecolor="#273746";
  static String white="#ffffff";
  static String black="#121212";
  static String white3="#ECECEC";
  static String secondarycolor="#dd7826";
  static String white2="#E5E5E5";
  static String bluedark="#273746";
  //#
  static String regesterapi="http://cardskeeper-001-site1.ftempurl.com/api/Registration";
  static String loginapi="http://cardskeeper-001-site1.ftempurl.com/api/Login";
  static String cardfiles="http://cardskeeper-001-site1.ftempurl.com/api/Profiles";
  static String addCards="http://cardskeeper-001-site1.ftempurl.com/api/Cards";
  static String getCardsBYID="http://cardskeeper-001-site1.ftempurl.com/api/Cards/";
  static String GetCardsByProfId="http://cardskeeper-001-site1.ftempurl.com/api/GetCardsByProfId/";
  static String regorupdate=""; //0 regester-- 1 update



  //http://localhost:49521/api/GetCardsByProfId/57
  //http://localhost:49521/api/Cards/57


  // api/Cards
//Getprofiles/88
  //
//

  //http://cardskeeper-001-site1.ftempurl.com/api/Profiles
//users informiation
  static String ID="";
  static String name="";
  static String email="";
  static String password="";
  static String country="";
  static String phone="0";
  static String photoURL="";
  static String barcodedata="0";



  static var img164;
  static String img264="";
  static String img364="";
  //files and cards
  static String fileindex="";
  static String cardindex="";

  static List<String> countryname=["البحرين","العراق","الاردن","لبنان","فلسطين"
    ,"المملكة العربية السعودية","الكويت","عمان","سوريا","قطر"];
  static List<String> countryzipcode=["+973","+964","+962","+961","+970","+966","+965","+968","+963","+974"];

  static String imagen="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";
}