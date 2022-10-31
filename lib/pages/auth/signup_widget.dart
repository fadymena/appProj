import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/connection.dart';
import 'package:flutter_application_2/pages/auth/signin_widget.dart';
import 'package:flutter_application_2/utils/my_consts.dart';

//TODO: to be cleaned up
//TODO: https://googleflutter.com/flutter-alertdialog/
class SignUpWidget extends StatefulWidget {
  //final VoidCallback onClickedSignin;
  const SignUpWidget({Key? key}) : super(key: key);
  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final emailController = TextEditingController();
  final passwdController = TextEditingController();
  final passwdRepController = TextEditingController();
  final Connection connection = Connection();
  String res = 'err found';
  bool isRes = false;

  @override
  void dispose() {
    emailController.dispose();
    passwdController.dispose();
    passwdRepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 30),
          //app logo
          Container(
            padding: const EdgeInsets.all(10),
            width: const Size.fromWidth(350).width,
            child: Image.asset('images/logo1.png'),
          ),
          const SizedBox(height: 40),
          //email field
          TextField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(label: Text('email')),
          ),
          const SizedBox(height: 4),
          //password field 1
          TextField(
            controller: passwdController,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(label: Text('password')),
            obscureText: true,
          ),
          const SizedBox(height: 4),
          //password field 2
          TextField(
            controller: passwdRepController,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(label: Text('repeate password')),
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          //sign-up button
          ElevatedButton.icon(
            onPressed: () async {
              if (passwdController.text == passwdRepController.text &&
                  passwdController.text != '') {
                //passwdCheckPassed = true;
                await connection.signUp(emailController.text.trim(),
                    passwdController.text.trim(), context);
              }
              if (passwdController.text != passwdRepController.text ||
                  passwdController.text.isEmpty ||
                  emailController.text.isEmpty) {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) {
                        return Scaffold(
                            body: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SignUpWidget(),
                              Text(
                                'Password and/or email is not valid',
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
              } else if (Connection.errFoundSignup != 0) {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) {
                        return Scaffold(
                            body: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SignUpWidget(),
                              Text(
                                connection.errFoundSignupCode(),
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
              'Sign Up',
              style: TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //goto sign-in-page button
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return const Scaffold(body: SignInWidget());
                  }),
                ),
              );
              //widget.onClickedSignin;
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
              'Use my account',
              style: TextStyle(fontSize: MyConsts().maxButtonHight / 2),
            ),
          ),
        ],
      ),
    );
  }
}
