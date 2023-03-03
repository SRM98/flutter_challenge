import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/models/Post.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  PostCard(this.post);

  final Post post;

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  void initState() {
    super.initState();
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
                          widget.post.body.toString(),
                          minFontSize: 8,
                          style: TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "/comments", (Route<dynamic> route) => false,
                                arguments: {
                                  "post": widget.post,
                                });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 6,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color(0xFF73BDBF),
                            ),
                            child: Text(
                              'see comments',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
