import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocIDRecord extends FirestoreRecord {
  DocIDRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nextID" field.
  int? _nextID;
  int get nextID => _nextID ?? 0;
  bool hasNextID() => _nextID != null;

  void _initializeFields() {
    _nextID = castToType<int>(snapshotData['nextID']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('docID');

  static Stream<DocIDRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocIDRecord.fromSnapshot(s));

  static Future<DocIDRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocIDRecord.fromSnapshot(s));

  static DocIDRecord fromSnapshot(DocumentSnapshot snapshot) => DocIDRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocIDRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocIDRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocIDRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocIDRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocIDRecordData({
  int? nextID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nextID': nextID,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocIDRecordDocumentEquality implements Equality<DocIDRecord> {
  const DocIDRecordDocumentEquality();

  @override
  bool equals(DocIDRecord? e1, DocIDRecord? e2) {
    return e1?.nextID == e2?.nextID;
  }

  @override
  int hash(DocIDRecord? e) => const ListEquality().hash([e?.nextID]);

  @override
  bool isValidKey(Object? o) => o is DocIDRecord;
}
