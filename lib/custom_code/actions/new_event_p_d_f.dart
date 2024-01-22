// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:io';
// import 'dart:convert' show utf16;
import 'package:download/download.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future newEventPDF(
    DocumentReference docID,
    String email,
    String budget,
    String eventType,
    String functions,
    String numGuests,
    String requestTime,
    String theme,
    String venue) async {
  // Add your function code here!

  // Number of characters + 1 in the event request.
  final int numCharEventID = 7;
  // Get eventID from Docuemnt Reference
  String eventRef = docID.toString();
  int xx = eventRef.length;
  String eventID = eventRef.substring(xx - numCharEventID, xx - 1);
  // Filename for pdf download.
  String fileName = eventID + ".pdf";

  // Adjust some input parms to be String variables
  String numberGuests = numGuests.toString();

  String heading1 = eventType + " event request";
  String heading2 = "Request Identifier " + eventID;

  // Start building the pdf page.
  final pdf = pw.Document();

  pdf.addPage(pw.Page(
    pageFormat: PdfPageFormat.a4,
    build: (pw.Context context) {
      return pw.Column(
        children: [
          pw.Divider(thickness: 4),
          pw.Text(
            heading1,
            style: const pw.TextStyle(
              color: PdfColors.red,
              fontSize: 25,
            ),
          ),
          pw.Divider(thickness: 4),
          pw.Text(
            heading2,
            style: const pw.TextStyle(
              color: PdfColors.red,
              fontSize: 25,
            ),
          ),
          pw.Divider(thickness: 4),
          pw.Container(
            decoration: pw.BoxDecoration(
              borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
            ),
            padding: const pw.EdgeInsets.only(
              left: 40,
              top: 10,
              bottom: 10,
              right: 20,
            ),
            alignment: pw.Alignment.centerLeft,
            height: 300,
            child: pw.DefaultTextStyle(
              style: pw.TextStyle(
                fontSize: 15,
              ),
              child: pw.GridView(
                crossAxisCount: 2,
                children: [
                  pw.Text('Date submitted'),
                  pw.Text(requestTime),
                  pw.Text('Event type'),
                  pw.Text(eventType),
                  pw.Text('Contact Email'),
                  pw.Text(email),
                  pw.Text('Theme'),
                  pw.Text(theme),
                  pw.Text('Requirements'),
                  pw.Text(functions),
                  pw.Text('Venue'),
                  pw.Text(venue),
                  pw.Text('Number of guests'),
                  pw.Text(numberGuests),
                  pw.Text('Estimated Budget'),
                  pw.Text(budget),
                ],
              ),
            ),
          ),
          pw.Divider(thickness: 4),
        ],
      );
    },
  ));

  // Download PDF file if running on web
  var savedPDF = await pdf.save();
  if (isWeb) {
    final stream = Stream.fromIterable(savedPDF);
    download(stream, fileName);
  }

  // firebase_storage option to write the PDF
  final storeRef = FirebaseStorage.instance.ref();
  final fileRef = storeRef.child('event_pdf').child(fileName);

  // write PDF
  try {
    await fileRef.putData(savedPDF);
  } catch (e) {
    print(e.toString());
  }

  // option to view and print created document
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
