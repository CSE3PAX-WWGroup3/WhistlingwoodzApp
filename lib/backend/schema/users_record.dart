import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "isManager" field.
  bool? _isManager;
  bool get isManager => _isManager ?? false;
  bool hasIsManager() => _isManager != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "dob" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  // "firstname" field.
  String? _firstname;
  String get firstname => _firstname ?? '';
  bool hasFirstname() => _firstname != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  bool hasSurname() => _surname != null;

  // "last_active" field.
  DateTime? _lastActive;
  DateTime? get lastActive => _lastActive;
  bool hasLastActive() => _lastActive != null;

  // "last_page" field.
  String? _lastPage;
  String get lastPage => _lastPage ?? '';
  bool hasLastPage() => _lastPage != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _isManager = snapshotData['isManager'] as bool?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _dob = snapshotData['dob'] as DateTime?;
    _firstname = snapshotData['firstname'] as String?;
    _surname = snapshotData['surname'] as String?;
    _lastActive = snapshotData['last_active'] as DateTime?;
    _lastPage = snapshotData['last_page'] as String?;
    _gender = snapshotData['gender'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'isAdmin': snapshot.data['isAdmin'],
          'isManager': snapshot.data['isManager'],
          'photo_url': snapshot.data['photo_url'],
          'dob': convertAlgoliaParam(
            snapshot.data['dob'],
            ParamType.DateTime,
            false,
          ),
          'firstname': snapshot.data['firstname'],
          'surname': snapshot.data['surname'],
          'last_active': convertAlgoliaParam(
            snapshot.data['last_active'],
            ParamType.DateTime,
            false,
          ),
          'last_page': snapshot.data['last_page'],
          'gender': snapshot.data['gender'],
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? isAdmin,
  bool? isManager,
  String? photoUrl,
  DateTime? dob,
  String? firstname,
  String? surname,
  DateTime? lastActive,
  String? lastPage,
  String? gender,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'isAdmin': isAdmin,
      'isManager': isManager,
      'photo_url': photoUrl,
      'dob': dob,
      'firstname': firstname,
      'surname': surname,
      'last_active': lastActive,
      'last_page': lastPage,
      'gender': gender,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.isManager == e2?.isManager &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.dob == e2?.dob &&
        e1?.firstname == e2?.firstname &&
        e1?.surname == e2?.surname &&
        e1?.lastActive == e2?.lastActive &&
        e1?.lastPage == e2?.lastPage &&
        e1?.gender == e2?.gender;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.isAdmin,
        e?.isManager,
        e?.photoUrl,
        e?.dob,
        e?.firstname,
        e?.surname,
        e?.lastActive,
        e?.lastPage,
        e?.gender
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
