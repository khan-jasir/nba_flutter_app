// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'learning_data.dart';

class LearningDataMapper extends ClassMapperBase<LearningData> {
  LearningDataMapper._();

  static LearningDataMapper? _instance;
  static LearningDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LearningDataMapper._());
      LearningCourseMapper.ensureInitialized();
      LearningDataSummaryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LearningData';

  static List<LearningCourse> _$courses(LearningData v) => v.courses;
  static const Field<LearningData, List<LearningCourse>> _f$courses =
      Field('courses', _$courses);
  static LearningDataSummary _$summary(LearningData v) => v.summary;
  static const Field<LearningData, LearningDataSummary> _f$summary =
      Field('summary', _$summary);

  @override
  final MappableFields<LearningData> fields = const {
    #courses: _f$courses,
    #summary: _f$summary,
  };

  static LearningData _instantiate(DecodingData data) {
    return LearningData(
        courses: data.dec(_f$courses), summary: data.dec(_f$summary));
  }

  @override
  final Function instantiate = _instantiate;

  static LearningData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LearningData>(map);
  }

  static LearningData fromJson(String json) {
    return ensureInitialized().decodeJson<LearningData>(json);
  }
}

mixin LearningDataMappable {
  String toJson() {
    return LearningDataMapper.ensureInitialized()
        .encodeJson<LearningData>(this as LearningData);
  }

  Map<String, dynamic> toMap() {
    return LearningDataMapper.ensureInitialized()
        .encodeMap<LearningData>(this as LearningData);
  }

  LearningDataCopyWith<LearningData, LearningData, LearningData> get copyWith =>
      _LearningDataCopyWithImpl<LearningData, LearningData>(
          this as LearningData, $identity, $identity);
  @override
  String toString() {
    return LearningDataMapper.ensureInitialized()
        .stringifyValue(this as LearningData);
  }

  @override
  bool operator ==(Object other) {
    return LearningDataMapper.ensureInitialized()
        .equalsValue(this as LearningData, other);
  }

  @override
  int get hashCode {
    return LearningDataMapper.ensureInitialized()
        .hashValue(this as LearningData);
  }
}

extension LearningDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LearningData, $Out> {
  LearningDataCopyWith<$R, LearningData, $Out> get $asLearningData =>
      $base.as((v, t, t2) => _LearningDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LearningDataCopyWith<$R, $In extends LearningData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, LearningCourse,
      LearningCourseCopyWith<$R, LearningCourse, LearningCourse>> get courses;
  LearningDataSummaryCopyWith<$R, LearningDataSummary, LearningDataSummary>
      get summary;
  $R call({List<LearningCourse>? courses, LearningDataSummary? summary});
  LearningDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LearningDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LearningData, $Out>
    implements LearningDataCopyWith<$R, LearningData, $Out> {
  _LearningDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LearningData> $mapper =
      LearningDataMapper.ensureInitialized();
  @override
  ListCopyWith<$R, LearningCourse,
          LearningCourseCopyWith<$R, LearningCourse, LearningCourse>>
      get courses => ListCopyWith($value.courses,
          (v, t) => v.copyWith.$chain(t), (v) => call(courses: v));
  @override
  LearningDataSummaryCopyWith<$R, LearningDataSummary, LearningDataSummary>
      get summary => $value.summary.copyWith.$chain((v) => call(summary: v));
  @override
  $R call({List<LearningCourse>? courses, LearningDataSummary? summary}) =>
      $apply(FieldCopyWithData({
        if (courses != null) #courses: courses,
        if (summary != null) #summary: summary
      }));
  @override
  LearningData $make(CopyWithData data) => LearningData(
      courses: data.get(#courses, or: $value.courses),
      summary: data.get(#summary, or: $value.summary));

  @override
  LearningDataCopyWith<$R2, LearningData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LearningDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
