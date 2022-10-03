import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/pages/signup_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginPage(onClickedSignup: toggle)
        : SignUpWidget(onClickedSignin: toggle);
  }

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
