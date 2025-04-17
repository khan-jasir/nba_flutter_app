// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'task_data.dart';

class TaskDataMapper extends ClassMapperBase<TaskData> {
  TaskDataMapper._();

  static TaskDataMapper? _instance;
  static TaskDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskDataMapper._());
      TaskItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TaskData';

  static List<TaskItem>? _$items(TaskData v) => v.items;
  static const Field<TaskData, List<TaskItem>> _f$items =
      Field('items', _$items, opt: true);
  static int _$total(TaskData v) => v.total;
  static const Field<TaskData, int> _f$total = Field('total', _$total);
  static int _$size(TaskData v) => v.size;
  static const Field<TaskData, int> _f$size = Field('size', _$size);

  @override
  final MappableFields<TaskData> fields = const {
    #items: _f$items,
    #total: _f$total,
    #size: _f$size,
  };

  static TaskData _instantiate(DecodingData data) {
    return TaskData(
        items: data.dec(_f$items),
        total: data.dec(_f$total),
        size: data.dec(_f$size));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskData>(map);
  }

  static TaskData fromJson(String json) {
    return ensureInitialized().decodeJson<TaskData>(json);
  }
}

mixin TaskDataMappable {
  String toJson() {
    return TaskDataMapper.ensureInitialized()
        .encodeJson<TaskData>(this as TaskData);
  }

  Map<String, dynamic> toMap() {
    return TaskDataMapper.ensureInitialized()
        .encodeMap<TaskData>(this as TaskData);
  }

  TaskDataCopyWith<TaskData, TaskData, TaskData> get copyWith =>
      _TaskDataCopyWithImpl<TaskData, TaskData>(
          this as TaskData, $identity, $identity);
  @override
  String toString() {
    return TaskDataMapper.ensureInitialized().stringifyValue(this as TaskData);
  }

  @override
  bool operator ==(Object other) {
    return TaskDataMapper.ensureInitialized()
        .equalsValue(this as TaskData, other);
  }

  @override
  int get hashCode {
    return TaskDataMapper.ensureInitialized().hashValue(this as TaskData);
  }
}

extension TaskDataValueCopy<$R, $Out> on ObjectCopyWith<$R, TaskData, $Out> {
  TaskDataCopyWith<$R, TaskData, $Out> get $asTaskData =>
      $base.as((v, t, t2) => _TaskDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TaskDataCopyWith<$R, $In extends TaskData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TaskItem, TaskItemCopyWith<$R, TaskItem, TaskItem>>?
      get items;
  $R call({List<TaskItem>? items, int? total, int? size});
  TaskDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TaskDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskData, $Out>
    implements TaskDataCopyWith<$R, TaskData, $Out> {
  _TaskDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskData> $mapper =
      TaskDataMapper.ensureInitialized();
  @override
  ListCopyWith<$R, TaskItem, TaskItemCopyWith<$R, TaskItem, TaskItem>>?
      get items => $value.items != null
          ? ListCopyWith($value.items!, (v, t) => v.copyWith.$chain(t),
              (v) => call(items: v))
          : null;
  @override
  $R call({Object? items = $none, int? total, int? size}) =>
      $apply(FieldCopyWithData({
        if (items != $none) #items: items,
        if (total != null) #total: total,
        if (size != null) #size: size
      }));
  @override
  TaskData $make(CopyWithData data) => TaskData(
      items: data.get(#items, or: $value.items),
      total: data.get(#total, or: $value.total),
      size: data.get(#size, or: $value.size));

  @override
  TaskDataCopyWith<$R2, TaskData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
