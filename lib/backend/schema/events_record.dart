import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "budget" field.
  String? _budget;
  String get budget => _budget ?? '';
  bool hasBudget() => _budget != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "eventType" field.
  String? _eventType;
  String get eventType => _eventType ?? '';
  bool hasEventType() => _eventType != null;

  // "functions" field.
  List<String>? _functions;
  List<String> get functions => _functions ?? const [];
  bool hasFunctions() => _functions != null;

  // "numberGuests" field.
  String? _numberGuests;
  String get numberGuests => _numberGuests ?? '';
  bool hasNumberGuests() => _numberGuests != null;

  // "theme" field.
  String? _theme;
  String get theme => _theme ?? '';
  bool hasTheme() => _theme != null;

  // "venue" field.
  String? _venue;
  String get venue => _venue ?? '';
  bool hasVenue() => _venue != null;

  // "requestTime" field.
  String? _requestTime;
  String get requestTime => _requestTime ?? '';
  bool hasRequestTime() => _requestTime != null;

  void _initializeFields() {
    _budget = snapshotData['budget'] as String?;
    _email = snapshotData['email'] as String?;
    _eventType = snapshotData['eventType'] as String?;
    _functions = getDataList(snapshotData['functions']);
    _numberGuests = snapshotData['numberGuests'] as String?;
    _theme = snapshotData['theme'] as String?;
    _venue = snapshotData['venue'] as String?;
    _requestTime = snapshotData['requestTime'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? budget,
  String? email,
  String? eventType,
  String? numberGuests,
  String? theme,
  String? venue,
  String? requestTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'budget': budget,
      'email': email,
      'eventType': eventType,
      'numberGuests': numberGuests,
      'theme': theme,
      'venue': venue,
      'requestTime': requestTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.budget == e2?.budget &&
        e1?.email == e2?.email &&
        e1?.eventType == e2?.eventType &&
        listEquality.equals(e1?.functions, e2?.functions) &&
        e1?.numberGuests == e2?.numberGuests &&
        e1?.theme == e2?.theme &&
        e1?.venue == e2?.venue &&
        e1?.requestTime == e2?.requestTime;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.budget,
        e?.email,
        e?.eventType,
        e?.functions,
        e?.numberGuests,
        e?.theme,
        e?.venue,
        e?.requestTime
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
