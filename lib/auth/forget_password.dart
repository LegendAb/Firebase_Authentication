import 'package:firebase_authentication/auth/auth_service.dart';
import 'package:firebase_authentication/widgets/button.dart';
import 'package:firebase_authentication/widgets/textfield.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _auth = AuthService();
  final _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter your email to reset your password'),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                controller: _email, hint: 'Enter Email', label: 'Email'),
            const SizedBox(height: 20),
            CustomButton(
              label: 'Send Email',
              onPressed: () async {
                await _auth.sendPasswordResetLink(_email.text);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        'An email for password reset as been sent to your email')));
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
