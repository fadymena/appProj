import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/connection.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignup;
  const LoginPage({Key? key, required this.onClickedSignup}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwdController = TextEditingController();
  final Connection connection = Connection();

  @override
  void dispose() {
    emailController.dispose();
    passwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(10),
            width: const Size.fromWidth(350).width,
            child: Image.asset('images/logo1.png'),
          ),
          const SizedBox(height: 40),
          TextField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(label: Text('email')),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: passwdController,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(label: Text('password')),
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: () => connection.signIn(emailController.text.trim(),
                passwdController.text.trim(), context),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: Colors.green,
              maximumSize: const Size.fromHeight(50),
            ),
            icon: const Icon(Icons.lock_open, size: 32),
            label: const Text(
              'Sign In',
              style: TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  text: 'No account?   ',
                  children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignup,
                    text: 'Sign Up',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.primary))
              ])),
          const SizedBox(
            height: 5,
          ),
          RichText(
              text: const TextSpan(
            style: TextStyle(color: Colors.white, fontSize: 16),
            text: 'OR',
          )),
          const SizedBox(
            height: 5,
          ),
          RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  text: 'Sign In as a ',
                  children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => connection.signInAnom(),
                    text: 'Guest',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.primary))
              ]))
        ],
      ),
    );
  }
}
//todo: add "forget passwd?"
//todo: add msg when account already present
//todo: add msg when passwd or email is wrong
//todo: remove print statments