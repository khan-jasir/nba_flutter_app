// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'learning_course.dart';

class CourseCompletionStatusMapper extends EnumMapper<CourseCompletionStatus> {
  CourseCompletionStatusMapper._();

  static CourseCompletionStatusMapper? _instance;
  static CourseCompletionStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CourseCompletionStatusMapper._());
    }
    return _instance!;
  }

  static CourseCompletionStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CourseCompletionStatus decode(dynamic value) {
    switch (value) {
      case r'no':
        return CourseCompletionStatus.no;
      case r'yes':
        return CourseCompletionStatus.yes;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(CourseCompletionStatus self) {
    switch (self) {
      case CourseCompletionStatus.no:
        return r'no';
      case CourseCompletionStatus.yes:
        return r'yes';
    }
  }
}

extension CourseCompletionStatusMapperExtension on CourseCompletionStatus {
  String toValue() {
    CourseCompletionStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<CourseCompletionStatus>(this)
        as String;
  }
}

class LearningCourseMapper extends ClassMapperBase<LearningCourse> {
  LearningCourseMapper._();

  static LearningCourseMapper? _instance;
  static LearningCourseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LearningCourseMapper._());
      CourseCompletionStatusMapper.ensureInitialized();
      LearningModuleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LearningCourse';

  static String _$courseId(LearningCourse v) => v.courseId;
  static const Field<LearningCourse, String> _f$courseId =
      Field('courseId', _$courseId, key: r'course_id');
  static String _$courseName(LearningCourse v) => v.courseName;
  static const Field<LearningCourse, String> _f$courseName =
      Field('courseName', _$courseName, key: r'course_name');
  static CourseCompletionStatus _$isCompleted(LearningCourse v) =>
      v.isCompleted;
  static const Field<LearningCourse, CourseCompletionStatus> _f$isCompleted =
      Field('isCompleted', _$isCompleted,
          key: r'is_completed', hook: CourseCompletionHook());
  static String? _$courseActualStartDate(LearningCourse v) =>
      v.courseActualStartDate;
  static const Field<LearningCourse, String> _f$courseActualStartDate = Field(
      'courseActualStartDate', _$courseActualStartDate,
      key: r'course_actual_start_date');
  static String? _$courseActualEndDate(LearningCourse v) =>
      v.courseActualEndDate;
  static const Field<LearningCourse, String> _f$courseActualEndDate = Field(
      'courseActualEndDate', _$courseActualEndDate,
      key: r'course_actual_end_date');
  static String? _$courseActualDueDate(LearningCourse v) =>
      v.courseActualDueDate;
  static const Field<LearningCourse, String> _f$courseActualDueDate = Field(
      'courseActualDueDate', _$courseActualDueDate,
      key: r'course_actual_due_date');
  static String? _$userStartDate(LearningCourse v) => v.userStartDate;
  static const Field<LearningCourse, String> _f$userStartDate = Field(
      'userStartDate', _$userStartDate,
      key: r'user_start_date', opt: true);
  static String? _$userTotalDuration(LearningCourse v) => v.userTotalDuration;
  static const Field<LearningCourse, String> _f$userTotalDuration = Field(
      'userTotalDuration', _$userTotalDuration,
      key: r'user_total_duration', opt: true);
  static List<LearningModule> _$modules(LearningCourse v) => v.modules;
  static const Field<LearningCourse, List<LearningModule>> _f$modules =
      Field('modules', _$modules);

  @override
  final MappableFields<LearningCourse> fields = const {
    #courseId: _f$courseId,
    #courseName: _f$courseName,
    #isCompleted: _f$isCompleted,
    #courseActualStartDate: _f$courseActualStartDate,
    #courseActualEndDate: _f$courseActualEndDate,
    #courseActualDueDate: _f$courseActualDueDate,
    #userStartDate: _f$userStartDate,
    #userTotalDuration: _f$userTotalDuration,
    #modules: _f$modules,
  };

  static LearningCourse _instantiate(DecodingData data) {
    return LearningCourse(
        courseId: data.dec(_f$courseId),
        courseName: data.dec(_f$courseName),
        isCompleted: data.dec(_f$isCompleted),
        courseActualStartDate: data.dec(_f$courseActualStartDate),
        courseActualEndDate: data.dec(_f$courseActualEndDate),
        courseActualDueDate: data.dec(_f$courseActualDueDate),
        userStartDate: data.dec(_f$userStartDate),
        userTotalDuration: data.dec(_f$userTotalDuration),
        modules: data.dec(_f$modules));
  }

  @override
  final Function instantiate = _instantiate;

  static LearningCourse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LearningCourse>(map);
  }

  static LearningCourse fromJson(String json) {
    return ensureInitialized().decodeJson<LearningCourse>(json);
  }
}

