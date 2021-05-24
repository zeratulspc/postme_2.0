
import 'package:flutter/material.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  ///생성자
  Post(this.userId, this.id, this.title, this.body);

  ///Json 직렬화
  Post.fromJson(Map<String, dynamic> json) :
        userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'];

  ///asyncSnapshot 직렬화
  Post.fromSnapshot(AsyncSnapshot<dynamic> snapshot) :
      userId = snapshot.data.userId,
      id = snapshot.data.id,
      title = snapshot.data.title,
      body = snapshot.data.body;

  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'userId':userId,
        'title': title,
        'body': body,
      };
}