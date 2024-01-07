import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CorporateThemeRecord extends FirestoreRecord {
  CorporateThemeRecord._(
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
      FirebaseFirestore.instance.collection('corporateTheme');

  static Stream<CorporateThemeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CorporateThemeRecord.fromSnapshot(s));

  static Future<CorporateThemeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CorporateThemeRecord.fromSnapshot(s));

  static CorporateThemeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CorporateThemeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CorporateThemeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CorporateThemeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CorporateThemeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CorporateThemeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCorporateThemeRecordData({
  String? theme,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'theme': theme,
    }.withoutNulls,
  );

  return firestoreData;
}

class CorporateThemeRecordDocumentEquality
    implements Equality<CorporateThemeRecord> {
  const CorporateThemeRecordDocumentEquality();

  @override
  bool equals(CorporateThemeRecord? e1, CorporateThemeRecord? e2) {
    return e1?.theme == e2?.theme;
  }

  @override
  int hash(CorporateThemeRecord? e) => const ListEquality().hash([e?.theme]);

  @override
  bool isValidKey(Object? o) => o is CorporateThemeRecord;
}
