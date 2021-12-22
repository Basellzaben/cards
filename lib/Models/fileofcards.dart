import 'package:flutter/cupertino.dart';

//work state data
class Fileofcards {
   int CustomerId;
   String ProfileName;
   String ProfileImage;
   int Id;

  Fileofcards({
    required this.CustomerId,
    required this.ProfileName,
    required this.ProfileImage,
    required this.Id,
  });

  factory Fileofcards.fromJson(Map<String, dynamic> json) {
    return Fileofcards(
      CustomerId: json['CustomerId'] as int,
      ProfileName: json['ProfileName'] as String,
      ProfileImage: json['ProfileImage'] as String,
      Id: json['Id'] as int,
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
