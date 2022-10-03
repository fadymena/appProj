import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/connection.dart';

//import '../module/connection.dart.any';

class LearnFlutter extends StatefulWidget {
  const LearnFlutter({super.key});

  @override
  State<LearnFlutter> createState() => _LearnFlutterState();
}

class _LearnFlutterState extends State<LearnFlutter> {
  bool isSwitch = false;
  bool hidePic = false;
  int age = 22;
  String name = 'adel';
  final controller = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  final Connection connection = Connection();
  //final databaseReference = FirebaseFirestore.instance;
  /*void addRecord() async {
    await databaseReference.collection('users').add({'age': age, 'name': name});
  }

  void getData() {
    databaseReference
        .collection('users')
        .where('age', isEqualTo: 27)
        .get()
        .then(
      (QuerySnapshot snapshot) {
        if (snapshot.size == 0) {
          debugPrint('No enteries found!!!');
        } else {
          debugPrint('entry/ies found and deleted:');
          for (var element in snapshot.docs) {
            debugPrint('${element.data()}');
            databaseReference.collection('users').doc(element.id).delete();
          }
        }
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 12 + 4,
        title: const Text(
          'learn flutter',
          style: TextStyle(fontSize: 12),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('actions1');
            },
            icon: const Icon(Icons.abc),
          ),
          IconButton(
              onPressed: () {
                debugPrint('actions2');
              },
              icon: const Icon(Icons.ac_unit))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                debugPrint('online pic');
                setState(() {
                  hidePic == true ? hidePic = false : hidePic = true;
                });
              },
              child: hidePic
                  ? Image.network(
                      'https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png')
                  : const Icon(Icons.face_retouching_off),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              color: Colors.blueGrey,
              child: const Center(
                child: Text(
                  'this is a text widget',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSwitch ? Colors.blue : Colors.green,
              ),
              onPressed: () {
                debugPrint('Elevated');
              },
              child: const Text('elevated button'),
            ),
            ElevatedButton(
              onPressed: () {
                //addRecord();
                age++;
                name = name + age.toString();
              },
              child: const Text('add new record'),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint(user.uid);
              },
              child: const Text('get records'),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint('out');
              },
              child: const Text('elevated button'),
            ),
            TextButton(
              onPressed: () {
                debugPrint('text');
              },
              child: const Text('elevated button'),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                debugPrint('row');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.amber,
                  ),
                  Text('my new text'),
                  Icon(Icons.local_fire_department_rounded)
                ],
              ),
            ),
            Switch(
                value: isSwitch,
                onChanged: (bool newBool) {
                  /*Connection connection = Connection();
                  if (!connection.isConnected()) {
                    connection.connect();
                    debugPrint('new connection is made');
                  } else {
                    debugPrint('data base already connected');
                  }*/
                  setState(() {
                    isSwitch = newBool;
                  });
                }),
            //LineChartWidget(pricePoints),
            const Divider(
              height: 2,
              thickness: 2,
            ),
            TextField(
              controller: controller,
            ),
            ElevatedButton(
                onPressed: () {
                  debugPrint(controller.text);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.badge_outlined),
                    Text('add person'),
                  ],
                )),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () => connection.signOut(),
              icon: const Icon(
                Icons.arrow_back,
                size: 32,
              ),
              label: const Text(
                'Sign Out',
                style: TextStyle(fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
