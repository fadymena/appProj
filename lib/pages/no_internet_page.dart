import 'package:flutter/material.dart';

//TODO: https://www.desuvit.com/how-to-implement-no-internet-offline-notification-page-in-flutter/

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Container(
                padding: const EdgeInsets.all(10),
                width: const Size.fromWidth(300).width,
                child: Image.asset('images/logo1.png'),
              ),
              const SizedBox(height: 80),
              const Text(
                'Oh no!!!',
                style: TextStyle(fontSize: 35, color: Colors.black54),
              ),
              const SizedBox(
                height: 20,
              ),
              Icon(
                Icons.wifi_tethering_error_rounded_rounded,
                size: MediaQuery.of(context).size.width * 0.45,
              ),
              const SizedBox(
                height: 0,
              ),
              const Text(
                'No internet connection found!',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
