import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/auth/auth_service.dart';
import 'package:firebase_authentication/widgets/button.dart';
import 'package:firebase_authentication/wrapper.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _auth = AuthService();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _auth.sendEmailVericationLink();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {});
    FirebaseAuth.instance.currentUser?.reload();
    if (FirebaseAuth.instance.currentUser!.emailVerified == true) {
      timer.cancel();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Wrapper()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "we hand sent an email for verification. If you haven't received an email. Please click to resend",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  label: 'Resend Email',
                  onPressed: () async {
                    _auth.sendEmailVericationLink();
                  },
                )
              ],
            ),
          )),
    );
  }
}
