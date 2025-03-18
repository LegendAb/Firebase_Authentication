import 'dart:async';

import 'package:firebase_authentication/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBTfCXykv9GD53cOIH98yHSBw9gQ87-K8s",
            authDomain: "firebas-auth-76bf8.firebaseapp.com",
            databaseURL:
                "https://firebas-auth-76bf8-default-rtdb.firebaseio.com",
            projectId: "firebas-auth-76bf8",
            storageBucket: "firebas-auth-76bf8.appspot.com",
            messagingSenderId: "730045966940",
            appId: "1:730045966940:web:ac9258b8e7e38fbd9b9499"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Wrapper());
  }
}
