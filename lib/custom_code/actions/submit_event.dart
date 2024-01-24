// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

String submitEvent(
  String eventID,
  String email,
  String eventType,
  String theme,
  String functions,
  String venue,
  String numberGuests,
  String budget,
  String uid,
  String managerEmail,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // initialise return values
  String result = '';
  // String collection = eventType.toLowerCase();
  String collection = 'events';
  // ww manager email.
  // String managerEmail = 'wwmanager2023@gmail.com';

  CollectionReference events =
      FirebaseFirestore.instance.collection(collection);
  String now = DateTime.now().toString().substring(0, 19);
  // List<String> notes = [];

  events.doc(eventID).set({
    'email': email,
    'eventType': eventType,
    'requestTime': now,
    'theme': theme,
    'functions': functions,
    'venue': venue,
    'numberGuests': numberGuests,
    'budget': budget,
    'uid': uid,
  });

  result = "$eventID loaded into database";

  // add event to list of users events
  List<dynamic> myEvents = [];
  CollectionReference userEvents =
      FirebaseFirestore.instance.collection('userEvents');
  userEvents.doc(email).get().then((DocumentSnapshot snap) {
    if (snap.exists) {
      myEvents = snap['myEvents'];
    }
    myEvents.add(eventID);
    userEvents.doc(email).set({'myEvents': myEvents});
  });

  // send email to user with event details.
  CollectionReference mail = FirebaseFirestore.instance.collection('mail');
  String date = now.substring(0, 10);
  String subject = 'Event request $eventID';
  String html = '<p>Thank you for your enquiry for an event<br>'
      'Your event identifier is <strong>$eventID</strong></p>'
      '<p><strong>Date of Request</strong><br>$date</p>'
      '<p><strong>Event Type</strong><br>$eventType</p>'
      '<p><strong>Theme</strong><br>$theme</p>'
      '<p><strong>Event requirements</strong><br>$functions</p>'
      '<p><strong>Venue</strong><br>$venue</p>'
      '<p><strong>Number of Guests</strong><br>$numberGuests</p>'
      '<p><strong>Budget</strong><br>$budget</p>'
      '<p>A team member will contact you to discuss your event.</p>'
      '<p></p><p>Kind regards the WhistlingWoodz sales team</p>';

  mail.doc(eventID).set({
    'to': email,
    'bcc': managerEmail,
    'message': {
      'subject': subject,
      'html': html,
    }
  });

  return "$result\n mail sent to $email";
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
