import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tickers_record.g.dart';

abstract class TickersRecord
    implements Built<TickersRecord, TickersRecordBuilder> {
  static Serializer<TickersRecord> get serializer => _$tickersRecordSerializer;

  @nullable
  String get ticker;

  @nullable
  String get index;

  @nullable
  String get type;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TickersRecordBuilder builder) => builder
    ..ticker = ''
    ..index = ''
    ..type = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tickers');

  static Stream<TickersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TickersRecord._();
  factory TickersRecord([void Function(TickersRecordBuilder) updates]) =
      _$TickersRecord;

  static TickersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createTickersRecordData({
  String ticker,
  String index,
  String type,
}) =>
    serializers.toFirestore(
        TickersRecord.serializer,
        TickersRecord((t) => t
          ..ticker = ticker
          ..index = index
          ..type = type));
