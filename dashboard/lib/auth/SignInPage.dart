import 'package:flutter/material.dart';
import 'package:dashboard/auth/SignInWidget.dart';
import 'package:dashboard/utils/logo.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar:
            PreferredSize(preferredSize: Size.fromHeight(0.0), child: AppBar(elevation: 0,)),
        body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color(0xFF73BDBF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  logo(),
                  SizedBox(height: 30),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: SignIn(),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }


}
