import 'package:cards/GlobalVaribales.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class LanguageProvider with ChangeNotifier{

  bool isER=true;
  static Map<String , Object?>  ar={

    "Allyour":"كل بطاقاتك في مكان واحد"
    ,"email":"البريد الالكتروني"
    ,"password":"رمز المرور"
    ,"Signing":"جار تسجيل الدخول"
    ,"login":"تسجيل الدخول"
    ,"loginhint":"يجب إدخال معلومات صحيحة"
    ,"Donthaveaccount":"ليس لديك حساب ؟"
    ,"Registernow":"سجل الان "
    ,"problemlogging":"يوجد مشكلة في تسجيل الدخول , أعد المحاولة لاحقا"
    ,"add":"أضافة"
    ,"ShareApp":"مشاركة التطبيق"
    ,"logout":"تسجيل الخروج"
    ,"profile":"الملف الشخصي"
    ,"edit":"تعديل الملف الشخصي"
    ,"name":"الاسم"
    ,"addcardfile":"اضافة ملف البطاقات"
    ,"saving":"جار الحفظ"
    ,"addfirstcard":"اضف البطاقة الاولى لك"
    ,"addfirstfile":"اضف ملف البطاقات الاول لك"

    ,"Expirydate":"تاريخ انتهاء البطاقة"
    ,"cardtype":"نوع البطاقة"
    ,"cardno":"رقم البطاقة"
  };
  static Map<String , Object?>  en={
    "Allyour":" All your Cards in one place"
    ,"password":"password"
    ,"email":"Email"
    ,"Signing":"Signing in"
    ,"login":"Login"
,"loginhint":"Correct information must be entered"
,"Donthaveaccount":"Don't have an account ?"
,"Registernow":"Register now"
    ,"problemlogging":"There is a problem logging in, try again later"
    ,"add":"Add"
    ,"ShareApp":"Share App"
    ,"logout":"logout"
    ,"profile":"profile"
    ,"edit":"Edit"
    ,"name":"Name"
    ,"addcardfile":"Add Cards File"
    ,"saving":"saving ..."
    ,"addfirstcard":"Add First Card Now "
    ,"addfirstfile":"Add First file Now "
    ,"Expirydate":"Expirydate"
    ,"cardtype":"Card Type"
    ,"cardno":"Card No"
  };


  changeLan (bool lan){

    isER=lan;
notifyListeners();

  }

  static TextDirection getDirection(){
    String languageCode = Globalvireables.languageCode;//Platform.localeName.split('_')[0];

    if(languageCode == "ar")
      return TextDirection.rtl;
    return TextDirection.ltr;

  }

  static TextAlign TxtAlign(){
   // String languageCode = Platform.localeName.split('_')[0];
    String languageCode = Globalvireables.languageCode;//Platform.localeName.split('_')[0];

    if(languageCode == "ar")
      return TextAlign.right;
    return TextAlign.left;

  }

  static Alignment Align(){
    // String languageCode = Platform.localeName.split('_')[0];
    String languageCode = Globalvireables.languageCode;//Platform.localeName.split('_')[0];

    if(languageCode == "ar")
      return Alignment.topRight;
    return Alignment.topLeft;

  }

  static Object? getTexts(String txt){
   // String languageCode = Platform.localeName.split('_')[0];
    String languageCode = Globalvireables.languageCode;//Platform.localeName.split('_')[0];

    if(languageCode == "ar")
    return ar[txt];
    return en[txt];
  }





  static getStringValuesSF(String key) async {
  //  SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefs = Globalvireables.languageCode;//Platform.localeName.split('_')[0];

    //Return String
    String? stringValue = prefs/*.getString(key);*/;
    if(stringValue !="en" && stringValue !="ar")
      return "en";
    return stringValue;
  }

}