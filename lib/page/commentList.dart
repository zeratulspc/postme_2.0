import 'package:flutter/material.dart';
import 'package:postme/fnc/data/Comment.dart';
import 'package:postme/fnc/fetcher.dart';
import 'package:postme/page/commetItem.dart';

class CommentList extends StatefulWidget {
  final int postId;
  CommentList(this.postId);
  _CommentListState createState()=> _CommentListState(postId);
}

class _CommentListState extends State<CommentList> {
  final int postId;

  _CommentListState(this.postId);

  Fetcher fetch = Fetcher();
  List<Comment> comments = [];

  @override
  void initState() {
    fetch.getComments(postId).then((v) => setState(() => comments=v));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return comments.length != 0 ?ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, i) {
          return CommentItem(comments[i]);
        }
    ) : Center(
      child: CircularProgressIndicator(),
    );
  }

}