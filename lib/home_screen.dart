import 'package:firebase_authentication/auth/auth_service.dart';
import 'package:firebase_authentication/realtime_db.dart';
import 'package:firebase_authentication/storage.dart';
import 'package:firebase_authentication/widgets/button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome User",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Sign Out",
              onPressed: () async {
                await auth.signout();
                // goToLogin(context);
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Realtime DB",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RealtimeDb()));
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Storage",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Storage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  // goToLogin(BuildContext context) => Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const LoginScreen()),
  //     );
}
