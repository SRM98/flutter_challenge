class Comment {
  int postId;
  int id;
  String name;
  String email;
  String body;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Comment && id == other.id;

  Comment({this.postId, this.id, this.name, this.email, this.body}) {}

  factory Comment.fromJson(Map<String, dynamic> parsedJson) {
    return Comment(
      postId: parsedJson['postId'],
      id: parsedJson['id'],
      name: parsedJson['name'],
      email: parsedJson['email'],
      body: parsedJson['body'],
    );
  }
}
