// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert' show utf8;
import 'package:download/download.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future rawEventCSV(List<EventsRecord>? eventDoc) async {
  // Add your function code here!
  eventDoc = eventDoc ?? [];
  String fileContent = "Budget,Event,#Guests,Date/Time,Venue";
  eventDoc.asMap().forEach((index, record) => fileContent = fileContent +
      '\n' +
      '"' +
      record.budget.toString() +
      '","' +
      record.eventType.toString() +
      '","' +
      record.numberGuests.toString() +
      '","' +
      record.requestTime.toString() +
      '","' +
      record.venue.toString() +
      '"');
  final fileName = "raw_events_" + DateTime.now().toString() + ".csv";
  var bytes = utf8.encode(fileContent);

  // if running in browser download file to local machine.
  if (isWeb) {
    final stream = Stream.fromIterable(bytes);
    download(stream, fileName);
  }

  // write csv to firebase storage
  final storeRef = FirebaseStorage.instance.ref();
  final fileRef = storeRef.child('events_csv').child(fileName);

  // write csv to Firebase Storage
  try {
    await fileRef.putString(fileContent);
  } catch (e) {
    print(e.toString());
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
