import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CorporateFunctionRecord extends FirestoreRecord {
  CorporateFunctionRecord._(
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
      FirebaseFirestore.instance.collection('corporateFunction');

  static Stream<CorporateFunctionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CorporateFunctionRecord.fromSnapshot(s));

  static Future<CorporateFunctionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CorporateFunctionRecord.fromSnapshot(s));

  static CorporateFunctionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CorporateFunctionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CorporateFunctionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CorporateFunctionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CorporateFunctionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CorporateFunctionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCorporateFunctionRecordData({
  String? function,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Function': function,
    }.withoutNulls,
  );

  return firestoreData;
}

class CorporateFunctionRecordDocumentEquality
    implements Equality<CorporateFunctionRecord> {
  const CorporateFunctionRecordDocumentEquality();

  @override
  bool equals(CorporateFunctionRecord? e1, CorporateFunctionRecord? e2) {
    return e1?.function == e2?.function;
  }

  @override
  int hash(CorporateFunctionRecord? e) =>
      const ListEquality().hash([e?.function]);

  @override
  bool isValidKey(Object? o) => o is CorporateFunctionRecord;
}
