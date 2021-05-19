import 'package:flutter/material.dart';

import 'page/home.dart';

void main() {
  runApp(PostMe());
}


class PostMe extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PostMe!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}
