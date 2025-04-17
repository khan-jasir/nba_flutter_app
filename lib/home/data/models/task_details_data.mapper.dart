// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'task_details_data.dart';

class TaskDetailsDataMapper extends ClassMapperBase<TaskDetailsData> {
  TaskDetailsDataMapper._();

  static TaskDetailsDataMapper? _instance;
  static TaskDetailsDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskDetailsDataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TaskDetailsData';

  static String? _$referredBy(TaskDetailsData v) => v.referredBy;
  static const Field<TaskDetailsData, String> _f$referredBy =
      Field('referredBy', _$referredBy, opt: true);
  static String? _$title(TaskDetailsData v) => v.title;
  static const Field<TaskDetailsData, String> _f$title =
      Field('title', _$title, opt: true);
  static String? _$fullName(TaskDetailsData v) => v.fullName;
  static const Field<TaskDetailsData, String> _f$fullName =
      Field('fullName', _$fullName, opt: true);
  static String? _$emailId(TaskDetailsData v) => v.emailId;
  static const Field<TaskDetailsData, String> _f$emailId =
      Field('emailId', _$emailId, opt: true);
  static String? _$countryCode(TaskDetailsData v) => v.countryCode;
  static const Field<TaskDetailsData, String> _f$countryCode =
      Field('countryCode', _$countryCode, opt: true);
  static String? _$mobileNo(TaskDetailsData v) => v.mobileNo;
  static const Field<TaskDetailsData, String> _f$mobileNo =
      Field('mobileNo', _$mobileNo, opt: true);
  static bool? _$status(TaskDetailsData v) => v.status;
  static const Field<TaskDetailsData, bool> _f$status =
      Field('status', _$status, opt: true);
  static String? _$dob(TaskDetailsData v) => v.dob;
  static const Field<TaskDetailsData, String> _f$dob =
      Field('dob', _$dob, opt: true);
  static String? _$gender(TaskDetailsData v) => v.gender;
  static const Field<TaskDetailsData, String> _f$gender =
      Field('gender', _$gender, opt: true);
  static String? _$lob(TaskDetailsData v) => v.lob;
  static const Field<TaskDetailsData, String> _f$lob =
      Field('lob', _$lob, opt: true);

  @override
  final MappableFields<TaskDetailsData> fields = const {
    #referredBy: _f$referredBy,
    #title: _f$title,
    #fullName: _f$fullName,
    #emailId: _f$emailId,
    #countryCode: _f$countryCode,
    #mobileNo: _f$mobileNo,
    #status: _f$status,
    #dob: _f$dob,
    #gender: _f$gender,
    #lob: _f$lob,
  };

  static TaskDetailsData _instantiate(DecodingData data) {
    return TaskDetailsData(
        referredBy: data.dec(_f$referredBy),
        title: data.dec(_f$title),
        fullName: data.dec(_f$fullName),
        emailId: data.dec(_f$emailId),
        countryCode: data.dec(_f$countryCode),
        mobileNo: data.dec(_f$mobileNo),
        status: data.dec(_f$status),
        dob: data.dec(_f$dob),
        gender: data.dec(_f$gender),
        lob: data.dec(_f$lob));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskDetailsData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskDetailsData>(map);
  }

  static TaskDetailsData fromJson(String json) {
    return ensureInitialized().decodeJson<TaskDetailsData>(json);
  }
}

mixin TaskDetailsDataMappable {
  String toJson() {
    return TaskDetailsDataMapper.ensureInitialized()
        .encodeJson<TaskDetailsData>(this as TaskDetailsData);
  }

  Map<String, dynamic> toMap() {
    return TaskDetailsDataMapper.ensureInitialized()
        .encodeMap<TaskDetailsData>(this as TaskDetailsData);
  }

  TaskDetailsDataCopyWith<TaskDetailsData, TaskDetailsData, TaskDetailsData>
      get copyWith =>
          _TaskDetailsDataCopyWithImpl<TaskDetailsData, TaskDetailsData>(
              this as TaskDetailsData, $identity, $identity);
  @override
  String toString() {
    return TaskDetailsDataMapper.ensureInitialized()
        .stringifyValue(this as TaskDetailsData);
  }

  @override
  bool operator ==(Object other) {
    return TaskDetailsDataMapper.ensureInitialized()
        .equalsValue(this as TaskDetailsData, other);
  }

  @override
  int get hashCode {
    return TaskDetailsDataMapper.ensureInitialized()
        .hashValue(this as TaskDetailsData);
  }
}

extension TaskDetailsDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskDetailsData, $Out> {
  TaskDetailsDataCopyWith<$R, TaskDetailsData, $Out> get $asTaskDetailsData =>
      $base.as((v, t, t2) => _TaskDetailsDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TaskDetailsDataCopyWith<$R, $In extends TaskDetailsData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? referredBy,
      String? title,
      String? fullName,
      String? emailId,
      String? countryCode,
      String? mobileNo,
      bool? status,
      String? dob,
      String? gender,
      String? lob});
  TaskDetailsDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TaskDetailsDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskDetailsData, $Out>
    implements TaskDetailsDataCopyWith<$R, TaskDetailsData, $Out> {
  _TaskDetailsDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskDetailsData> $mapper =
      TaskDetailsDataMapper.ensureInitialized();
  @override
  $R call(
          {Object? referredBy = $none,
          Object? title = $none,
          Object? fullName = $none,
          Object? emailId = $none,
          Object? countryCode = $none,
          Object? mobileNo = $none,
          Object? status = $none,
          Object? dob = $none,
          Object? gender = $none,
          Object? lob = $none}) =>
      $apply(FieldCopyWithData({
        if (referredBy != $none) #referredBy: referredBy,
        if (title != $none) #title: title,
        if (fullName != $none) #fullName: fullName,
        if (emailId != $none) #emailId: emailId,
        if (countryCode != $none) #countryCode: countryCode,
        if (mobileNo != $none) #mobileNo: mobileNo,
        if (status != $none) #status: status,
        if (dob != $none) #dob: dob,
        if (gender != $none) #gender: gender,
        if (lob != $none) #lob: lob
      }));
  @override
  TaskDetailsData $make(CopyWithData data) => TaskDetailsData(
      referredBy: data.get(#referredBy, or: $value.referredBy),
      title: data.get(#title, or: $value.title),
      fullName: data.get(#fullName, or: $value.fullName),
      emailId: data.get(#emailId, or: $value.emailId),
      countryCode: data.get(#countryCode, or: $value.countryCode),
      mobileNo: data.get(#mobileNo, or: $value.mobileNo),
      status: data.get(#status, or: $value.status),
      dob: data.get(#dob, or: $value.dob),
      gender: data.get(#gender, or: $value.gender),
      lob: data.get(#lob, or: $value.lob));

  @override
  TaskDetailsDataCopyWith<$R2, TaskDetailsData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskDetailsDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
