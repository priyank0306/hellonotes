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
    apiKey: 'AIzaSyCY9BtY0orBzw1t7zr2-f-8DfdEtEDjgiM',
    appId: '1:707149717725:web:3602382d5a59a62841bb34',
    messagingSenderId: '707149717725',
    projectId: 'hellonotesmyfirstproject',
    authDomain: 'hellonotesmyfirstproject.firebaseapp.com',
    storageBucket: 'hellonotesmyfirstproject.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7vQ1bNgD7lwNU6ZuD3GxpHH_ZEmtHjKc',
    appId: '1:707149717725:android:cd6f4f7032cc3be241bb34',
    messagingSenderId: '707149717725',
    projectId: 'hellonotesmyfirstproject',
    storageBucket: 'hellonotesmyfirstproject.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVD6J6WxE4m3PkVvhctpiYMpFYawtU9rE',
    appId: '1:707149717725:ios:9745edb4ab99c99e41bb34',
    messagingSenderId: '707149717725',
    projectId: 'hellonotesmyfirstproject',
    storageBucket: 'hellonotesmyfirstproject.appspot.com',
    iosClientId: '707149717725-f95d2k884in7lokj32haemc8o3m95290.apps.googleusercontent.com',
    iosBundleId: 'com.mehtapriyankjaipur.hellonotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBVD6J6WxE4m3PkVvhctpiYMpFYawtU9rE',
    appId: '1:707149717725:ios:9745edb4ab99c99e41bb34',
    messagingSenderId: '707149717725',
    projectId: 'hellonotesmyfirstproject',
    storageBucket: 'hellonotesmyfirstproject.appspot.com',
    iosClientId: '707149717725-f95d2k884in7lokj32haemc8o3m95290.apps.googleusercontent.com',
    iosBundleId: 'com.mehtapriyankjaipur.hellonotes',
  );
}
