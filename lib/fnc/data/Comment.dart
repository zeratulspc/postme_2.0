class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment(this.postId,this.id,this.name,this.email,this.body);

  ///Json 직렬화
  Comment.fromJson(Map<String, dynamic> json) :
        postId = json['postId'],
        id = json['id'],
        name = json['name'],
        email = json['email'],
        body = json['body'];

  Map<String, dynamic> toJson() =>
      {
        'postId':postId,
        'id':id,
        'name':name,
        'email': email,
        'body': body,
      };

}