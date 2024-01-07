import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PartyThemeRecord extends FirestoreRecord {
  PartyThemeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "theme" field.
  String? _theme;
  String get theme => _theme ?? '';
  bool hasTheme() => _theme != null;

  void _initializeFields() {
    _theme = snapshotData['theme'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('partyTheme');

  static Stream<PartyThemeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PartyThemeRecord.fromSnapshot(s));

  static Future<PartyThemeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PartyThemeRecord.fromSnapshot(s));

  static PartyThemeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PartyThemeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PartyThemeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PartyThemeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PartyThemeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PartyThemeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPartyThemeRecordData({
  String? theme,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'theme': theme,
    }.withoutNulls,
  );

  return firestoreData;
}

class PartyThemeRecordDocumentEquality implements Equality<PartyThemeRecord> {
  const PartyThemeRecordDocumentEquality();

  @override
  bool equals(PartyThemeRecord? e1, PartyThemeRecord? e2) {
    return e1?.theme == e2?.theme;
  }

  @override
  int hash(PartyThemeRecord? e) => const ListEquality().hash([e?.theme]);

  @override
  bool isValidKey(Object? o) => o is PartyThemeRecord;
}
