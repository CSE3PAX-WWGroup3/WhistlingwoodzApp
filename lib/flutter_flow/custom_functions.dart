import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String newEvent(
  String eventID,
  String email,
  String eventType,
  String theme,
  String functions,
  String venue,
  String numberGuests,
  String budget,
) {
// initialise return values
  String result = '';
  // String collection = eventType.toLowerCase();
  String collection = 'events';
  // ww manager email.
  String managerEmail = 'wwmanager2023@gmail.com';

  CollectionReference events =
      FirebaseFirestore.instance.collection(collection);
  String now = DateTime.now().toString().substring(0, 19);

  events.doc(eventID).set({
    'email': email,
    'eventType': eventType,
    'requestTime': now,
    'theme': theme,
    'functions': functions,
    'venue': venue,
    'numberGuests': numberGuests,
    'budget': budget
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
    'cc': managerEmail,
    'message': {
      'subject': subject,
      'html': html,
    }
  });

  return "$result\n mail sent to $email";

  // return result;
}
