// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'learning_response.dart';

class LearningResponseMapper extends ClassMapperBase<LearningResponse> {
  LearningResponseMapper._();

  static LearningResponseMapper? _instance;
  static LearningResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LearningResponseMapper._());
      LearningDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LearningResponse';

  static bool? _$success(LearningResponse v) => v.success;
  static const Field<LearningResponse, bool> _f$success =
      Field('success', _$success, opt: true);
  static String? _$message(LearningResponse v) => v.message;
  static const Field<LearningResponse, String> _f$message =
      Field('message', _$message, opt: true);
  static LearningData? _$data(LearningResponse v) => v.data;
  static const Field<LearningResponse, LearningData> _f$data =
      Field('data', _$data, opt: true);

  @override
  final MappableFields<LearningResponse> fields = const {
    #success: _f$success,
    #message: _f$message,
    #data: _f$data,
  };

  static LearningResponse _instantiate(DecodingData data) {
    return LearningResponse(
        success: data.dec(_f$success),
        message: data.dec(_f$message),
        data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static LearningResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LearningResponse>(map);
  }

  static LearningResponse fromJson(String json) {
    return ensureInitialized().decodeJson<LearningResponse>(json);
  }
}

mixin LearningResponseMappable {
  String toJson() {
    return LearningResponseMapper.ensureInitialized()
        .encodeJson<LearningResponse>(this as LearningResponse);
  }

  Map<String, dynamic> toMap() {
    return LearningResponseMapper.ensureInitialized()
        .encodeMap<LearningResponse>(this as LearningResponse);
  }

  LearningResponseCopyWith<LearningResponse, LearningResponse, LearningResponse>
      get copyWith =>
          _LearningResponseCopyWithImpl<LearningResponse, LearningResponse>(
              this as LearningResponse, $identity, $identity);
  @override
  String toString() {
    return LearningResponseMapper.ensureInitialized()
        .stringifyValue(this as LearningResponse);
  }

  @override
  bool operator ==(Object other) {
    return LearningResponseMapper.ensureInitialized()
        .equalsValue(this as LearningResponse, other);
  }

  @override
  int get hashCode {
    return LearningResponseMapper.ensureInitialized()
        .hashValue(this as LearningResponse);
  }
}

extension LearningResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LearningResponse, $Out> {
  LearningResponseCopyWith<$R, LearningResponse, $Out>
      get $asLearningResponse => $base
          .as((v, t, t2) => _LearningResponseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LearningResponseCopyWith<$R, $In extends LearningResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  LearningDataCopyWith<$R, LearningData, LearningData>? get data;
  $R call({bool? success, String? message, LearningData? data});
  LearningResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LearningResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LearningResponse, $Out>
    implements LearningResponseCopyWith<$R, LearningResponse, $Out> {
  _LearningResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LearningResponse> $mapper =
      LearningResponseMapper.ensureInitialized();
  @override
  LearningDataCopyWith<$R, LearningData, LearningData>? get data =>
      $value.data?.copyWith.$chain((v) => call(data: v));
  @override
  $R call(
          {Object? success = $none,
          Object? message = $none,
          Object? data = $none}) =>
      $apply(FieldCopyWithData({
        if (success != $none) #success: success,
        if (message != $none) #message: message,
        if (data != $none) #data: data
      }));
  @override
  LearningResponse $make(CopyWithData data) => LearningResponse(
      success: data.get(#success, or: $value.success),
      message: data.get(#message, or: $value.message),
      data: data.get(#data, or: $value.data));

  @override
  LearningResponseCopyWith<$R2, LearningResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LearningResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
