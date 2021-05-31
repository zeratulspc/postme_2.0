import 'package:flutter/material.dart';
import 'package:postme/fnc/data/Post.dart';
import 'package:postme/fnc/sender.dart';

class PostEditPage extends StatefulWidget {
  final Post? post;
  PostEditPage({this.post});
  _PostEditPageState createState() => _PostEditPageState(post: post);
}

class _PostEditPageState extends State<PostEditPage> {
  final TextEditingController textEditingController = TextEditingController();
  final Post? post;
  bool _isEditPost = false;

  _PostEditPageState({this.post}) {
    if(post == null) {
      _isEditPost = false;
    } else {
      _isEditPost = true;
      textEditingController.text = post!.body;
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
        title: Text(_isEditPost?"Edit Post":"New Post"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          //TODO valid check
          var _post = Post(
            0,
            0,
            "제목",
            textEditingController.text,
          );
          Sender().post(_post);
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