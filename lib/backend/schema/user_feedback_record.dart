import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UserFeedbackRecord extends FirestoreRecord {
  UserFeedbackRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  void _initializeFields() {
    _feedback = snapshotData['feedback'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _message = snapshotData['message'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_feedback');

  static Stream<UserFeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserFeedbackRecord.fromSnapshot(s));

  static Future<UserFeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserFeedbackRecord.fromSnapshot(s));

  static UserFeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserFeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserFeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserFeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserFeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserFeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserFeedbackRecordData({
  String? feedback,
  DateTime? timestamp,
  String? email,
  String? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'feedback': feedback,
      'timestamp': timestamp,
      'email': email,
      'message': message,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserFeedbackRecordDocumentEquality
    implements Equality<UserFeedbackRecord> {
  const UserFeedbackRecordDocumentEquality();

  @override
  bool equals(UserFeedbackRecord? e1, UserFeedbackRecord? e2) {
    return e1?.feedback == e2?.feedback &&
        e1?.timestamp == e2?.timestamp &&
        e1?.email == e2?.email &&
        e1?.message == e2?.message;
  }

  @override
  int hash(UserFeedbackRecord? e) => const ListEquality()
      .hash([e?.feedback, e?.timestamp, e?.email, e?.message]);

  @override
  bool isValidKey(Object? o) => o is UserFeedbackRecord;
}
