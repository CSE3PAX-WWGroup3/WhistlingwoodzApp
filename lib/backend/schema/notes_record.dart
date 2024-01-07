import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class NotesRecord extends FirestoreRecord {
  NotesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "dateNote" field.
  DateTime? _dateNote;
  DateTime? get dateNote => _dateNote;
  bool hasDateNote() => _dateNote != null;

  // "docID" field.
  DocumentReference? _docID;
  DocumentReference? get docID => _docID;
  bool hasDocID() => _docID != null;

  // "isManager" field.
  bool? _isManager;
  bool get isManager => _isManager ?? false;
  bool hasIsManager() => _isManager != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  void _initializeFields() {
    _dateNote = snapshotData['dateNote'] as DateTime?;
    _docID = snapshotData['docID'] as DocumentReference?;
    _isManager = snapshotData['isManager'] as bool?;
    _message = snapshotData['message'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notes');

  static Stream<NotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesRecord.fromSnapshot(s));

  static Future<NotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotesRecord.fromSnapshot(s));

  static NotesRecord fromSnapshot(DocumentSnapshot snapshot) => NotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesRecordData({
  DateTime? dateNote,
  DocumentReference? docID,
  bool? isManager,
  String? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dateNote': dateNote,
      'docID': docID,
      'isManager': isManager,
      'message': message,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotesRecordDocumentEquality implements Equality<NotesRecord> {
  const NotesRecordDocumentEquality();

  @override
  bool equals(NotesRecord? e1, NotesRecord? e2) {
    return e1?.dateNote == e2?.dateNote &&
        e1?.docID == e2?.docID &&
        e1?.isManager == e2?.isManager &&
        e1?.message == e2?.message;
  }

  @override
  int hash(NotesRecord? e) => const ListEquality()
      .hash([e?.dateNote, e?.docID, e?.isManager, e?.message]);

  @override
  bool isValidKey(Object? o) => o is NotesRecord;
}
