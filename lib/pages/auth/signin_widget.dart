import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/connection.dart';
import 'package:flutter_application_2/pages/auth/signup_widget.dart';
import 'package:flutter_application_2/utils/my_consts.dart';

class SignInWidget extends StatefulWidget {
  //final VoidCallback onClickedSignup;
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final emailController = TextEditingController();
  final passwdController = TextEditingController();
  final Connection connection = Connection();
  //static const double maxButtonHight = 50;
  //static const double roundEdgeButtonRadius = 20;
  @override
  void dispose() {
    emailController.dispose();
    passwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(MyConsts().mainPadding),
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
            onPressed: () async {
              if (emailController.text.isNotEmpty &&
                  passwdController.text.isNotEmpty) {
                await connection.signIn(emailController.text.trim(),
                    passwdController.text.trim(), context);
              } else {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) {
                        return Scaffold(
                            body: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SignInWidget(),
                              Text(
                                'Email and/or password can\'t be empty',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: MyConsts().maxButtonHight / 3,
                                    color: Colors.red,
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black54, blurRadius: 3)
                                    ]),
                              ),
                            ],
                          ),
                        ));
                      }),
                    ),
                  );
                });
              }
              if (Connection.errFoundSignin != 0) {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) {
                        return Scaffold(
                            body: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SignInWidget(),
                              Text(
                                connection.errFoundSigninCode(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: MyConsts().maxButtonHight / 3,
                                    color: Colors.red,
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black54, blurRadius: 3)
                                    ]),
                              ),
                            ],
                          ),
                        ));
                      }),
                    ),
                  );
                });
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(MyConsts().maxButtonHight),
              backgroundColor: Colors.blue,
              maximumSize: Size.fromHeight(MyConsts().maxButtonHight),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(MyConsts().roundEdgeButtonRadius),
              ),
            ),
            icon: Icon(Icons.lock_open, size: MyConsts().maxButtonHight / 2),
            label: const Text(
              'Sign in',
              style: TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot your password or email?',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: MyConsts().maxButtonHight / 3),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          /*RichText(
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
            height: 24,
          ),*/
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return const Scaffold(body: SignUpWidget());
                  }),
                ),
              );
              //widget.onClickedSignup;
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(MyConsts().maxButtonHight),
              maximumSize: Size.fromHeight(MyConsts().maxButtonHight),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(MyConsts().roundEdgeButtonRadius),
              ),
            ),
            child: Text(
              'Create an account',
              style: TextStyle(fontSize: MyConsts().maxButtonHight / 2),
            ),
          ),
          /*const SizedBox(
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
              ]))*/
          const SizedBox(
            height: 15,
          ),
          Text(
            'Or procced with',
            style: TextStyle(
                fontSize: MyConsts().maxButtonHight / 3, color: Colors.white),
          ),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(MyConsts().maxButtonHight),
                maximumSize: Size.fromHeight(MyConsts().maxButtonHight),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(MyConsts().roundEdgeButtonRadius),
                ),
              ),
              child: Image.asset(
                '../images/google.png',
                height: MyConsts().maxButtonHight / 2,
              )),
        ],
      ),
    );
  }
}
//todo: add "forget passwd?"
//todo: add msg when account already present
//todo: add msg when passwd or email is wrong
//todo: remove print statments