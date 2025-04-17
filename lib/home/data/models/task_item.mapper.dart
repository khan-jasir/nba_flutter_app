// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'task_item.dart';

class PriorityLevelMapper extends EnumMapper<PriorityLevel> {
  PriorityLevelMapper._();

  static PriorityLevelMapper? _instance;
  static PriorityLevelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PriorityLevelMapper._());
    }
    return _instance!;
  }

  static PriorityLevel fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PriorityLevel decode(dynamic value) {
    switch (value) {
      case r'high':
        return PriorityLevel.high;
      case r'medium':
        return PriorityLevel.medium;
      case r'low':
        return PriorityLevel.low;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PriorityLevel self) {
    switch (self) {
      case PriorityLevel.high:
        return r'high';
      case PriorityLevel.medium:
        return r'medium';
      case PriorityLevel.low:
        return r'low';
    }
  }
}

extension PriorityLevelMapperExtension on PriorityLevel {
  String toValue() {
    PriorityLevelMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PriorityLevel>(this) as String;
  }
}

class TaskItemMapper extends ClassMapperBase<TaskItem> {
  TaskItemMapper._();

  static TaskItemMapper? _instance;
  static TaskItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskItemMapper._());
      PriorityLevelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TaskItem';

  static String _$taskName(TaskItem v) => v.taskName;
  static const Field<TaskItem, String> _f$taskName =
      Field('taskName', _$taskName);
  static String _$taskDescription(TaskItem v) => v.taskDescription;
  static const Field<TaskItem, String> _f$taskDescription =
      Field('taskDescription', _$taskDescription);
  static String? _$startDate(TaskItem v) => v.startDate;
  static const Field<TaskItem, String> _f$startDate =
      Field('startDate', _$startDate, opt: true);
  static String? _$endDate(TaskItem v) => v.endDate;
  static const Field<TaskItem, String> _f$endDate =
      Field('endDate', _$endDate, opt: true);
  static String? _$dueDate(TaskItem v) => v.dueDate;
  static const Field<TaskItem, String> _f$dueDate =
      Field('dueDate', _$dueDate, opt: true);
  static PriorityLevel _$priorityLevel(TaskItem v) => v.priorityLevel;
  static const Field<TaskItem, PriorityLevel> _f$priorityLevel =
      Field('priorityLevel', _$priorityLevel, hook: PriorityLevelHook());
  static String _$priorityOrder(TaskItem v) => v.priorityOrder;
  static const Field<TaskItem, String> _f$priorityOrder =
      Field('priorityOrder', _$priorityOrder);
  static String _$taskSourceId(TaskItem v) => v.taskSourceId;
  static const Field<TaskItem, String> _f$taskSourceId =
      Field('taskSourceId', _$taskSourceId);
  static String _$finalStatus(TaskItem v) => v.finalStatus;
  static const Field<TaskItem, String> _f$finalStatus =
      Field('finalStatus', _$finalStatus);
  static String? _$customerName(TaskItem v) => v.customerName;
  static const Field<TaskItem, String> _f$customerName =
      Field('customerName', _$customerName, opt: true);
  static String? _$lob(TaskItem v) => v.lob;
  static const Field<TaskItem, String> _f$lob = Field('lob', _$lob, opt: true);

  @override
  final MappableFields<TaskItem> fields = const {
    #taskName: _f$taskName,
    #taskDescription: _f$taskDescription,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #dueDate: _f$dueDate,
    #priorityLevel: _f$priorityLevel,
    #priorityOrder: _f$priorityOrder,
    #taskSourceId: _f$taskSourceId,
    #finalStatus: _f$finalStatus,
    #customerName: _f$customerName,
    #lob: _f$lob,
  };

  static TaskItem _instantiate(DecodingData data) {
    return TaskItem(
        taskName: data.dec(_f$taskName),
        taskDescription: data.dec(_f$taskDescription),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        dueDate: data.dec(_f$dueDate),
        priorityLevel: data.dec(_f$priorityLevel),
        priorityOrder: data.dec(_f$priorityOrder),
        taskSourceId: data.dec(_f$taskSourceId),
        finalStatus: data.dec(_f$finalStatus),
        customerName: data.dec(_f$customerName),
        lob: data.dec(_f$lob));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskItem>(map);
  }

  static TaskItem fromJson(String json) {
    return ensureInitialized().decodeJson<TaskItem>(json);
  }
}

