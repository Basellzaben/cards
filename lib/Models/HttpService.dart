import 'dart:convert';
import 'package:cards/GlobalVaribales.dart';
import 'package:http/http.dart';

import 'Fileofcards.dart';
import 'cards.dart';
//get work state data
class HttpService {

  Uri postsURL = Uri.parse("http://10.0.1.60:1425/api/Profiles/"+Globalvireables.ID);
  Uri cardsURL = Uri.parse("http://10.0.1.60:1425/api/GetCardsByProfId/"+Globalvireables.fileindex);
  // Uri  postsURL = Uri.parse("https://jsonplaceholder.typicode.com/posts");


 // final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Fileofcards>> getPosts(String txt) async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      print("object11");

      List<dynamic> body = jsonDecode(res.body);

      print(body.toString()+"bodybody");

      List<Fileofcards> posts = body.map((dynamic item) => Fileofcards.fromJson(item),
      ).toList();
      if(txt!="" && txt!=null) {
        posts.clear();
        for (var i = 0; i < body
            .map((dynamic item) => Fileofcards.fromJson(item),
        )
            .length; i++)
          if (body.map((dynamic item) => Fileofcards.fromJson(item),
          ).toList()[i].ProfileName.contains(txt))
            posts.add(body.map((dynamic item) => Fileofcards.fromJson(item),
            ).toList()[i]);
      }
print(posts.toString()+"posssss");
      return posts;
    } else{
      print("Unable to retrieve posts");
     throw "Unable to retrieve posts.";

    }
  }

  Future<List<cards>> getcards(String txt) async {
    Response res = await get(cardsURL);

    if (res.statusCode == 200) {
      print("object11GETCARDS");

      List<dynamic> body = jsonDecode(res.body);

      List<cards> posts = body
          .map((dynamic item) => cards.fromJson(item),
      ).toList();
      if(txt!="" && txt!=null) {
        posts.clear();
        for (var i = 0; i < body
            .map((dynamic item) => cards.fromJson(item),
        )
            .length; i++)
          if (body.map((dynamic item) => cards.fromJson(item),
          ).toList()[i].CardName.contains(txt))
            posts.add(body.map((dynamic item) => cards.fromJson(item),
            ).toList()[i]);
      }
print(res.body.toString()+"bodynewapi");

      return posts;
    } else {
      throw "Unable to retrieve posts.";
      print("object");
    }
  }

}