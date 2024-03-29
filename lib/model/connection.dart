import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/firebase_options.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_application_2/model/reg_user.dart';

import '../main.dart';

class Connection {
  static bool dbConnected = false;
  static Future<void> startConnection() async {
    try {
      //WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.web,
      );
      dbConnected = true;
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

  static Future<bool> isInternetConnected() async {
    var result = await Connectivity()
        .checkConnectivity()
        .timeout(const Duration(seconds: 3));
    if (result == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  static bool isDbConnected() {
    return dbConnected;
  }

  void signOut() {
    if (FirebaseAuth.instance.currentUser!.isAnonymous) {
      FirebaseAuth.instance.currentUser!.delete();
    }
    FirebaseAuth.instance.signOut();
  }

  static bool isAnonymous() {
    if (FirebaseAuth.instance.currentUser!.isAnonymous) {
      return true;
    } else {
      return false;
    }
  }

  static int errFoundSignin = 0;
  Future signIn(String email, String pass, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    errFoundSignin = 0;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      await getUserInfoByEmail(email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        errFoundSignin = 1;
      } else if (e.code == 'user-disabled') {
        errFoundSignin = 2;
      } else if (e.code == 'user-not-found') {
        errFoundSignin = 3;
      } else if (e.code == 'wrong-password') {
        errFoundSignin = 4;
      } else {
        errFoundSignin = 5;
      }
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  String errFoundSigninCode() {
    List<String> errList = [
      'Please use a valide email and/or password',
      'Operation not allowed\nUser is disabled\nTo reactivate this account contact us',
      'Email not found, try to create a new account',
    ];
    switch (errFoundSignup) {
      case 2:
        return errList[1];
      case 3:
        return errList[2];
      default:
        return errList[0];
    }
  }

  Future signInAnom() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
      RegUser('guestName', 'guestSurname', 'guest@guest.com', 'guestID', false);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }

  static int errFoundSignup = 0;
  Future signUp(String email, String pass, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    errFoundSignup = 0;
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        errFoundSignup = 1;
      } else if (e.code == 'email-already-in-use') {
        errFoundSignup = 2;
      } else if (e.code == 'operation-not-allowed') {
        errFoundSignup = 3;
      } else if (e.code == 'weak-password') {
        errFoundSignup = 4;
      } else if (e.code == 'internal-error') {
        errFoundSignup = 5;
      } else {
        errFoundSignup = 6;
      }
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  String errFoundSignupCode() {
    List<String> errList = [
      'Use a valide email and/or password',
      'Email already in use, try to sign in',
      'Operation not allowed, please contact us with this issue',
      'Weak password, try a password with at least 6 characters',
      'Try to use a valid email and password\nIf this problem continue to happen contact us'
    ];
    switch (errFoundSignup) {
      case 1:
        return errList[0];
      case 2:
        return errList[1];
      case 3:
        return errList[2];
      case 4:
        return errList[3];
      default:
        return errList[4];
    }
  }

  String getUserEmail() {
    try {
      return FirebaseAuth.instance.currentUser!.email.toString();
    } catch (e) {
      return 'guest@guest.com';
    }
  }

  getUserInfoByEmail(String email) async {
    var db = FirebaseFirestore.instance;
    await db
        .collection('UsersData')
        .where('email', isEqualTo: email)
        .get()
        .then(
      (value) {
        if (value.docs.isNotEmpty) {
          //user = RegUser.getUserFromDbDocs(value.docs[0].data());
          String name = value.docs[0].data()['name'];
          String surname = value.docs[0].data()['surname'];
          String email = value.docs[0].data()['email'];
          String id = value.docs[0].data()['id'];
          RegUser(name, surname, email, id, true);
        }
      },
    );
  }
}

//todo: add recover pass method
//todo: add transform guest to normal account
//todo: remove print statments
