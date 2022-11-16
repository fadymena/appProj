import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/connection.dart';

int itemCount = 20;

class ProfilePage extends StatelessWidget {
  final Connection connection = Connection();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            buildCard(Icons.person, 'Login or Signin', context),
            buildCard(Icons.settings, 'Setting', context),
          ],
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
      height: (MediaQuery.of(context).size.width * 0.4) * 0.5,
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
}
