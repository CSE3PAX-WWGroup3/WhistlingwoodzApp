import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class WeddingFunctionRecord extends FirestoreRecord {
  WeddingFunctionRecord._(
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
      FirebaseFirestore.instance.collection('weddingFunction');

  static Stream<WeddingFunctionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeddingFunctionRecord.fromSnapshot(s));

  static Future<WeddingFunctionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WeddingFunctionRecord.fromSnapshot(s));

  static WeddingFunctionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WeddingFunctionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeddingFunctionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeddingFunctionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeddingFunctionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeddingFunctionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeddingFunctionRecordData({
  String? function,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Function': function,
    }.withoutNulls,
  );

  return firestoreData;
}

class WeddingFunctionRecordDocumentEquality
    implements Equality<WeddingFunctionRecord> {
  const WeddingFunctionRecordDocumentEquality();

  @override
  bool equals(WeddingFunctionRecord? e1, WeddingFunctionRecord? e2) {
    return e1?.function == e2?.function;
  }

  @override
  int hash(WeddingFunctionRecord? e) =>
      const ListEquality().hash([e?.function]);

  @override
  bool isValidKey(Object? o) => o is WeddingFunctionRecord;
}
