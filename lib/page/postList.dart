import 'package:flutter/material.dart';
import 'package:postme/fnc/data/Post.dart';
import 'package:postme/fnc/fetcher.dart';
import 'package:postme/page/postItem.dart';

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, i) {
          return PostItem(posts[i]);
        }
    );
  }

}