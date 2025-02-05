// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAVwKhPuv7RjIMuCU7WmEQ2kVVkyVpi_lw',
    appId: '1:326190406074:web:22e7a5e59606b8fd45e583',
    messagingSenderId: '326190406074',
    projectId: 'crud-c691b',
    authDomain: 'crud-c691b.firebaseapp.com',
    databaseURL: 'https://crud-c691b-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'crud-c691b.appspot.com',
    measurementId: 'G-9F4GMC8829',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIPJos3Z4AEbzrA8O3IfbX4reGZ5Vh4uQ',
    appId: '1:326190406074:android:aeac9d17f81e554e45e583',
    messagingSenderId: '326190406074',
    projectId: 'crud-c691b',
    databaseURL: 'https://crud-c691b-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'crud-c691b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwZo1iOVPQtDrVMafy9yGTEl_qa5hIAmM',
    appId: '1:326190406074:ios:5c3d65004e1121bb45e583',
    messagingSenderId: '326190406074',
    projectId: 'crud-c691b',
    databaseURL: 'https://crud-c691b-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'crud-c691b.appspot.com',
    iosBundleId: 'com.example.ats',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwZo1iOVPQtDrVMafy9yGTEl_qa5hIAmM',
    appId: '1:326190406074:ios:5c3d65004e1121bb45e583',
    messagingSenderId: '326190406074',
    projectId: 'crud-c691b',
    databaseURL: 'https://crud-c691b-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'crud-c691b.appspot.com',
    iosBundleId: 'com.example.ats',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAVwKhPuv7RjIMuCU7WmEQ2kVVkyVpi_lw',
    appId: '1:326190406074:web:f79504f7c41fa55645e583',
    messagingSenderId: '326190406074',
    projectId: 'crud-c691b',
    authDomain: 'crud-c691b.firebaseapp.com',
    databaseURL: 'https://crud-c691b-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'crud-c691b.appspot.com',
    measurementId: 'G-TWNPWPT8BX',
  );

}