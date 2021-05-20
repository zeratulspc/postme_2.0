import 'package:flutter/material.dart';
import 'package:postme/fnc/data/Post.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  PostDetail(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Column(
        children: [
          ///header
          Container(
            margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.title),
                Text(post.userId.toString()),
              ],
            ),
          ),
          ///body
          Container(
            margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Text(post.body),
          )

        ],
      ),
    );
  }
}