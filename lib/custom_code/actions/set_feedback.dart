// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> setFeedback(String feedback) async {
  // document ID in the database
  const String collection = 'feedback';
  const String docID = 'feedback';
  int nextFeedback = 0;

  CollectionReference events =
      FirebaseFirestore.instance.collection(collection);
  events.doc(docID).get().then((DocumentSnapshot docSnap) {
    if (docSnap.exists) {
      // get the nextID if the NextDecID document exists
      nextFeedback = docSnap[feedback];
    }
    // increment nextID in the database
    events.doc(docID).update({feedback: nextFeedback + 1});
  });
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