mixin LearningCourseMappable {
  String toJson() {
    return LearningCourseMapper.ensureInitialized()
        .encodeJson<LearningCourse>(this as LearningCourse);
  }

  Map<String, dynamic> toMap() {
    return LearningCourseMapper.ensureInitialized()
        .encodeMap<LearningCourse>(this as LearningCourse);
  }

  LearningCourseCopyWith<LearningCourse, LearningCourse, LearningCourse>
      get copyWith =>
          _LearningCourseCopyWithImpl<LearningCourse, LearningCourse>(
              this as LearningCourse, $identity, $identity);
  @override
  String toString() {
    return LearningCourseMapper.ensureInitialized()
        .stringifyValue(this as LearningCourse);
  }

  @override
  bool operator ==(Object other) {
    return LearningCourseMapper.ensureInitialized()
        .equalsValue(this as LearningCourse, other);
  }

  @override
  int get hashCode {
    return LearningCourseMapper.ensureInitialized()
        .hashValue(this as LearningCourse);
  }
}

extension LearningCourseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LearningCourse, $Out> {
  LearningCourseCopyWith<$R, LearningCourse, $Out> get $asLearningCourse =>
      $base.as((v, t, t2) => _LearningCourseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LearningCourseCopyWith<$R, $In extends LearningCourse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, LearningModule,
      LearningModuleCopyWith<$R, LearningModule, LearningModule>> get modules;
  $R call(
      {String? courseId,
      String? courseName,
      CourseCompletionStatus? isCompleted,
      String? courseActualStartDate,
      String? courseActualEndDate,
      String? courseActualDueDate,
      String? userStartDate,
      String? userTotalDuration,
      List<LearningModule>? modules});
  LearningCourseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LearningCourseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LearningCourse, $Out>
    implements LearningCourseCopyWith<$R, LearningCourse, $Out> {
  _LearningCourseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LearningCourse> $mapper =
      LearningCourseMapper.ensureInitialized();
  @override
  ListCopyWith<$R, LearningModule,
          LearningModuleCopyWith<$R, LearningModule, LearningModule>>
      get modules => ListCopyWith($value.modules,
          (v, t) => v.copyWith.$chain(t), (v) => call(modules: v));
  @override
  $R call(
          {String? courseId,
          String? courseName,
          CourseCompletionStatus? isCompleted,
          Object? courseActualStartDate = $none,
          Object? courseActualEndDate = $none,
          Object? courseActualDueDate = $none,
          Object? userStartDate = $none,
          Object? userTotalDuration = $none,
          List<LearningModule>? modules}) =>
      $apply(FieldCopyWithData({
        if (courseId != null) #courseId: courseId,
        if (courseName != null) #courseName: courseName,
        if (isCompleted != null) #isCompleted: isCompleted,
        if (courseActualStartDate != $none)
          #courseActualStartDate: courseActualStartDate,
        if (courseActualEndDate != $none)
          #courseActualEndDate: courseActualEndDate,
        if (courseActualDueDate != $none)
          #courseActualDueDate: courseActualDueDate,
        if (userStartDate != $none) #userStartDate: userStartDate,
        if (userTotalDuration != $none) #userTotalDuration: userTotalDuration,
        if (modules != null) #modules: modules
      }));
  @override
  LearningCourse $make(CopyWithData data) => LearningCourse(
      courseId: data.get(#courseId, or: $value.courseId),
      courseName: data.get(#courseName, or: $value.courseName),
      isCompleted: data.get(#isCompleted, or: $value.isCompleted),
      courseActualStartDate:
          data.get(#courseActualStartDate, or: $value.courseActualStartDate),
      courseActualEndDate:
          data.get(#courseActualEndDate, or: $value.courseActualEndDate),
      courseActualDueDate:
          data.get(#courseActualDueDate, or: $value.courseActualDueDate),
      userStartDate: data.get(#userStartDate, or: $value.userStartDate),
      userTotalDuration:
          data.get(#userTotalDuration, or: $value.userTotalDuration),
      modules: data.get(#modules, or: $value.modules));

  @override
  LearningCourseCopyWith<$R2, LearningCourse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LearningCourseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
