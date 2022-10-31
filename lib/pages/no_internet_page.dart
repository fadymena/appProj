import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/auth/signin_widget.dart';

//TODO: to be made from scratch
class NoInternetPage extends StatefulWidget {
  const NoInternetPage({super.key});

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  bool isOnline = false;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return isOnline
        ? const Scaffold(
            body: SignInWidget(),
          )
        : Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: const Size.fromWidth(350).width,
                      child: Image.asset('images/logo1.png'),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Opps !!!',
                      style: TextStyle(fontSize: 28, color: Colors.red),
                    ),
                    const Divider(
                      height: 20,
                    ),
                    const Text(
                      'No Internet Connection Found!',
                      style: TextStyle(fontSize: 26),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                        onPressed: () async {
                          setState(() {
                            count++;
                          });
                          var result = await Connectivity().checkConnectivity();
                          if (result != ConnectivityResult.none) {
                            setState(() {
                              isOnline = true;
                            });
                          }
                        },
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text('Refresh')),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      (count >= 2) ? 'Stile offline!' : '',
                      style: const TextStyle(
                          color: Colors.redAccent, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      (count >= 2)
                          ? 'Exit the program, connect to internet then restart the program'
                          : '',
                      style: const TextStyle(
                          fontSize: 16, color: Colors.greenAccent),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
