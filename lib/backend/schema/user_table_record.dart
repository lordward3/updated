import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_table_record.g.dart';

abstract class UserTableRecord
    implements Built<UserTableRecord, UserTableRecordBuilder> {
  static Serializer<UserTableRecord> get serializer =>
      _$userTableRecordSerializer;

  @nullable
  String get username;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserTableRecordBuilder builder) => builder
    ..username = ''
    ..email = ''
    ..displayName = ''
    ..uid = ''
    ..phoneNumber = ''
    ..photoUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_table');

  static Stream<UserTableRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserTableRecord._();
  factory UserTableRecord([void Function(UserTableRecordBuilder) updates]) =
      _$UserTableRecord;

  static UserTableRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserTableRecordData({
  String username,
  String email,
  String displayName,
  DateTime createdTime,
  String uid,
  String phoneNumber,
  String photoUrl,
}) =>
    serializers.toFirestore(
        UserTableRecord.serializer,
        UserTableRecord((u) => u
          ..username = username
          ..email = email
          ..displayName = displayName
          ..createdTime = createdTime
          ..uid = uid
          ..phoneNumber = phoneNumber
          ..photoUrl = photoUrl));
