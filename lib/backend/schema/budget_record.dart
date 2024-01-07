import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class BudgetRecord extends FirestoreRecord {
  BudgetRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "budget" field.
  String? _budget;
  String get budget => _budget ?? '';
  bool hasBudget() => _budget != null;

  void _initializeFields() {
    _budget = snapshotData['budget'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('budget');

  static Stream<BudgetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BudgetRecord.fromSnapshot(s));

  static Future<BudgetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BudgetRecord.fromSnapshot(s));

  static BudgetRecord fromSnapshot(DocumentSnapshot snapshot) => BudgetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BudgetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BudgetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BudgetRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BudgetRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBudgetRecordData({
  String? budget,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'budget': budget,
    }.withoutNulls,
  );

  return firestoreData;
}

class BudgetRecordDocumentEquality implements Equality<BudgetRecord> {
  const BudgetRecordDocumentEquality();

  @override
  bool equals(BudgetRecord? e1, BudgetRecord? e2) {
    return e1?.budget == e2?.budget;
  }

  @override
  int hash(BudgetRecord? e) => const ListEquality().hash([e?.budget]);

  @override
  bool isValidKey(Object? o) => o is BudgetRecord;
}
