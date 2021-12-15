import 'dart:convert';
import 'package:http/http.dart';

import 'Fileofcards.dart';
//get work state data
class HttpService {

  Uri postsURL = Uri.parse("http://10.0.1.60:1425/api/Profiles/25");
  // Uri  postsURL = Uri.parse("https://jsonplaceholder.typicode.com/posts");


 // final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Fileofcards>> getPosts() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      print("object11");

      List<dynamic> body = jsonDecode(res.body);

      List<Fileofcards> posts = body
          .map((dynamic item) => Fileofcards.fromJson(item),
      ).toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
      print("object");
    }
  }
}