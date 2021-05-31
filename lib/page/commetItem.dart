import 'package:flutter/material.dart';
import 'package:postme/fnc/data/Comment.dart';

class CommentItem extends StatelessWidget {

  final Comment comment;

  CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("${comment.name}"),
        subtitle: Text("${comment.body}"),
      ),
    );
  }
}