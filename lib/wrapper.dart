import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/auth/login_screen.dart';
import 'package:firebase_authentication/home_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          log("wrapper");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            if (snapshot.data == null) {
              return const LoginScreen();
            } else {
              return const HomeScreen();
              // if (snapshot.data!.emailVerified == true) {
              //   return const HomeScreen();
              // } else {
              //   return VerificationScreen(
              //     user: snapshot.data!,
              //   );
              // }
            }
          }
        },
      ),
    );
  }
}
