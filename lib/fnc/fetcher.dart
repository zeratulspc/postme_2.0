import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:postme/fnc/data/Post.dart';



class Fetcher {
  Future<List<Post>> getPosts() async {
    final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode == 200) {
      List<Post> posts = [];
      List<dynamic> raw = jsonDecode(response.body);
      raw.forEach((e) {
        posts.add(Post.fromJson(e));
      });
      return posts;
    } else {
      throw Exception('불러오기 실패');
    }
  }
}