mixin TaskItemMappable {
  String toJson() {
    return TaskItemMapper.ensureInitialized()
        .encodeJson<TaskItem>(this as TaskItem);
  }

  Map<String, dynamic> toMap() {
    return TaskItemMapper.ensureInitialized()
        .encodeMap<TaskItem>(this as TaskItem);
  }

  TaskItemCopyWith<TaskItem, TaskItem, TaskItem> get copyWith =>
      _TaskItemCopyWithImpl<TaskItem, TaskItem>(
          this as TaskItem, $identity, $identity);
  @override
  String toString() {
    return TaskItemMapper.ensureInitialized().stringifyValue(this as TaskItem);
  }

  @override
  bool operator ==(Object other) {
    return TaskItemMapper.ensureInitialized()
        .equalsValue(this as TaskItem, other);
  }

  @override
  int get hashCode {
    return TaskItemMapper.ensureInitialized().hashValue(this as TaskItem);
  }
}

extension TaskItemValueCopy<$R, $Out> on ObjectCopyWith<$R, TaskItem, $Out> {
  TaskItemCopyWith<$R, TaskItem, $Out> get $asTaskItem =>
      $base.as((v, t, t2) => _TaskItemCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TaskItemCopyWith<$R, $In extends TaskItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? taskName,
      String? taskDescription,
      String? startDate,
      String? endDate,
      String? dueDate,
      PriorityLevel? priorityLevel,
      String? priorityOrder,
      String? taskSourceId,
      String? finalStatus,
      String? customerName,
      String? lob});
  TaskItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TaskItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskItem, $Out>
    implements TaskItemCopyWith<$R, TaskItem, $Out> {
  _TaskItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskItem> $mapper =
      TaskItemMapper.ensureInitialized();
  @override
  $R call(
          {String? taskName,
          String? taskDescription,
          Object? startDate = $none,
          Object? endDate = $none,
          Object? dueDate = $none,
          PriorityLevel? priorityLevel,
          String? priorityOrder,
          String? taskSourceId,
          String? finalStatus,
          Object? customerName = $none,
          Object? lob = $none}) =>
      $apply(FieldCopyWithData({
        if (taskName != null) #taskName: taskName,
        if (taskDescription != null) #taskDescription: taskDescription,
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate,
        if (dueDate != $none) #dueDate: dueDate,
        if (priorityLevel != null) #priorityLevel: priorityLevel,
        if (priorityOrder != null) #priorityOrder: priorityOrder,
        if (taskSourceId != null) #taskSourceId: taskSourceId,
        if (finalStatus != null) #finalStatus: finalStatus,
        if (customerName != $none) #customerName: customerName,
        if (lob != $none) #lob: lob
      }));
  @override
  TaskItem $make(CopyWithData data) => TaskItem(
      taskName: data.get(#taskName, or: $value.taskName),
      taskDescription: data.get(#taskDescription, or: $value.taskDescription),
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate),
      dueDate: data.get(#dueDate, or: $value.dueDate),
      priorityLevel: data.get(#priorityLevel, or: $value.priorityLevel),
      priorityOrder: data.get(#priorityOrder, or: $value.priorityOrder),
      taskSourceId: data.get(#taskSourceId, or: $value.taskSourceId),
      finalStatus: data.get(#finalStatus, or: $value.finalStatus),
      customerName: data.get(#customerName, or: $value.customerName),
      lob: data.get(#lob, or: $value.lob));

  @override
  TaskItemCopyWith<$R2, TaskItem, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskItemCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
