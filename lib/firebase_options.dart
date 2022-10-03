// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBiotxbwh8E2dWevEvFbcSToWlX5HQLpfw',
    appId: '1:317136481468:web:db180d48878f05372e34b9',
    messagingSenderId: '317136481468',
    projectId: 'our-proj-test-2-b8479',
    authDomain: 'our-proj-test-2-b8479.firebaseapp.com',
    storageBucket: 'our-proj-test-2-b8479.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCH3jtcmKHzZT17AoSzREAXqCaLN-Mh_yM',
    appId: '1:317136481468:android:c2774f33f7f8656c2e34b9',
    messagingSenderId: '317136481468',
    projectId: 'our-proj-test-2-b8479',
    storageBucket: 'our-proj-test-2-b8479.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBm_f8Q_HUCUDN3PtynO-RHXpdvJfUHnIM',
    appId: '1:317136481468:ios:13d56f122dec11a82e34b9',
    messagingSenderId: '317136481468',
    projectId: 'our-proj-test-2-b8479',
    storageBucket: 'our-proj-test-2-b8479.appspot.com',
    iosClientId: '317136481468-kcrpjk4t0rs6ibg0cr00vsbkgji183uq.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBm_f8Q_HUCUDN3PtynO-RHXpdvJfUHnIM',
    appId: '1:317136481468:ios:13d56f122dec11a82e34b9',
    messagingSenderId: '317136481468',
    projectId: 'our-proj-test-2-b8479',
    storageBucket: 'our-proj-test-2-b8479.appspot.com',
    iosClientId: '317136481468-kcrpjk4t0rs6ibg0cr00vsbkgji183uq.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication2',
  );
}