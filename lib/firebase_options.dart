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
    apiKey: 'AIzaSyAHWgfydbsSz0k1IZyTJXiT0QWnuygO-zY',
    appId: '1:484549771547:web:699eded9d7dd8baf9253be',
    messagingSenderId: '484549771547',
    projectId: 'l-mobilesales-mini',
    authDomain: 'l-mobilesales-mini.firebaseapp.com',
    storageBucket: 'l-mobilesales-mini.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWFb_Zy2NEfXzqJTBJ_z-BXWCRV_y4SX4',
    appId: '1:484549771547:android:b08eedb288ce47219253be',
    messagingSenderId: '484549771547',
    projectId: 'l-mobilesales-mini',
    storageBucket: 'l-mobilesales-mini.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCP14ZagVnYY4HbE2RSBpj5n0TjVh3idD8',
    appId: '1:484549771547:ios:7c5c7a20b7a72ace9253be',
    messagingSenderId: '484549771547',
    projectId: 'l-mobilesales-mini',
    storageBucket: 'l-mobilesales-mini.firebasestorage.app',
    iosBundleId: 'com.example.lMobilesalesMini',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCP14ZagVnYY4HbE2RSBpj5n0TjVh3idD8',
    appId: '1:484549771547:ios:7c5c7a20b7a72ace9253be',
    messagingSenderId: '484549771547',
    projectId: 'l-mobilesales-mini',
    storageBucket: 'l-mobilesales-mini.firebasestorage.app',
    iosBundleId: 'com.example.lMobilesalesMini',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAHWgfydbsSz0k1IZyTJXiT0QWnuygO-zY',
    appId: '1:484549771547:web:ab8a531e3c74aaee9253be',
    messagingSenderId: '484549771547',
    projectId: 'l-mobilesales-mini',
    authDomain: 'l-mobilesales-mini.firebaseapp.com',
    storageBucket: 'l-mobilesales-mini.firebasestorage.app',
  );
}
