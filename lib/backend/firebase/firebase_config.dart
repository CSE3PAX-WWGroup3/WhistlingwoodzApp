import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCnWnJK3nOU6Vd5vjOF123eIryQf4o2QqI",
            authDomain: "wwevent-b8ce3.firebaseapp.com",
            projectId: "wwevent-b8ce3",
            storageBucket: "wwevent-b8ce3.appspot.com",
            messagingSenderId: "1055532309431",
            appId: "1:1055532309431:web:a81a848bb1c7c32f32e632",
            measurementId: "G-3MB0KP6P54"));
  } else {
    await Firebase.initializeApp();
  }
}
