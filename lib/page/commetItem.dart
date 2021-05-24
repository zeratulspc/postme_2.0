import 'package:flutter/material.dart';
import 'package:postme/fnc/data/Comment.dart';

class CommentItem extends StatelessWidget {

  final Comment comment;

  CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Text("${comment.body}"),
    );
  }
}