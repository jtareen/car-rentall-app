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
    apiKey: 'AIzaSyDX-RVDoD7YCgE6C2XpBgfk3EQgiIsuCBQ',
    appId: '1:764454854691:web:a4d10ccc472be2ca8d5196',
    messagingSenderId: '764454854691',
    projectId: 'mycarrentalproject',
    authDomain: 'mycarrentalproject.firebaseapp.com',
    storageBucket: 'mycarrentalproject.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJPfFxPdkfIhXyGxXbtCEE1EPAQtRK8VE',
    appId: '1:764454854691:android:8f8a3e7e5675e1d08d5196',
    messagingSenderId: '764454854691',
    projectId: 'mycarrentalproject',
    storageBucket: 'mycarrentalproject.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9N87-6Ozvvhc8Y6b7EycBh0lksBAkWqs',
    appId: '1:764454854691:ios:049ad73464979d4b8d5196',
    messagingSenderId: '764454854691',
    projectId: 'mycarrentalproject',
    storageBucket: 'mycarrentalproject.firebasestorage.app',
    iosBundleId: 'com.example.carRenrApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA9N87-6Ozvvhc8Y6b7EycBh0lksBAkWqs',
    appId: '1:764454854691:ios:049ad73464979d4b8d5196',
    messagingSenderId: '764454854691',
    projectId: 'mycarrentalproject',
    storageBucket: 'mycarrentalproject.firebasestorage.app',
    iosBundleId: 'com.example.carRenrApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDX-RVDoD7YCgE6C2XpBgfk3EQgiIsuCBQ',
    appId: '1:764454854691:web:d16165e91878098f8d5196',
    messagingSenderId: '764454854691',
    projectId: 'mycarrentalproject',
    authDomain: 'mycarrentalproject.firebaseapp.com',
    storageBucket: 'mycarrentalproject.firebasestorage.app',
  );
}