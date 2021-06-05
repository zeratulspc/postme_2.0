import 'package:flutter/material.dart';
import 'package:postme/fnc/data/Post.dart';
import 'package:postme/fnc/API/fetcher.dart';
import 'package:postme/page/post/postItem.dart';

class PostList extends StatefulWidget {
  _PostListState createState()=> _PostListState();
}

class _PostListState extends State<PostList> {
  Fetcher fetch = Fetcher();
  List<Post> posts = [];

  @override
  void initState() {
    fetch.getPosts().then((v) => setState(() => posts=v));
    super.initState();
  }


  Future onRefresh() async {
    setState(() {
      posts.clear();
    });
    posts = await fetch.getPosts();
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: posts.length != 0 ? ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, i) {
              return PostItem(posts[i]);
            }
        ) : Center(
          child: CircularProgressIndicator(),
        ),
        onRefresh: onRefresh
    );
  }

}