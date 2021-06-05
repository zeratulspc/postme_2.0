import 'package:flutter/material.dart';
import 'package:postme/fnc/data/Comment.dart';
import 'package:postme/fnc/fetcher.dart';
import 'package:postme/page/comment/commetItem.dart';

class CommentList extends StatefulWidget {
  final int postId;
  final Size parentSize;
  final double headerSize;
  final Function onCommentsLoaded;
  CommentList(this.postId,this.parentSize,this.headerSize,this.onCommentsLoaded);
  _CommentListState createState()=> _CommentListState(postId,parentSize,headerSize,onCommentsLoaded);
}

class _CommentListState extends State<CommentList> {
  final int postId;
  final Size parentSize;
  final double headerSize;
  final Function onCommentsLoaded;
  _CommentListState(this.postId, this.parentSize,this.headerSize,this.onCommentsLoaded);

  Fetcher fetch = Fetcher();
  List<Comment> comments = [];

  @override
  void initState() {
    fetch.getComments(postId).then((v) => {setState(() => comments=v), onCommentsLoaded()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: parentSize.height * headerSize,
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Comments",
                style: Theme.of(context).textTheme.headline6,
              ),
              comments.length != 0 ?
              SizedBox() :
              SizedBox(
                height: 15.0,
                width: 15.0,
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: comments.length,
            itemBuilder: (context, i) {
              return CommentItem(comments[i]);
            }
        ),
      ],
    );
  }

}