import 'package:http/http.dart' as http;

import 'package:postme/fnc/data/Post.dart';

class Sender {
  Future<int> post(Post post) async {
    final http.Response response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: post.toJson()
    );

    if(response.statusCode == 200) {
      print(response.toString());
      return 200;
    } else {
      throw Exception('보내기 실패');
    }
  }
}