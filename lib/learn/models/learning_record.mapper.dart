// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'learning_record.dart';

class LearningRecordMapper extends ClassMapperBase<LearningRecord> {
  LearningRecordMapper._();

  static LearningRecordMapper? _instance;
  static LearningRecordMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LearningRecordMapper._());
      LearningDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LearningRecord';

  static String _$createdDate(LearningRecord v) => v.createdDate;
  static const Field<LearningRecord, String> _f$createdDate =
      Field('createdDate', _$createdDate);
  static String _$modifiedDate(LearningRecord v) => v.modifiedDate;
  static const Field<LearningRecord, String> _f$modifiedDate =
      Field('modifiedDate', _$modifiedDate);
  static String _$userId(LearningRecord v) => v.userId;
  static const Field<LearningRecord, String> _f$userId =
      Field('userId', _$userId, key: r'user_id');
  static String _$employeeId(LearningRecord v) => v.employeeId;
  static const Field<LearningRecord, String> _f$employeeId =
      Field('employeeId', _$employeeId, key: r'employee_id');
  static String _$firstname(LearningRecord v) => v.firstname;
  static const Field<LearningRecord, String> _f$firstname =
      Field('firstname', _$firstname);
  static LearningData _$learningData(LearningRecord v) => v.learningData;
  static const Field<LearningRecord, LearningData> _f$learningData =
      Field('learningData', _$learningData, key: r'learning_data');

  @override
  final MappableFields<LearningRecord> fields = const {
    #createdDate: _f$createdDate,
    #modifiedDate: _f$modifiedDate,
    #userId: _f$userId,
    #employeeId: _f$employeeId,
    #firstname: _f$firstname,
    #learningData: _f$learningData,
  };

  static LearningRecord _instantiate(DecodingData data) {
    return LearningRecord(
        createdDate: data.dec(_f$createdDate),
        modifiedDate: data.dec(_f$modifiedDate),
        userId: data.dec(_f$userId),
        employeeId: data.dec(_f$employeeId),
        firstname: data.dec(_f$firstname),
        learningData: data.dec(_f$learningData));
  }

  @override
  final Function instantiate = _instantiate;

  static LearningRecord fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LearningRecord>(map);
  }

  static LearningRecord fromJson(String json) {
    return ensureInitialized().decodeJson<LearningRecord>(json);
  }
}

mixin LearningRecordMappable {
  String toJson() {
    return LearningRecordMapper.ensureInitialized()
        .encodeJson<LearningRecord>(this as LearningRecord);
  }

  Map<String, dynamic> toMap() {
    return LearningRecordMapper.ensureInitialized()
        .encodeMap<LearningRecord>(this as LearningRecord);
  }

  LearningRecordCopyWith<LearningRecord, LearningRecord, LearningRecord>
      get copyWith =>
          _LearningRecordCopyWithImpl<LearningRecord, LearningRecord>(
              this as LearningRecord, $identity, $identity);
  @override
  String toString() {
    return LearningRecordMapper.ensureInitialized()
        .stringifyValue(this as LearningRecord);
  }

  @override
  bool operator ==(Object other) {
    return LearningRecordMapper.ensureInitialized()
        .equalsValue(this as LearningRecord, other);
  }

  @override
  int get hashCode {
    return LearningRecordMapper.ensureInitialized()
        .hashValue(this as LearningRecord);
  }
}

extension LearningRecordValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LearningRecord, $Out> {
  LearningRecordCopyWith<$R, LearningRecord, $Out> get $asLearningRecord =>
      $base.as((v, t, t2) => _LearningRecordCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LearningRecordCopyWith<$R, $In extends LearningRecord, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  LearningDataCopyWith<$R, LearningData, LearningData> get learningData;
  $R call(
      {String? createdDate,
      String? modifiedDate,
      String? userId,
      String? employeeId,
      String? firstname,
      LearningData? learningData});
  LearningRecordCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LearningRecordCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LearningRecord, $Out>
    implements LearningRecordCopyWith<$R, LearningRecord, $Out> {
  _LearningRecordCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LearningRecord> $mapper =
      LearningRecordMapper.ensureInitialized();
  @override
  LearningDataCopyWith<$R, LearningData, LearningData> get learningData =>
      $value.learningData.copyWith.$chain((v) => call(learningData: v));
  @override
  $R call(
          {String? createdDate,
          String? modifiedDate,
          String? userId,
          String? employeeId,
          String? firstname,
          LearningData? learningData}) =>
      $apply(FieldCopyWithData({
        if (createdDate != null) #createdDate: createdDate,
        if (modifiedDate != null) #modifiedDate: modifiedDate,
        if (userId != null) #userId: userId,
        if (employeeId != null) #employeeId: employeeId,
        if (firstname != null) #firstname: firstname,
        if (learningData != null) #learningData: learningData
      }));
  @override
  LearningRecord $make(CopyWithData data) => LearningRecord(
      createdDate: data.get(#createdDate, or: $value.createdDate),
      modifiedDate: data.get(#modifiedDate, or: $value.modifiedDate),
      userId: data.get(#userId, or: $value.userId),
      employeeId: data.get(#employeeId, or: $value.employeeId),
      firstname: data.get(#firstname, or: $value.firstname),
      learningData: data.get(#learningData, or: $value.learningData));

  @override
  LearningRecordCopyWith<$R2, LearningRecord, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LearningRecordCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
