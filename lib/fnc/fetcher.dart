import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:postme/fnc/data/Comment.dart';
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

  Future<Post> getPost(int postId) async {
    final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId'));
    if(response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('불러오기 실패');
    }
  }

  Future<List<Comment>> getComments(int postId) async {
    final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId/comments'));
    if(response.statusCode == 200) {
      List<Comment> comments = [];
      List<dynamic> raw = jsonDecode(response.body);
      raw.forEach((e) {
        comments.add(Comment.fromJson(e));
      });
      return comments;
    } else {
      throw Exception('불러오기 실패');
    }
  }
}