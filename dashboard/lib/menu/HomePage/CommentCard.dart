import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/models/Comment.dart';
import 'package:dashboard/models/Post.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  CommentCard(this.post, this.comments);

  final Post post;
  final List<Comment> comments;

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  void initState() {
    super.initState();
  }

  Widget commentWidget(Comment comment) {
    return Container(
      height: 180,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        children: [
          Divider(),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Icon(
              Icons.person,
              size: 30,
              color: Color(0xFF73BDBF),
            ),
            Expanded(
              child: AutoSizeText(comment.name,
                  minFontSize: 8,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF73BDBF),
                  ),
                  overflow: TextOverflow.ellipsis),
            ),
          ]),
          SizedBox(height: 25,),
          Row(
            children: [
              Expanded(
                  child: AutoSizeText(
                comment.body,
                minFontSize: 8,
                style: TextStyle(color: Colors.grey),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> commentSection() {
    List<Widget> list = [];
    widget.comments.forEach((element) {
      list.add(commentWidget(element));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Card(
          color: Theme.of(context).primaryColor,
          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 4,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.person,
                          size: 50,
                          color: Color(0xFF73BDBF),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "/userPosts", (Route<dynamic> route) => false,
                                  arguments: {
                                    "userId": widget.post.userId.toString(),
                                  });
                            },
                            child: AutoSizeText(widget.post.userId.toString(),
                                minFontSize: 8,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF73BDBF),
                                    decoration: TextDecoration.underline),
                                overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: AutoSizeText(
                          widget.post.title,
                          minFontSize: 5,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: AutoSizeText(
                          widget.post.body,
                          minFontSize: 8,
                          style: TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                    Column(
                      children: commentSection(),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
