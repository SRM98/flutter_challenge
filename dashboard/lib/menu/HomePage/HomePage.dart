import 'dart:convert';
import 'package:dashboard/menu/HomePage/PostCard.dart';
import 'package:dashboard/models/Post.dart';
import 'package:dashboard/services/PostsService.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/Menu/Drawer.dart';
import 'package:http/http.dart';
import 'package:flutter_web_pagination/flutter_web_pagination.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<String> _future;
  List<Post> postList = [];

  int _pageCounter = 1;

  @override
  void initState() {
    _future = getAllInfos();
    super.initState();
  }

  Future<String> getAllInfos() async {
    await getAllPosts();
    return "Done";
  }

  void getAllPosts() async {
    try {
      Response response = await getPosts();

      if (response.statusCode < 400) {
        List<dynamic> parsedJson = json.decode(response.body);
        parsedJson.forEach((post) {
          postList.add(Post.fromJson(post));
        });
      } else {
        print("getAllPosts error");
      }
    } catch (e) {
      print("getAllPosts error");
      print(e);
    }
  }

  List<Widget> showPagePosts() {
    List<Widget> list = [];
    for (int i = (_pageCounter - 1) * 20; i < (_pageCounter) * 20; i++) {
      if (i < postList.length) {
        list.add(PostCard(postList[i]));
      }
    }
    return list;
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
                          children: showPagePosts(),
                        ),
                      ),
                      Container(
                        height: 60,
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: WebPagination(
                            currentPage: _pageCounter,
                            totalPage: postList.length > 20 ? postList.length ~/ 20 + postList.length.remainder(20) : 1,
                            onPageChanged: (page) {
                              setState(() {
                                _pageCounter = page;
                              });
                            }),
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
