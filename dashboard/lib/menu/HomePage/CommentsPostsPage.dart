import 'dart:convert';
import 'package:dashboard/menu/HomePage/CommentCard.dart';
import 'package:dashboard/menu/HomePage/PostCard.dart';
import 'package:dashboard/models/Comment.dart';
import 'package:dashboard/models/Post.dart';
import 'package:dashboard/services/PostsService.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/Menu/Drawer.dart';
import 'package:http/http.dart';
import 'package:flutter_web_pagination/flutter_web_pagination.dart';

class CommentsPostsPage extends StatefulWidget {
  CommentsPostsPage(this.post);

  final Post post;

  @override
  _CommentsPostsPageState createState() => _CommentsPostsPageState();
}

class _CommentsPostsPageState extends State<CommentsPostsPage> {
  Future<String> _future;
  List<Comment> commentList = [];

  @override
  void initState() {
    _future = getAllInfos();
    super.initState();
  }

  Future<String> getAllInfos() async {
    await getAllComments();
    return "Done";
  }

  void getAllComments() async {
    try {
      Response response = await getCommentsByPostId(widget.post.id.toString());

      if (response.statusCode < 400) {
        List<dynamic> parsedJson = json.decode(response.body);
        parsedJson.forEach((comment) {
          commentList.add(Comment.fromJson(comment));
        });
      } else {
        print("getAllComments error");
      }
    } catch (e) {
      print("getAllComments error");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushNamedAndRemoveUntil(
            "/dashboard",
                (Route<dynamic> route) => false,
          );
          return false;
        },
        child: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: AppBar(
                      iconTheme: IconThemeData(color: Colors.black, size: 35),
                      actions: <Widget>[],
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      elevation: 0.0,
                      centerTitle: true,
                    ),
                  ),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  drawer: CustomDrawer("/dashboard"),
                  onDrawerChanged: (opened) {},
                  body: Column(
                    children: [
                      Flexible(
                        child: ListView(
                          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 4.5, 10, MediaQuery.of(context).size.width / 4.5, 10),
                          children: [CommentCard(widget.post, commentList)],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Scaffold(
                  body: Center(
                      child: CircularProgressIndicator(
                        valueColor:
                        new AlwaysStoppedAnimation<Color>(Color(0xFF73BDBF)),
                      )),
                );
              }
            }));
  }
}
