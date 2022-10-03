import 'package:flutter/material.dart';

int itemCount = 20;

class ProfilePageTest extends StatelessWidget {
  const ProfilePageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: ListView(
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
        ],
      ),
    );
  }
}
