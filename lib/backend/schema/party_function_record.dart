import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PartyFunctionRecord extends FirestoreRecord {
  PartyFunctionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Function" field.
  String? _function;
  String get function => _function ?? '';
  bool hasFunction() => _function != null;

  void _initializeFields() {
    _function = snapshotData['Function'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('partyFunction');

  static Stream<PartyFunctionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PartyFunctionRecord.fromSnapshot(s));

  static Future<PartyFunctionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PartyFunctionRecord.fromSnapshot(s));

  static PartyFunctionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PartyFunctionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PartyFunctionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PartyFunctionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PartyFunctionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PartyFunctionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPartyFunctionRecordData({
  String? function,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Function': function,
    }.withoutNulls,
  );

  return firestoreData;
}

class PartyFunctionRecordDocumentEquality
    implements Equality<PartyFunctionRecord> {
  const PartyFunctionRecordDocumentEquality();

  @override
  bool equals(PartyFunctionRecord? e1, PartyFunctionRecord? e2) {
    return e1?.function == e2?.function;
  }

  @override
  int hash(PartyFunctionRecord? e) => const ListEquality().hash([e?.function]);

  @override
  bool isValidKey(Object? o) => o is PartyFunctionRecord;
}
