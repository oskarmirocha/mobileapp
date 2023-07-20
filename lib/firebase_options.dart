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
    apiKey: 'AIzaSyBmRU68QoEybErSvG-uw8FdlIMK8vTzuPc',
    appId: '1:912237636720:web:a15af5d09db9629b1598b5',
    messagingSenderId: '912237636720',
    projectId: 'mobileapp-f8817',
    authDomain: 'mobileapp-f8817.firebaseapp.com',
    storageBucket: 'mobileapp-f8817.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRYRUBphU47lEj7LvwMOJjNq4hAxyw17Y',
    appId: '1:912237636720:android:6206d90511657a061598b5',
    messagingSenderId: '912237636720',
    projectId: 'mobileapp-f8817',
    storageBucket: 'mobileapp-f8817.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrMH4ZQdRwAOzdxSl6Fh32xTrq6N2GQyc',
    appId: '1:912237636720:ios:8c82eaa814ccf7ed1598b5',
    messagingSenderId: '912237636720',
    projectId: 'mobileapp-f8817',
    storageBucket: 'mobileapp-f8817.appspot.com',
    iosClientId: '912237636720-anv774r0mp1dujsh5t2rebpgkv0jng0s.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBrMH4ZQdRwAOzdxSl6Fh32xTrq6N2GQyc',
    appId: '1:912237636720:ios:8c82eaa814ccf7ed1598b5',
    messagingSenderId: '912237636720',
    projectId: 'mobileapp-f8817',
    storageBucket: 'mobileapp-f8817.appspot.com',
    iosClientId: '912237636720-anv774r0mp1dujsh5t2rebpgkv0jng0s.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileapp',
  );
}
