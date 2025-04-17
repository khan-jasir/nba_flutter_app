// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'task_response.dart';

class TaskResponseMapper extends ClassMapperBase<TaskResponse> {
  TaskResponseMapper._();

  static TaskResponseMapper? _instance;
  static TaskResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskResponseMapper._());
      TaskDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TaskResponse';

  static bool _$success(TaskResponse v) => v.success;
  static const Field<TaskResponse, bool> _f$success =
      Field('success', _$success);
  static String _$message(TaskResponse v) => v.message;
  static const Field<TaskResponse, String> _f$message =
      Field('message', _$message);
  static TaskData _$data(TaskResponse v) => v.data;
  static const Field<TaskResponse, TaskData> _f$data = Field('data', _$data);

  @override
  final MappableFields<TaskResponse> fields = const {
    #success: _f$success,
    #message: _f$message,
    #data: _f$data,
  };

  static TaskResponse _instantiate(DecodingData data) {
    return TaskResponse(
        success: data.dec(_f$success),
        message: data.dec(_f$message),
        data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskResponse>(map);
  }

  static TaskResponse fromJson(String json) {
    return ensureInitialized().decodeJson<TaskResponse>(json);
  }
}

mixin TaskResponseMappable {
  String toJson() {
    return TaskResponseMapper.ensureInitialized()
        .encodeJson<TaskResponse>(this as TaskResponse);
  }

  Map<String, dynamic> toMap() {
    return TaskResponseMapper.ensureInitialized()
        .encodeMap<TaskResponse>(this as TaskResponse);
  }

  TaskResponseCopyWith<TaskResponse, TaskResponse, TaskResponse> get copyWith =>
      _TaskResponseCopyWithImpl<TaskResponse, TaskResponse>(
          this as TaskResponse, $identity, $identity);
  @override
  String toString() {
    return TaskResponseMapper.ensureInitialized()
        .stringifyValue(this as TaskResponse);
  }

  @override
  bool operator ==(Object other) {
    return TaskResponseMapper.ensureInitialized()
        .equalsValue(this as TaskResponse, other);
  }

  @override
  int get hashCode {
    return TaskResponseMapper.ensureInitialized()
        .hashValue(this as TaskResponse);
  }
}

extension TaskResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskResponse, $Out> {
  TaskResponseCopyWith<$R, TaskResponse, $Out> get $asTaskResponse =>
      $base.as((v, t, t2) => _TaskResponseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TaskResponseCopyWith<$R, $In extends TaskResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TaskDataCopyWith<$R, TaskData, TaskData> get data;
  $R call({bool? success, String? message, TaskData? data});
  TaskResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TaskResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskResponse, $Out>
    implements TaskResponseCopyWith<$R, TaskResponse, $Out> {
  _TaskResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskResponse> $mapper =
      TaskResponseMapper.ensureInitialized();
  @override
  TaskDataCopyWith<$R, TaskData, TaskData> get data =>
      $value.data.copyWith.$chain((v) => call(data: v));
  @override
  $R call({bool? success, String? message, TaskData? data}) =>
      $apply(FieldCopyWithData({
        if (success != null) #success: success,
        if (message != null) #message: message,
        if (data != null) #data: data
      }));
  @override
  TaskResponse $make(CopyWithData data) => TaskResponse(
      success: data.get(#success, or: $value.success),
      message: data.get(#message, or: $value.message),
      data: data.get(#data, or: $value.data));

  @override
  TaskResponseCopyWith<$R2, TaskResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
