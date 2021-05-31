import 'package:flutter/material.dart';
import 'package:postme/fnc/data/Comment.dart';
import 'package:postme/fnc/fetcher.dart';
import 'package:postme/page/commetItem.dart';

class CommentList extends StatefulWidget {
  final int postId;
  final ScrollController scrollController;
  final Function onCommentsLoaded;
  CommentList(this.postId, this.scrollController, this.onCommentsLoaded);
  _CommentListState createState()=> _CommentListState(postId, this.scrollController,onCommentsLoaded);
}

class _CommentListState extends State<CommentList> {
  final int postId;
  final ScrollController scrollController;
  final Function onCommentsLoaded;
  _CommentListState(this.postId, this.scrollController,this.onCommentsLoaded);

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
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius:BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                )
            ),
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
              itemCount: comments.length,
              itemBuilder: (context, i) {
                return CommentItem(comments[i]);
              }
          ),
        ],
      ),
    );
  }

}