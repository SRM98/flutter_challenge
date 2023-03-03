import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class SignIn extends StatefulWidget {
  SignIn();

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = new TextEditingController();
  bool emailValid = true;
  String emailErrorText = "";

  TextEditingController passwordController = new TextEditingController();
  bool passwordValid = true;
  String passwordErrorText = "";
  bool _waiting = false;

  @override
  initState() {
    super.initState();
  }

  Widget emailEntryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        cursorColor: Colors.grey,
          onChanged: (value) {
            setState(() {
              emailValid = true;
            });
          },
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          autofillHints: [AutofillHints.email],
          obscureText: isPassword,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
              ),
              labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
              hoverColor: Colors.white,
              fillColor: Colors.white,
              labelText: title,
              filled: true,
              errorText: emailValid ? null : emailErrorText)),
    );
  }

  Widget passwordEntryField(String title, {bool isPassword = true}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
          cursorColor: Colors.grey,
          onChanged: (value) {
            setState(() {
              passwordValid = true;
            });
          },
          controller: passwordController,
          autofillHints: [AutofillHints.password],
          obscureText: isPassword,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
              ),
              labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
              hoverColor: Colors.white,
              fillColor: Colors.white,
              labelText: title,
              filled: true,
              errorText: passwordValid ? null : passwordErrorText)),
    );
  }

  Widget _signInButton() {
    return InkWell(
      onTap: () {
        SignIn(emailController.text, passwordController.text);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xFF73BDBF),
        ),
        child: Text(
          tr('Login'),
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        emailEntryField(tr("Email")),
        passwordEntryField(tr("Password")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ProgressHUD(
            child: _buildWidget(context), barrierEnabled: _waiting));
  }

  Widget _buildWidget(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Column(
            children: [
              Container(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _emailPasswordWidget(),
                      SizedBox(
                        height: 30,
                      ),
                      _signInButton(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  initValidation() {
    setState(() {
      this.passwordValid = true;
      this.emailValid = true;
      this.passwordErrorText = null;
      this.emailErrorText = null;
    });
  }

  bool validateEmail(String email) {
    setState(() {
      this.emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      this.emailErrorText = tr("Not in a valid format!");
    });

    return this.emailValid;
  }

  bool validatePassword(String password) {
    if (password == null || password == "") {
      setState(() {
        this.passwordValid = false;
        this.passwordErrorText = tr("Enter your password!");
      });
    }

    return this.passwordValid;
  }


  SignIn(String email, String password) async {
    initValidation();

    if (!validateEmail(email) || !validatePassword(password)) {
      return;
    }

    Navigator.of(context).pushNamedAndRemoveUntil(
      "/dashboard",
      (Route<dynamic> route) => false,
    );
  }
}
