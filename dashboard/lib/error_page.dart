import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  ErrorPage(FlutterErrorDetails errorDetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Text(
            tr("An error occurred. Our team was notified and will try to resolve it as quickly as possible"),
          ),
        ),
      ),
    );
  }
}
