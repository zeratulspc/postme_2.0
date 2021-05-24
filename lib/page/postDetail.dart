import 'dart:math';

import 'package:flutter/material.dart';
import 'package:postme/fnc/data/Post.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  final randomColorList = [
    Colors.purple,
    Colors.blueAccent,
    Colors.amber,
    Colors.cyan,
    Colors.lightGreenAccent,
    Colors.deepOrange
  ];

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
              children: [
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.person, color: randomColorList[Random().nextInt(randomColorList.length)]),
                    SizedBox(width: 2,),
                    Text("User${post.userId}"),
                  ],
                ),
              ],
            ),
          ),
          ///body
          Container(
            margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Text(
              post.body,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            alignment: Alignment.centerLeft,
          )
        ],
      ),
    );
  }
}