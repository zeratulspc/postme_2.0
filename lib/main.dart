import 'package:flutter/material.dart';
import 'package:postme/page/splash.dart';

///---------------------------------
/// Postme2.0
/// 만든이 : zeratulspc (김민재)
/// 2021.6.5
///---------------------------------
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
        backgroundColor: Colors.white
      ),
      home: SplashPage(),
    );
  }
}
