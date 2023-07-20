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
    apiKey: 'AIzaSyDusv11SdhBYMjIZ2W2nOOwFWJQ8SS4wjc',
    appId: '1:617811517932:web:7556130a0c5b61fcda60c9',
    messagingSenderId: '617811517932',
    projectId: 'delivery-order-387711',
    authDomain: 'delivery-order-387711.firebaseapp.com',
    databaseURL: 'https://delivery-order-387711-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'delivery-order-387711.appspot.com',
    measurementId: 'G-MB1WJ5495T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0-oZzX906-yYgsi0a2EUAdHPjUnDAEvw',
    appId: '1:617811517932:android:86bd615ba63c0e7cda60c9',
    messagingSenderId: '617811517932',
    projectId: 'delivery-order-387711',
    databaseURL: 'https://delivery-order-387711-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'delivery-order-387711.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvqa1fGki8USU7lgjH-iiMgdoF9G4QkLE',
    appId: '1:617811517932:ios:5c4016aeeb8d8c64da60c9',
    messagingSenderId: '617811517932',
    projectId: 'delivery-order-387711',
    databaseURL: 'https://delivery-order-387711-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'delivery-order-387711.appspot.com',
    iosClientId: '617811517932-5frgnfhabre214tgiajdeu6h7tgc7tfn.apps.googleusercontent.com',
    iosBundleId: 'com.example.deliveryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvqa1fGki8USU7lgjH-iiMgdoF9G4QkLE',
    appId: '1:617811517932:ios:5c4016aeeb8d8c64da60c9',
    messagingSenderId: '617811517932',
    projectId: 'delivery-order-387711',
    databaseURL: 'https://delivery-order-387711-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'delivery-order-387711.appspot.com',
    iosClientId: '617811517932-5frgnfhabre214tgiajdeu6h7tgc7tfn.apps.googleusercontent.com',
    iosBundleId: 'com.example.deliveryApp',
  );
}
