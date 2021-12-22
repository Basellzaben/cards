import 'package:flutter/cupertino.dart';

//work state data
class cards {
  int Id;
  int ProfileId;
   String CardName;
   String CardImage;
   String Barcode;
   String ExpiryDate;
   String CardType;
  final String CardNo;

   cards({
     required this.Id,
     required this.ProfileId,
    required this.CardName,
    required this.CardImage,
     required this.Barcode,
     required this.CardType,
    required this.ExpiryDate,
     required this.CardNo,
  });

  factory cards.fromJson(Map<String, dynamic> json) {
    return cards(
     Id: json['Id'] as int,
      ProfileId: json['ProfileId'] as int,
      CardName: json['CardName'] as String,
      CardImage: json['CardImage'] as String,

      Barcode: json['Barcode'] as String,
      CardType: json['CardType'] as String,
      ExpiryDate: json['ExpiryDate'] as String,

      CardNo: json['CardNo'] as String,
    );
  }
}
/*
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}*/
