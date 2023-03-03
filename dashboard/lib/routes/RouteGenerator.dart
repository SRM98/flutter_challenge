import 'package:dashboard/menu/HomePage/CommentsPostsPage.dart';
import 'package:dashboard/menu/HomePage/UserPostsPage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/auth/SignInWidget.dart';
import 'package:dashboard/auth/SignInPage.dart';
import 'package:dashboard/menu/HomePage/HomePage.dart';

class RouteGenerator {

  static PageRoute _getPageRoute(Widget child, String route) {
    return _FadeRoute(child: child, routeName: route);
  }


  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed

    var args = settings.arguments as Map;

    var uriData = Uri.parse(settings.name);
    Map<String, dynamic> queryParams = uriData.queryParameters;
    String currentRoute = uriData.path;


    switch (currentRoute) {
      case '/signIn':
        return _getPageRoute(SignInPage(), currentRoute);

      case '/dashboard':
        return _getPageRoute(HomePage(), currentRoute);

      case '/userPosts':
        return _getPageRoute(UserPostsPage(args["userId"]), currentRoute);

      case '/comments':
        return _getPageRoute(CommentsPostsPage(args["post"]), currentRoute);

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(45.0),
            child: AppBar(
              backgroundColor: Colors.white,
              title: Text(tr('Error')),
            )),
        body: Center(
          child: Text(tr('Error')),
        ),
      );
    });
  }
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
