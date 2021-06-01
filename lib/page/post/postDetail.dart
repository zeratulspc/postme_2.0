import 'dart:math';

import 'package:flutter/material.dart';
import 'package:postme/fnc/data/Post.dart';
import 'package:postme/fnc/data/RandomColor.dart';
import 'package:postme/fnc/fetcher.dart';
import 'package:postme/page/comment/commentList.dart';

class PostDetail extends StatefulWidget {
  final int postId;
  PostDetail(this.postId);
  _PostDetailState createState() => _PostDetailState(postId);
}

class _PostDetailState extends State<PostDetail> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final int postId;
  _PostDetailState(this.postId);

  static const bottomSheetHeaderSize = 0.08;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Post"),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          FutureBuilder(
            future: Fetcher().getPost(postId),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.hasData) {
                Post post = Post.fromSnapshot(snapshot);
                return Column(
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
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          DraggableScrollableSheet(
            initialChildSize: bottomSheetHeaderSize,
            maxChildSize: 1.0,
            minChildSize: bottomSheetHeaderSize,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.grey[200],
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: CommentList(postId,screenSize,bottomSheetHeaderSize,(){
                    
                  }),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}