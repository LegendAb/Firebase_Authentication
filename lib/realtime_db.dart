import 'package:firebase_authentication/database_service.dart';
import 'package:firebase_authentication/widgets/button.dart';
import 'package:flutter/material.dart';

class RealtimeDb extends StatefulWidget {
  const RealtimeDb({super.key});

  @override
  State<RealtimeDb> createState() => _RealtimeDbState();
}

class _RealtimeDbState extends State<RealtimeDb> {
  final _dbService = DatabaseService();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _name.dispose();
    _email.dispose();
    _phone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Realtime Database",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Name"),
            TextField(controller: _name),
            const SizedBox(height: 10),
            const Text("Email"),
            TextField(controller: _email),
            const SizedBox(height: 10),
            const Text("Phone"),
            TextField(controller: _phone),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  label: "Create",
                  onPressed: () {
                    final user = User(
                        name: _name.text,
                        email: _email.text,
                        phone: _phone.text);
                    _dbService.create(user);
                  },
                ),
                const SizedBox(width: 5),
                CustomButton(
                  label: "Read",
                  onPressed: () {
                    _dbService.read();
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  label: "Update",
                  onPressed: () {
                    _dbService.update();
                  },
                ),
                const SizedBox(width: 5),
                CustomButton(
                  label: "Delete",
                  onPressed: () {
                    _dbService.delete();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final String phone;

  User({required this.name, required this.email, required this.phone});

  Map<String, dynamic> toMap() =>
      {"name": name, "email": email, "phone": phone};
}
