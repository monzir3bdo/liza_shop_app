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
    apiKey: 'AIzaSyAqxbMANqngpeJTzJXfqxiGtsfhERJ-XNI',
    appId: '1:515356024244:web:a205ebf5d369253dff26e1',
    messagingSenderId: '515356024244',
    projectId: 'liza-e1eaf',
    authDomain: 'liza-e1eaf.firebaseapp.com',
    storageBucket: 'liza-e1eaf.appspot.com',
    measurementId: 'G-DKBGGBYP7K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgaHz4ReQdoE04vDQbeWgAnFTp6mH5ejA',
    appId: '1:515356024244:android:e147e5c93b9df5baff26e1',
    messagingSenderId: '515356024244',
    projectId: 'liza-e1eaf',
    storageBucket: 'liza-e1eaf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARSv722j8pG6Km4o9zPRRGzcoJFTDR04A',
    appId: '1:515356024244:ios:5f5f544094ca1572ff26e1',
    messagingSenderId: '515356024244',
    projectId: 'liza-e1eaf',
    storageBucket: 'liza-e1eaf.appspot.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyARSv722j8pG6Km4o9zPRRGzcoJFTDR04A',
    appId: '1:515356024244:ios:963b745026cffa35ff26e1',
    messagingSenderId: '515356024244',
    projectId: 'liza-e1eaf',
    storageBucket: 'liza-e1eaf.appspot.com',
    iosBundleId: 'com.example.ecommerce.RunnerTests',
  );
}