import 'dart:developer';

import 'package:firebase_authentication/realtime_db.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final _real = FirebaseDatabase.instance;

  create(User user) {
    try {
      // _real.ref("users").set({"name": "Legend"});
      _real.ref("users").child("user2").set(user.toMap());
    } catch (e) {
      log(e.toString());
    }
  }

  read() async {
    try {
      final data = await _real.ref("users").once();
      print(data.snapshot.children.toList()[0].value.toString());
      // for (int i = 0; i < data.snapshot.children.length; i++) {
      //   print(data.snapshot.children.toList()[i].value.toString());
      //   print("--------------");
      // }

      // final data = await _real.ref("users").onValue;
      // data.listen((event) {
      //   print(event.snapshot.children.toList()[0].value.toString());
      // });
    } catch (e) {
      log(e.toString());
    }
  }

  update() async {
    try {
      _real.ref("users").child("user2").update({"name": "LegendAb"});
    } catch (e) {
      log(e.toString());
    }
  }

  delete() async {
    try {
      _real.ref("users").child("user2").remove();
    } catch (e) {
      log(e.toString());
    }
  }
}
