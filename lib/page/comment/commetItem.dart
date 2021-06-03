import 'package:flutter/material.dart';
import 'package:postme/fnc/data/Comment.dart';

class CommentItem extends StatelessWidget {

  final Comment comment;

  CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Icon(
            Icons.person,
            size: 48.0,
        ),
        title: Text("${comment.name}"),
        subtitle: Text("${comment.body}"),
      ),
    );
  }
}