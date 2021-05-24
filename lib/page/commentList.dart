import 'package:flutter/material.dart';
import 'package:postme/fnc/data/Comment.dart';
import 'package:postme/fnc/fetcher.dart';
import 'package:postme/page/commetItem.dart';

class CommentList extends StatefulWidget {
  final int postId;
  final Function onCommentsLoaded;
  CommentList(this.postId, this.onCommentsLoaded);
  _CommentListState createState()=> _CommentListState(postId, onCommentsLoaded);
}

class _CommentListState extends State<CommentList> {
  final int postId;
  final Function onCommentsLoaded;
  _CommentListState(this.postId, this.onCommentsLoaded);

  Fetcher fetch = Fetcher();
  List<Comment> comments = [];

  @override
  void initState() {
    fetch.getComments(postId).then((v) => {
      setState(() => comments=v),
      onCommentsLoaded
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Comments",
                  style: Theme.of(context).textTheme.headline6,
                ),
                comments.length != 0 ? SizedBox() : CircularProgressIndicator()
              ],
            ),
          ),
          ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, i) {
                return CommentItem(comments[i]);
              }
          )
        ],
      ),
    );
  }

}