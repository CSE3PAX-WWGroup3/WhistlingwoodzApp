// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> nextDocID(String eventType) async {
  // get the next documentID number and increment the number by 1.
  // if the document does not exist then create it with a value of zero.
  int nextID = 0;

  // document ID in the database
  const String collection = 'docID';
  // String docID = eventType.toLowerCase();
  String ID = 'Not set';

  String eventCode;
  switch (eventType) {
    case 'Wedding':
      eventCode = 'WD';
      break;
    case 'Corporate':
      eventCode = 'CO';
      break;
    case 'Party':
      eventCode = 'PA';
      break;
    default:
      eventCode = 'EV';
      break;
  }

  CollectionReference events =
      FirebaseFirestore.instance.collection(collection);
  ID = await events.doc(collection).get().then((DocumentSnapshot docSnap) {
    if (docSnap.exists) {
      // get the nextID if the NextDecID document exists
      nextID = docSnap['nextID'];
    }
    // increment nextID in the database
    events.doc(collection).set({'nextID': nextID + 1});
    // convert numeric nextID to 6 character hexadecimal upper case string.
    String ID = nextID.toRadixString(36).toUpperCase();
    // print('$nextID and $ID');
    switch (ID.length) {
      case 0:
        ID = '0000';
        break;
      case 1:
        ID = '000$ID';
        break;
      case 2:
        ID = '00$ID';
        break;
      case 3:
        ID = '0$ID';
        break;
      default:
    }
    // late final nextDocID = ID;
    // print('$nextID and $nextDocID and $ID');
    return '$eventCode$ID';
  });
  // print('At end $ID');
  return ID;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
