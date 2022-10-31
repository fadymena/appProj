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
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: const [
              Icon(
                Icons.person_add,
                size: 30,
              ),
              SizedBox(
                width: 10,
                height: 10,
              ),
              Text(
                'Add profile',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const Divider(
          color: Colors.black26,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: const [
              Icon(
                Icons.person_remove,
                size: 30,
              ),
              SizedBox(
                width: 10,
                height: 10,
              ),
              Text(
                'Remove profile',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const Divider(
          color: Colors.black26,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: const [
              Icon(
                Icons.settings,
                size: 30,
              ),
              SizedBox(
                width: 10,
                height: 10,
              ),
              Text(
                'App setting',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const Divider(
          color: Colors.black26,
        ),
        GestureDetector(
          onTap: () {
            connection.signOut();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: const [
                Icon(
                  Icons.output,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  'Sign out',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
