// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> getManagerEmails() async {
  String email = '';
  List<String> emails = [];

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  emails = await users
      .where('isManager', isEqualTo: true)
      .get()
      .then((querySnapshot) {
    for (var docSnapshot in querySnapshot.docs) {
      email = docSnapshot['email'];
      if (!emails.contains(email)) {
        emails.add(email);
      }
    }
    return emails;
  });

  return emails.join(", ");
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
