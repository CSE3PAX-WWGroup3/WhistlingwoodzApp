import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class WeddingThemeRecord extends FirestoreRecord {
  WeddingThemeRecord._(
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
      FirebaseFirestore.instance.collection('weddingTheme');

  static Stream<WeddingThemeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeddingThemeRecord.fromSnapshot(s));

  static Future<WeddingThemeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WeddingThemeRecord.fromSnapshot(s));

  static WeddingThemeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WeddingThemeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeddingThemeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeddingThemeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeddingThemeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeddingThemeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeddingThemeRecordData({
  String? theme,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'theme': theme,
    }.withoutNulls,
  );

  return firestoreData;
}

class WeddingThemeRecordDocumentEquality
    implements Equality<WeddingThemeRecord> {
  const WeddingThemeRecordDocumentEquality();

  @override
  bool equals(WeddingThemeRecord? e1, WeddingThemeRecord? e2) {
    return e1?.theme == e2?.theme;
  }

  @override
  int hash(WeddingThemeRecord? e) => const ListEquality().hash([e?.theme]);

  @override
  bool isValidKey(Object? o) => o is WeddingThemeRecord;
}
