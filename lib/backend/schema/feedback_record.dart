import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackRecord extends FirestoreRecord {
  FeedbackRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "positive" field.
  int? _positive;
  int get positive => _positive ?? 0;
  bool hasPositive() => _positive != null;

  // "negative" field.
  int? _negative;
  int get negative => _negative ?? 0;
  bool hasNegative() => _negative != null;

  // "feedback_time" field.
  DateTime? _feedbackTime;
  DateTime? get feedbackTime => _feedbackTime;
  bool hasFeedbackTime() => _feedbackTime != null;

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  void _initializeFields() {
    _positive = castToType<int>(snapshotData['positive']);
    _negative = castToType<int>(snapshotData['negative']);
    _feedbackTime = snapshotData['feedback_time'] as DateTime?;
    _feedback = snapshotData['feedback'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedback');

  static Stream<FeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackRecord.fromSnapshot(s));

  static Future<FeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbackRecord.fromSnapshot(s));

  static FeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackRecordData({
  int? positive,
  int? negative,
  DateTime? feedbackTime,
  String? feedback,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'positive': positive,
      'negative': negative,
      'feedback_time': feedbackTime,
      'feedback': feedback,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbackRecordDocumentEquality implements Equality<FeedbackRecord> {
  const FeedbackRecordDocumentEquality();

  @override
  bool equals(FeedbackRecord? e1, FeedbackRecord? e2) {
    return e1?.positive == e2?.positive &&
        e1?.negative == e2?.negative &&
        e1?.feedbackTime == e2?.feedbackTime &&
        e1?.feedback == e2?.feedback;
  }

  @override
  int hash(FeedbackRecord? e) => const ListEquality()
      .hash([e?.positive, e?.negative, e?.feedbackTime, e?.feedback]);

  @override
  bool isValidKey(Object? o) => o is FeedbackRecord;
}
