// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'learning_data_summary.dart';

class LearningDataSummaryMapper extends ClassMapperBase<LearningDataSummary> {
  LearningDataSummaryMapper._();

  static LearningDataSummaryMapper? _instance;
  static LearningDataSummaryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LearningDataSummaryMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LearningDataSummary';

  static int? _$totalCourses(LearningDataSummary v) => v.totalCourses;
  static const Field<LearningDataSummary, int> _f$totalCourses =
      Field('totalCourses', _$totalCourses, opt: true);
  static int? _$completedCourses(LearningDataSummary v) => v.completedCourses;
  static const Field<LearningDataSummary, int> _f$completedCourses =
      Field('completedCourses', _$completedCourses, opt: true);
  static int? _$notStartedCourses(LearningDataSummary v) => v.notStartedCourses;
  static const Field<LearningDataSummary, int> _f$notStartedCourses =
      Field('notStartedCourses', _$notStartedCourses, opt: true);
  static int? _$inProgressCourses(LearningDataSummary v) => v.inProgressCourses;
  static const Field<LearningDataSummary, int> _f$inProgressCourses =
      Field('inProgressCourses', _$inProgressCourses, opt: true);
  static int? _$totalMaterials(LearningDataSummary v) => v.totalMaterials;
  static const Field<LearningDataSummary, int> _f$totalMaterials =
      Field('totalMaterials', _$totalMaterials, opt: true);
  static int? _$completedMaterials(LearningDataSummary v) =>
      v.completedMaterials;
  static const Field<LearningDataSummary, int> _f$completedMaterials =
      Field('completedMaterials', _$completedMaterials, opt: true);
  static int? _$incompleteMaterials(LearningDataSummary v) =>
      v.incompleteMaterials;
  static const Field<LearningDataSummary, int> _f$incompleteMaterials =
      Field('incompleteMaterials', _$incompleteMaterials, opt: true);
  static int? _$inProgressMaterials(LearningDataSummary v) =>
      v.inProgressMaterials;
  static const Field<LearningDataSummary, int> _f$inProgressMaterials =
      Field('inProgressMaterials', _$inProgressMaterials, opt: true);

  @override
  final MappableFields<LearningDataSummary> fields = const {
    #totalCourses: _f$totalCourses,
    #completedCourses: _f$completedCourses,
    #notStartedCourses: _f$notStartedCourses,
    #inProgressCourses: _f$inProgressCourses,
    #totalMaterials: _f$totalMaterials,
    #completedMaterials: _f$completedMaterials,
    #incompleteMaterials: _f$incompleteMaterials,
    #inProgressMaterials: _f$inProgressMaterials,
  };

  static LearningDataSummary _instantiate(DecodingData data) {
    return LearningDataSummary(
        totalCourses: data.dec(_f$totalCourses),
        completedCourses: data.dec(_f$completedCourses),
        notStartedCourses: data.dec(_f$notStartedCourses),
        inProgressCourses: data.dec(_f$inProgressCourses),
        totalMaterials: data.dec(_f$totalMaterials),
        completedMaterials: data.dec(_f$completedMaterials),
        incompleteMaterials: data.dec(_f$incompleteMaterials),
        inProgressMaterials: data.dec(_f$inProgressMaterials));
  }

  @override
  final Function instantiate = _instantiate;

  static LearningDataSummary fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LearningDataSummary>(map);
  }

  static LearningDataSummary fromJson(String json) {
    return ensureInitialized().decodeJson<LearningDataSummary>(json);
  }
}

mixin LearningDataSummaryMappable {
  String toJson() {
    return LearningDataSummaryMapper.ensureInitialized()
        .encodeJson<LearningDataSummary>(this as LearningDataSummary);
  }

  Map<String, dynamic> toMap() {
    return LearningDataSummaryMapper.ensureInitialized()
        .encodeMap<LearningDataSummary>(this as LearningDataSummary);
  }

  LearningDataSummaryCopyWith<LearningDataSummary, LearningDataSummary,
      LearningDataSummary> get copyWith => _LearningDataSummaryCopyWithImpl<
          LearningDataSummary, LearningDataSummary>(
      this as LearningDataSummary, $identity, $identity);
  @override
  String toString() {
    return LearningDataSummaryMapper.ensureInitialized()
        .stringifyValue(this as LearningDataSummary);
  }

  @override
  bool operator ==(Object other) {
    return LearningDataSummaryMapper.ensureInitialized()
        .equalsValue(this as LearningDataSummary, other);
  }

  @override
  int get hashCode {
    return LearningDataSummaryMapper.ensureInitialized()
        .hashValue(this as LearningDataSummary);
  }
}

extension LearningDataSummaryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LearningDataSummary, $Out> {
  LearningDataSummaryCopyWith<$R, LearningDataSummary, $Out>
      get $asLearningDataSummary => $base.as(
          (v, t, t2) => _LearningDataSummaryCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LearningDataSummaryCopyWith<$R, $In extends LearningDataSummary,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? totalCourses,
      int? completedCourses,
      int? notStartedCourses,
      int? inProgressCourses,
      int? totalMaterials,
      int? completedMaterials,
      int? incompleteMaterials,
      int? inProgressMaterials});
  LearningDataSummaryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LearningDataSummaryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LearningDataSummary, $Out>
    implements LearningDataSummaryCopyWith<$R, LearningDataSummary, $Out> {
  _LearningDataSummaryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LearningDataSummary> $mapper =
      LearningDataSummaryMapper.ensureInitialized();
  @override
  $R call(
          {Object? totalCourses = $none,
          Object? completedCourses = $none,
          Object? notStartedCourses = $none,
          Object? inProgressCourses = $none,
          Object? totalMaterials = $none,
          Object? completedMaterials = $none,
          Object? incompleteMaterials = $none,
          Object? inProgressMaterials = $none}) =>
      $apply(FieldCopyWithData({
        if (totalCourses != $none) #totalCourses: totalCourses,
        if (completedCourses != $none) #completedCourses: completedCourses,
        if (notStartedCourses != $none) #notStartedCourses: notStartedCourses,
        if (inProgressCourses != $none) #inProgressCourses: inProgressCourses,
        if (totalMaterials != $none) #totalMaterials: totalMaterials,
        if (completedMaterials != $none)
          #completedMaterials: completedMaterials,
        if (incompleteMaterials != $none)
          #incompleteMaterials: incompleteMaterials,
        if (inProgressMaterials != $none)
          #inProgressMaterials: inProgressMaterials
      }));
  @override
  LearningDataSummary $make(CopyWithData data) => LearningDataSummary(
      totalCourses: data.get(#totalCourses, or: $value.totalCourses),
      completedCourses:
          data.get(#completedCourses, or: $value.completedCourses),
      notStartedCourses:
          data.get(#notStartedCourses, or: $value.notStartedCourses),
      inProgressCourses:
          data.get(#inProgressCourses, or: $value.inProgressCourses),
      totalMaterials: data.get(#totalMaterials, or: $value.totalMaterials),
      completedMaterials:
          data.get(#completedMaterials, or: $value.completedMaterials),
      incompleteMaterials:
          data.get(#incompleteMaterials, or: $value.incompleteMaterials),
      inProgressMaterials:
          data.get(#inProgressMaterials, or: $value.inProgressMaterials));

  @override
  LearningDataSummaryCopyWith<$R2, LearningDataSummary, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LearningDataSummaryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
