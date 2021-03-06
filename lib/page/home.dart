import 'package:flutter/material.dart';

import 'package:postme/page/post/postEdit.dart';
import 'package:postme/page/post/postList.dart';
import 'setting/setting.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PostEditPage()));
            },
          ),
          menuButton(context),
        ],
      ),
      body: PostList(),
    );
  }

  Widget menuButton(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (int i) {
        switch(i) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingPage()));
            break;
          default:
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        PopupMenuItem<int>(
          value: 0,
          child: Text('Setting'),
        ),
      ],
    );
  }
}