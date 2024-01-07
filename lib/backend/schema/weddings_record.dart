import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class WeddingsRecord extends FirestoreRecord {
  WeddingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "theme" field.
  String? _theme;
  String get theme => _theme ?? '';
  bool hasTheme() => _theme != null;

  // "venue" field.
  String? _venue;
  String get venue => _venue ?? '';
  bool hasVenue() => _venue != null;

  // "budget" field.
  String? _budget;
  String get budget => _budget ?? '';
  bool hasBudget() => _budget != null;

  // "numberGuests" field.
  String? _numberGuests;
  String get numberGuests => _numberGuests ?? '';
  bool hasNumberGuests() => _numberGuests != null;

  // "function" field.
  String? _function;
  String get function => _function ?? '';
  bool hasFunction() => _function != null;

  void _initializeFields() {
    _theme = snapshotData['theme'] as String?;
    _venue = snapshotData['venue'] as String?;
    _budget = snapshotData['budget'] as String?;
    _numberGuests = snapshotData['numberGuests'] as String?;
    _function = snapshotData['function'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('weddings');

  static Stream<WeddingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeddingsRecord.fromSnapshot(s));

  static Future<WeddingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WeddingsRecord.fromSnapshot(s));

  static WeddingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WeddingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeddingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeddingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeddingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeddingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeddingsRecordData({
  String? theme,
  String? venue,
  String? budget,
  String? numberGuests,
  String? function,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'theme': theme,
      'venue': venue,
      'budget': budget,
      'numberGuests': numberGuests,
      'function': function,
    }.withoutNulls,
  );

  return firestoreData;
}

class WeddingsRecordDocumentEquality implements Equality<WeddingsRecord> {
  const WeddingsRecordDocumentEquality();

  @override
  bool equals(WeddingsRecord? e1, WeddingsRecord? e2) {
    return e1?.theme == e2?.theme &&
        e1?.venue == e2?.venue &&
        e1?.budget == e2?.budget &&
        e1?.numberGuests == e2?.numberGuests &&
        e1?.function == e2?.function;
  }

  @override
  int hash(WeddingsRecord? e) => const ListEquality()
      .hash([e?.theme, e?.venue, e?.budget, e?.numberGuests, e?.function]);

  @override
  bool isValidKey(Object? o) => o is WeddingsRecord;
}
