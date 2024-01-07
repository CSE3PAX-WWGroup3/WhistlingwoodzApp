// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

String sendMessage(
  String audience,
  String cc,
  String title,
  String message,
) {
  // send email to the audience.
  CollectionReference mail = FirebaseFirestore.instance.collection('mail');

  mail.doc().set({
    'cc': cc,
    'bcc': audience,
    'message': {
      'subject': title,
      'text': message,
    }
  });

  return "Notification message sent";
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
