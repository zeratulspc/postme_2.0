import 'package:flutter/material.dart';
import 'package:postme/fnc/data/Post.dart';
import 'package:postme/fnc/sender.dart';

class PostEditPage extends StatefulWidget {
  final Post? post;
  PostEditPage({this.post});
  _PostEditPageState createState() => _PostEditPageState(post: post);
}

class _PostEditPageState extends State<PostEditPage> {
  late final Post? post;
  late final String appbarTitle;
  final TextEditingController textEditingController = TextEditingController();

  _PostEditPageState({this.post}) {
    if(post == null) {
      appbarTitle = "add Post";
    } else {
      appbarTitle=post!.title;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          //TODO valid check
          post = Post(
            0,
            0,
            "제목",
            textEditingController.text,
          );
          Sender().post(post!);
        },
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: TextField(
              controller: textEditingController,
              cursorColor: Theme.of(context).primaryColor,
              style: TextStyle(
                  fontSize: 24
              ),
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "What is happening?",
                border: InputBorder.none,
              ),
            ),
          )
      ),
    );
  }

}