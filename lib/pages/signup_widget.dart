import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/connection.dart';

class SignUpWidget extends StatefulWidget {
  final VoidCallback onClickedSignin;
  const SignUpWidget({Key? key, required this.onClickedSignin})
      : super(key: key);
  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
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
            onPressed: () => connection.signUp(emailController.text.trim(),
                passwdController.text.trim(), context),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50)),
            icon: const Icon(Icons.lock_open, size: 32),
            label: const Text(
              'Sign Up',
              style: TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  text: 'Already have an account? ',
                  children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignin,
                    text: 'Log in',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.primary))
              ])),
        ],
      ),
    );
  }
}
