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

    ,"ExpiryDate":"تاريخ انتهاء البطاقة"
    ,"cardtype":"نوع البطاقة"
    ,"cardno":"رقم البطاقة"
    ,"deleting":"جار الحذف ..."
    ,"search":"بحث"
    ,"next":"التالي"
    ,"Alreadyhaveanaccount":"تمتلك حساب بالفعل ؟"
    ,"confirmpassword":"تأكيد كلمة المرور"
    ,"Enteraphone":"ادخل رقم الهاتف"
    ,"confirmationcode":"أدخل رمز التاكيد"
    ,"Sendcode":"أرسال رمز التاكيد"
,"Cancel":"الغاء"
    ,"Continue":"استمرار"
    ,"save":"حفظ"

    ,"deletetext":"سيتم حذف جميع البطاقات داخل الملف"
    ,"delete":"حــذف"
,"finger":"تسجيل الدخول من خلال البصمة"
    ,"deletecard":"هل انت متاكد من حذف البطاقة"
    ,"emailorphone":"البريد الالكتروني او رقم الهاتف"

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
    ,"addcardfile":"Add New Profiles"
    ,"saving":"saving ..."
    ,"addfirstcard":"Add First Card Now "
    ,"addfirstfile":"Add First file Now "
    ,"ExpiryDate":"Expirydate"
    ,"cardtype":"Card Type"
    ,"cardno":"Card No"
    ,"deleting":"deleting ..."
    ,"search":"Search"
    ,"Alreadyhaveanaccount":"Already have an account ?"
    ,"next":"Next"
,"Enteraphone":"Enter a phone number"
    ,"confirmpassword":"confirm password"
    ,"confirmationcode":"Enter the confirmation code"
    ,"Sendcode":"Send confirmation code"
    ,"Cancel":"Cancel"
    ,"Continue":"Continue"
    ,"deletetext":"All cards inside the file will be deleted"
    ,"delete":"delete"
    ,"finger":"Sign in with fingerprint"
    ,"save":"save"
    ,"deletecard":"Are you sure to delete the card?"
,"emailorphone":"email or phone number"
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
    else
      return prefs;
    return stringValue;
  }

}