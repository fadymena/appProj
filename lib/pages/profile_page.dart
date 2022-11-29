import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/connection.dart';
import 'package:flutter_application_2/model/reg_user.dart';
import 'package:flutter_application_2/pages/auth/signin_widget.dart';

int itemCount = 20;

class ProfilePage extends StatelessWidget {
  final Connection connection = Connection();
  final bool anom = Connection.isAnonymous();
  static final RegUser user = RegUser.getIstance;
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Text(user.name),
        // Text(user.surname),
        // Text(user.email),
        // buildDivider(),
        const SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            anom
                ? GestureDetector(
                    child: buildCard(Icons.person, 'Login or Signin', context),
                    onTap: () => changeToSignin(context),
                  )
                : buildCard(Icons.person,
                    '${RegUser.getMyName}, ${RegUser.getMySurname}', context),
            buildCard(Icons.settings, 'Setting', context),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        buildTile(Icons.watch_later_rounded, 'Manage watchlist'),
        buildDivider(),
        buildTile(Icons.settings, 'App setting'),
        buildDivider(),
        GestureDetector(
            onTap: () {
              connection.signOut();
            },
            child: buildTile(Icons.output, 'Sign out')),
      ],
    );
  }

  Widget buildTile(IconData icon, String name) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          const SizedBox(
            width: 10,
            height: 10,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildCard(IconData icon, String name, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      height: (MediaQuery.of(context).size.width * 0.45) * 0.6,
      child: Card(
        margin: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: 30,
              ),
              Text(
                name,
                style: TextStyle(color: Colors.blue.shade100),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDivider() {
    return const Divider(
      color: Colors.black26,
    );
  }

  void changeToSignin(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) {
          return const Scaffold(
            body: SignInWidget(),
          );
        }),
      ),
    );
  }
}
