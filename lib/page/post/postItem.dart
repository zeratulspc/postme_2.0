import 'dart:math';

import 'package:flutter/material.dart';
import 'package:postme/fnc/data/Post.dart';
import 'package:postme/fnc/data/RandomColor.dart';
import 'postDetail.dart';


// ignore: must_be_immutable
class PostItem extends StatelessWidget {
  final Post post;
  PostItem(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      child : Card(
        child: InkWell(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 14),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 4,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.person, color: randomColorList[Random().nextInt(randomColorList.length)]),
                    SizedBox(width: 2,),
                    Text("User${post.userId}"),
                  ],
                ),
                SizedBox(height: 4,),
              ],
            ),
            subtitle: Text(
              post.body,
              style: Theme.of(context).textTheme.bodyText2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetail(post.id)));
          },
        ),
      ),
    );
  }


}