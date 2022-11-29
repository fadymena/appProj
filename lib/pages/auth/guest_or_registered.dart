import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/connection.dart';
import 'package:flutter_application_2/pages/auth/signin_widget.dart';
import 'package:flutter_application_2/utils/my_consts.dart';

class GuestOrAuthPage extends StatefulWidget {
  const GuestOrAuthPage({super.key});

  @override
  State<GuestOrAuthPage> createState() => _GuestOrRecoPageState();
}

class _GuestOrRecoPageState extends State<GuestOrAuthPage> {
  Connection connection = Connection();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(MyConsts().mainPadding),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              "images/logo1.png",
              height: 80,
            ),
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              "images/chart_icon2_512.png",
              height: 250,
            ),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 70,
              child: Text(
                "Welcome to the new stocks predection method",
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: (() => connection.signInAnom()),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(MyConsts().roundEdgeButtonRadius),
                ),
                minimumSize: Size.fromHeight(MyConsts().maxButtonHight),
                backgroundColor: Colors.blue,
                maximumSize: Size.fromHeight(MyConsts().maxButtonHight),
              ),
              child: const Text(
                'Enter as a guest',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: (() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) {
                      return const Scaffold(body: SignInWidget());
                    }),
                  ),
                );
              }),
              child: const Text(
                'Sign in or create a new account',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//TODO: change logo for better contrast with background