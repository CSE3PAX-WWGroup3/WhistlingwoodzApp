import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ActiveUsersRecord extends FirestoreRecord {
  ActiveUsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "last_active" field.
  DateTime? _lastActive;
  DateTime? get lastActive => _lastActive;
  bool hasLastActive() => _lastActive != null;

  // "last_page" field.
  String? _lastPage;
  String get lastPage => _lastPage ?? '';
  bool hasLastPage() => _lastPage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _lastActive = snapshotData['last_active'] as DateTime?;
    _lastPage = snapshotData['last_page'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('activeUsers')
          : FirebaseFirestore.instance.collectionGroup('activeUsers');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('activeUsers').doc();

  static Stream<ActiveUsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActiveUsersRecord.fromSnapshot(s));

  static Future<ActiveUsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActiveUsersRecord.fromSnapshot(s));

  static ActiveUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActiveUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActiveUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActiveUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActiveUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActiveUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActiveUsersRecordData({
  String? email,
  DateTime? lastActive,
  String? lastPage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'last_active': lastActive,
      'last_page': lastPage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActiveUsersRecordDocumentEquality implements Equality<ActiveUsersRecord> {
  const ActiveUsersRecordDocumentEquality();

  @override
  bool equals(ActiveUsersRecord? e1, ActiveUsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.lastActive == e2?.lastActive &&
        e1?.lastPage == e2?.lastPage;
  }

  @override
  int hash(ActiveUsersRecord? e) =>
      const ListEquality().hash([e?.email, e?.lastActive, e?.lastPage]);

  @override
  bool isValidKey(Object? o) => o is ActiveUsersRecord;
}
