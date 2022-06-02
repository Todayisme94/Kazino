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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAiG88Fok6fCDi2GAT2zm22r1vUrJBYWSE',
    appId: '1:725666963121:web:b87185152aa767de8d0c90',
    messagingSenderId: '725666963121',
    projectId: 'email-7d3ce',
    authDomain: 'email-7d3ce.firebaseapp.com',
    storageBucket: 'email-7d3ce.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5xsg6ZpFiMGveeUyljHkuRNsOKSKGt5E',
    appId: '1:725666963121:android:71fb0ac6ba624d638d0c90',
    messagingSenderId: '725666963121',
    projectId: 'email-7d3ce',
    storageBucket: 'email-7d3ce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXxyqEhK6Gx4NHGj3-L50GSGTPycaahBk',
    appId: '1:725666963121:ios:71aeefc3d8841bff8d0c90',
    messagingSenderId: '725666963121',
    projectId: 'email-7d3ce',
    storageBucket: 'email-7d3ce.appspot.com',
    iosClientId: '725666963121-l4u4f2klo9jdgp5rdnop43b39dqu4769.apps.googleusercontent.com',
    iosBundleId: 'com.example.email',
  );
}