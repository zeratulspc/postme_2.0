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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.green,
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
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
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: comments.length,
                itemBuilder: (context, i) {
                  return CommentItem(comments[i]);
                }
            ),
          ),
        ],
      ),
    );
  }

}