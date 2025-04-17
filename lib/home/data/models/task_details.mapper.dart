// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'task_details.dart';

class TaskDetailsMapper extends ClassMapperBase<TaskDetails> {
  TaskDetailsMapper._();

  static TaskDetailsMapper? _instance;
  static TaskDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskDetailsMapper._());
      TaskDetailsDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TaskDetails';

  static bool _$success(TaskDetails v) => v.success;
  static const Field<TaskDetails, bool> _f$success =
      Field('success', _$success);
  static String _$message(TaskDetails v) => v.message;
  static const Field<TaskDetails, String> _f$message =
      Field('message', _$message);
  static TaskDetailsData _$data(TaskDetails v) => v.data;
  static const Field<TaskDetails, TaskDetailsData> _f$data =
      Field('data', _$data);

  @override
  final MappableFields<TaskDetails> fields = const {
    #success: _f$success,
    #message: _f$message,
    #data: _f$data,
  };

  static TaskDetails _instantiate(DecodingData data) {
    return TaskDetails(
        success: data.dec(_f$success),
        message: data.dec(_f$message),
        data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskDetails>(map);
  }

  static TaskDetails fromJson(String json) {
    return ensureInitialized().decodeJson<TaskDetails>(json);
  }
}

mixin TaskDetailsMappable {
  String toJson() {
    return TaskDetailsMapper.ensureInitialized()
        .encodeJson<TaskDetails>(this as TaskDetails);
  }

  Map<String, dynamic> toMap() {
    return TaskDetailsMapper.ensureInitialized()
        .encodeMap<TaskDetails>(this as TaskDetails);
  }

  TaskDetailsCopyWith<TaskDetails, TaskDetails, TaskDetails> get copyWith =>
      _TaskDetailsCopyWithImpl<TaskDetails, TaskDetails>(
          this as TaskDetails, $identity, $identity);
  @override
  String toString() {
    return TaskDetailsMapper.ensureInitialized()
        .stringifyValue(this as TaskDetails);
  }

  @override
  bool operator ==(Object other) {
    return TaskDetailsMapper.ensureInitialized()
        .equalsValue(this as TaskDetails, other);
  }

  @override
  int get hashCode {
    return TaskDetailsMapper.ensureInitialized().hashValue(this as TaskDetails);
  }
}

extension TaskDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskDetails, $Out> {
  TaskDetailsCopyWith<$R, TaskDetails, $Out> get $asTaskDetails =>
      $base.as((v, t, t2) => _TaskDetailsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TaskDetailsCopyWith<$R, $In extends TaskDetails, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TaskDetailsDataCopyWith<$R, TaskDetailsData, TaskDetailsData> get data;
  $R call({bool? success, String? message, TaskDetailsData? data});
  TaskDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TaskDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskDetails, $Out>
    implements TaskDetailsCopyWith<$R, TaskDetails, $Out> {
  _TaskDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskDetails> $mapper =
      TaskDetailsMapper.ensureInitialized();
  @override
  TaskDetailsDataCopyWith<$R, TaskDetailsData, TaskDetailsData> get data =>
      $value.data.copyWith.$chain((v) => call(data: v));
  @override
  $R call({bool? success, String? message, TaskDetailsData? data}) =>
      $apply(FieldCopyWithData({
        if (success != null) #success: success,
        if (message != null) #message: message,
        if (data != null) #data: data
      }));
  @override
  TaskDetails $make(CopyWithData data) => TaskDetails(
      success: data.get(#success, or: $value.success),
      message: data.get(#message, or: $value.message),
      data: data.get(#data, or: $value.data));

  @override
  TaskDetailsCopyWith<$R2, TaskDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskDetailsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
