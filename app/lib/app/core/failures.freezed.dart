// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception exception) initializationFailure,
    required TResult Function(Exception exception) internalFailure,
    required TResult Function(dynamic failure) googleFailure,
    required TResult Function(dynamic error) unknownError,
    required TResult Function(String fromFunctionName) emptyValueReceived,
    required TResult Function(Map<String, dynamic> keys) parseJsonFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exception exception)? initializationFailure,
    TResult Function(Exception exception)? internalFailure,
    TResult Function(dynamic failure)? googleFailure,
    TResult Function(dynamic error)? unknownError,
    TResult Function(String fromFunctionName)? emptyValueReceived,
    TResult Function(Map<String, dynamic> keys)? parseJsonFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception exception)? initializationFailure,
    TResult Function(Exception exception)? internalFailure,
    TResult Function(dynamic failure)? googleFailure,
    TResult Function(dynamic error)? unknownError,
    TResult Function(String fromFunctionName)? emptyValueReceived,
    TResult Function(Map<String, dynamic> keys)? parseJsonFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializationFailure value)
        initializationFailure,
    required TResult Function(InternalFailure value) internalFailure,
    required TResult Function(GoogleFailure value) googleFailure,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(EmptyValueReceived value) emptyValueReceived,
    required TResult Function(ParseJsonFailure value) parseJsonFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitializationFailure value)? initializationFailure,
    TResult Function(InternalFailure value)? internalFailure,
    TResult Function(GoogleFailure value)? googleFailure,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(EmptyValueReceived value)? emptyValueReceived,
    TResult Function(ParseJsonFailure value)? parseJsonFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializationFailure value)? initializationFailure,
    TResult Function(InternalFailure value)? internalFailure,
    TResult Function(GoogleFailure value)? googleFailure,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(EmptyValueReceived value)? emptyValueReceived,
    TResult Function(ParseJsonFailure value)? parseJsonFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailureCopyWith<$Res> {
  factory $AppFailureCopyWith(
          AppFailure value, $Res Function(AppFailure) then) =
      _$AppFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppFailureCopyWithImpl<$Res> implements $AppFailureCopyWith<$Res> {
  _$AppFailureCopyWithImpl(this._value, this._then);

  final AppFailure _value;
  // ignore: unused_field
  final $Res Function(AppFailure) _then;
}

/// @nodoc
abstract class _$$InitializationFailureCopyWith<$Res> {
  factory _$$InitializationFailureCopyWith(_$InitializationFailure value,
          $Res Function(_$InitializationFailure) then) =
      __$$InitializationFailureCopyWithImpl<$Res>;
  $Res call({Exception exception});
}

/// @nodoc
class __$$InitializationFailureCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res>
    implements _$$InitializationFailureCopyWith<$Res> {
  __$$InitializationFailureCopyWithImpl(_$InitializationFailure _value,
      $Res Function(_$InitializationFailure) _then)
      : super(_value, (v) => _then(v as _$InitializationFailure));

  @override
  _$InitializationFailure get _value => super._value as _$InitializationFailure;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_$InitializationFailure(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$InitializationFailure implements InitializationFailure {
  const _$InitializationFailure(this.exception);

  @override
  final Exception exception;

  @override
  String toString() {
    return 'AppFailure.initializationFailure(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializationFailure &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$$InitializationFailureCopyWith<_$InitializationFailure> get copyWith =>
      __$$InitializationFailureCopyWithImpl<_$InitializationFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception exception) initializationFailure,
    required TResult Function(Exception exception) internalFailure,
    required TResult Function(dynamic failure) googleFailure,
    required TResult Function(dynamic error) unknownError,
    required TResult Function(String fromFunctionName) emptyValueReceived,
    required TResult Function(Map<String, dynamic> keys) parseJsonFailure,
  }) {
    return initializationFailure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exception exception)? initializationFailure,
    TResult Function(Exception exception)? internalFailure,
    TResult Function(dynamic failure)? googleFailure,
    TResult Function(dynamic error)? unknownError,
    TResult Function(String fromFunctionName)? emptyValueReceived,
    TResult Function(Map<String, dynamic> keys)? parseJsonFailure,
  }) {
    return initializationFailure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception exception)? initializationFailure,
    TResult Function(Exception exception)? internalFailure,
    TResult Function(dynamic failure)? googleFailure,
    TResult Function(dynamic error)? unknownError,
    TResult Function(String fromFunctionName)? emptyValueReceived,
    TResult Function(Map<String, dynamic> keys)? parseJsonFailure,
    required TResult orElse(),
  }) {
    if (initializationFailure != null) {
      return initializationFailure(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializationFailure value)
        initializationFailure,
    required TResult Function(InternalFailure value) internalFailure,
    required TResult Function(GoogleFailure value) googleFailure,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(EmptyValueReceived value) emptyValueReceived,
    required TResult Function(ParseJsonFailure value) parseJsonFailure,
  }) {
    return initializationFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitializationFailure value)? initializationFailure,
    TResult Function(InternalFailure value)? internalFailure,
    TResult Function(GoogleFailure value)? googleFailure,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(EmptyValueReceived value)? emptyValueReceived,
    TResult Function(ParseJsonFailure value)? parseJsonFailure,
  }) {
    return initializationFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializationFailure value)? initializationFailure,
    TResult Function(InternalFailure value)? internalFailure,
    TResult Function(GoogleFailure value)? googleFailure,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(EmptyValueReceived value)? emptyValueReceived,
    TResult Function(ParseJsonFailure value)? parseJsonFailure,
    required TResult orElse(),
  }) {
    if (initializationFailure != null) {
      return initializationFailure(this);
    }
    return orElse();
  }
}

abstract class InitializationFailure implements AppFailure {
  const factory InitializationFailure(final Exception exception) =
      _$InitializationFailure;

  Exception get exception;
  @JsonKey(ignore: true)
  _$$InitializationFailureCopyWith<_$InitializationFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InternalFailureCopyWith<$Res> {
  factory _$$InternalFailureCopyWith(
          _$InternalFailure value, $Res Function(_$InternalFailure) then) =
      __$$InternalFailureCopyWithImpl<$Res>;
  $Res call({Exception exception});
}

/// @nodoc
class __$$InternalFailureCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res>
    implements _$$InternalFailureCopyWith<$Res> {
  __$$InternalFailureCopyWithImpl(
      _$InternalFailure _value, $Res Function(_$InternalFailure) _then)
      : super(_value, (v) => _then(v as _$InternalFailure));

  @override
  _$InternalFailure get _value => super._value as _$InternalFailure;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_$InternalFailure(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$InternalFailure implements InternalFailure {
  const _$InternalFailure(this.exception);

  @override
  final Exception exception;

  @override
  String toString() {
    return 'AppFailure.internalFailure(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternalFailure &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$$InternalFailureCopyWith<_$InternalFailure> get copyWith =>
      __$$InternalFailureCopyWithImpl<_$InternalFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception exception) initializationFailure,
    required TResult Function(Exception exception) internalFailure,
    required TResult Function(dynamic failure) googleFailure,
    required TResult Function(dynamic error) unknownError,
    required TResult Function(String fromFunctionName) emptyValueReceived,
    required TResult Function(Map<String, dynamic> keys) parseJsonFailure,
  }) {
    return internalFailure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exception exception)? initializationFailure,
    TResult Function(Exception exception)? internalFailure,
    TResult Function(dynamic failure)? googleFailure,
    TResult Function(dynamic error)? unknownError,
    TResult Function(String fromFunctionName)? emptyValueReceived,
    TResult Function(Map<String, dynamic> keys)? parseJsonFailure,
  }) {
    return internalFailure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception exception)? initializationFailure,
    TResult Function(Exception exception)? internalFailure,
    TResult Function(dynamic failure)? googleFailure,
    TResult Function(dynamic error)? unknownError,
    TResult Function(String fromFunctionName)? emptyValueReceived,
    TResult Function(Map<String, dynamic> keys)? parseJsonFailure,
    required TResult orElse(),
  }) {
    if (internalFailure != null) {
      return internalFailure(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializationFailure value)
        initializationFailure,
    required TResult Function(InternalFailure value) internalFailure,
    required TResult Function(GoogleFailure value) googleFailure,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(EmptyValueReceived value) emptyValueReceived,
    required TResult Function(ParseJsonFailure value) parseJsonFailure,
  }) {
    return internalFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitializationFailure value)? initializationFailure,
    TResult Function(InternalFailure value)? internalFailure,
    TResult Function(GoogleFailure value)? googleFailure,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(EmptyValueReceived value)? emptyValueReceived,
    TResult Function(ParseJsonFailure value)? parseJsonFailure,
  }) {
    return internalFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializationFailure value)? initializationFailure,
    TResult Function(InternalFailure value)? internalFailure,
    TResult Function(GoogleFailure value)? googleFailure,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(EmptyValueReceived value)? emptyValueReceived,
    TResult Function(ParseJsonFailure value)? parseJsonFailure,
    required TResult orElse(),
  }) {
    if (internalFailure != null) {
      return internalFailure(this);
    }
    return orElse();
  }
}

abstract class InternalFailure implements AppFailure {
  const factory InternalFailure(final Exception exception) = _$InternalFailure;

  Exception get exception;
  @JsonKey(ignore: true)
  _$$InternalFailureCopyWith<_$InternalFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoogleFailureCopyWith<$Res> {
  factory _$$GoogleFailureCopyWith(
          _$GoogleFailure value, $Res Function(_$GoogleFailure) then) =
      __$$GoogleFailureCopyWithImpl<$Res>;
  $Res call({dynamic failure});
}

/// @nodoc
class __$$GoogleFailureCopyWithImpl<$Res> extends _$AppFailureCopyWithImpl<$Res>
    implements _$$GoogleFailureCopyWith<$Res> {
  __$$GoogleFailureCopyWithImpl(
      _$GoogleFailure _value, $Res Function(_$GoogleFailure) _then)
      : super(_value, (v) => _then(v as _$GoogleFailure));

  @override
  _$GoogleFailure get _value => super._value as _$GoogleFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$GoogleFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$GoogleFailure implements GoogleFailure {
  const _$GoogleFailure(this.failure);

  @override
  final dynamic failure;

  @override
  String toString() {
    return 'AppFailure.googleFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleFailure &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$GoogleFailureCopyWith<_$GoogleFailure> get copyWith =>
      __$$GoogleFailureCopyWithImpl<_$GoogleFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception exception) initializationFailure,
    required TResult Function(Exception exception) internalFailure,
    required TResult Function(dynamic failure) googleFailure,
    required TResult Function(dynamic error) unknownError,
    required TResult Function(String fromFunctionName) emptyValueReceived,
    required TResult Function(Map<String, dynamic> keys) parseJsonFailure,
  }) {
    return googleFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exception exception)? initializationFailure,
    TResult Function(Exception exception)? internalFailure,
    TResult Function(dynamic failure)? googleFailure,
    TResult Function(dynamic error)? unknownError,
    TResult Function(String fromFunctionName)? emptyValueReceived,
    TResult Function(Map<String, dynamic> keys)? parseJsonFailure,
  }) {
    return googleFailure?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception exception)? initializationFailure,
    TResult Function(Exception exception)? internalFailure,
    TResult Function(dynamic failure)? googleFailure,
    TResult Function(dynamic error)? unknownError,
    TResult Function(String fromFunctionName)? emptyValueReceived,
    TResult Function(Map<String, dynamic> keys)? parseJsonFailure,
    required TResult orElse(),
  }) {
    if (googleFailure != null) {
      return googleFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializationFailure value)
        initializationFailure,
    required TResult Function(InternalFailure value) internalFailure,
    required TResult Function(GoogleFailure value) googleFailure,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(EmptyValueReceived value) emptyValueReceived,
    required TResult Function(ParseJsonFailure value) parseJsonFailure,
  }) {
    return googleFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitializationFailure value)? initializationFailure,
    TResult Function(InternalFailure value)? internalFailure,
    TResult Function(GoogleFailure value)? googleFailure,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(EmptyValueReceived value)? emptyValueReceived,
    TResult Function(ParseJsonFailure value)? parseJsonFailure,
  }) {
    return googleFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializationFailure value)? initializationFailure,
    TResult Function(InternalFailure value)? internalFailure,
    TResult Function(GoogleFailure value)? googleFailure,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(EmptyValueReceived value)? emptyValueReceived,
    TResult Function(ParseJsonFailure value)? parseJsonFailure,
    required TResult orElse(),
  }) {
    if (googleFailure != null) {
      return googleFailure(this);
    }
    return orElse();
  }
}

abstract class GoogleFailure implements AppFailure {
  const factory GoogleFailure(final dynamic failure) = _$GoogleFailure;

  dynamic get failure;
  @JsonKey(ignore: true)
  _$$GoogleFailureCopyWith<_$GoogleFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownErrorCopyWith<$Res> {
  factory _$$UnknownErrorCopyWith(
          _$UnknownError value, $Res Function(_$UnknownError) then) =
      __$$UnknownErrorCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

/// @nodoc
class __$$UnknownErrorCopyWithImpl<$Res> extends _$AppFailureCopyWithImpl<$Res>
    implements _$$UnknownErrorCopyWith<$Res> {
  __$$UnknownErrorCopyWithImpl(
      _$UnknownError _value, $Res Function(_$UnknownError) _then)
      : super(_value, (v) => _then(v as _$UnknownError));

  @override
  _$UnknownError get _value => super._value as _$UnknownError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$UnknownError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$UnknownError implements UnknownError {
  const _$UnknownError(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'AppFailure.unknownError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$UnknownErrorCopyWith<_$UnknownError> get copyWith =>
      __$$UnknownErrorCopyWithImpl<_$UnknownError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception exception) initializationFailure,
    required TResult Function(Exception exception) internalFailure,
    required TResult Function(dynamic failure) googleFailure,
    required TResult Function(dynamic error) unknownError,
    required TResult Function(String fromFunctionName) emptyValueReceived,
    required TResult Function(Map<String, dynamic> keys) parseJsonFailure,
  }) {
    return unknownError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exception exception)? initializationFailure,
    TResult Function(Exception exception)? internalFailure,
    TResult Function(dynamic failure)? googleFailure,
    TResult Function(dynamic error)? unknownError,
    TResult Function(String fromFunctionName)? emptyValueReceived,
    TResult Function(Map<String, dynamic> keys)? parseJsonFailure,
  }) {
    return unknownError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception exception)? initializationFailure,
    TResult Function(Exception exception)? internalFailure,
    TResult Function(dynamic failure)? googleFailure,
    TResult Function(dynamic error)? unknownError,
    TResult Function(String fromFunctionName)? emptyValueReceived,
    TResult Function(Map<String, dynamic> keys)? parseJsonFailure,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializationFailure value)
        initializationFailure,
    required TResult Function(InternalFailure value) internalFailure,
    required TResult Function(GoogleFailure value) googleFailure,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(EmptyValueReceived value) emptyValueReceived,
    required TResult Function(ParseJsonFailure value) parseJsonFailure,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitializationFailure value)? initializationFailure,
    TResult Function(InternalFailure value)? internalFailure,
    TResult Function(GoogleFailure value)? googleFailure,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(EmptyValueReceived value)? emptyValueReceived,
    TResult Function(ParseJsonFailure value)? parseJsonFailure,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializationFailure value)? initializationFailure,
    TResult Function(InternalFailure value)? internalFailure,
    TResult Function(GoogleFailure value)? googleFailure,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(EmptyValueReceived value)? emptyValueReceived,
    TResult Function(ParseJsonFailure value)? parseJsonFailure,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class UnknownError implements AppFailure {
  const factory UnknownError(final dynamic error) = _$UnknownError;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$UnknownErrorCopyWith<_$UnknownError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyValueReceivedCopyWith<$Res> {
  factory _$$EmptyValueReceivedCopyWith(_$EmptyValueReceived value,
          $Res Function(_$EmptyValueReceived) then) =
      __$$EmptyValueReceivedCopyWithImpl<$Res>;
  $Res call({String fromFunctionName});
}

/// @nodoc
class __$$EmptyValueReceivedCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res>
    implements _$$EmptyValueReceivedCopyWith<$Res> {
  __$$EmptyValueReceivedCopyWithImpl(
      _$EmptyValueReceived _value, $Res Function(_$EmptyValueReceived) _then)
      : super(_value, (v) => _then(v as _$EmptyValueReceived));

  @override
  _$EmptyValueReceived get _value => super._value as _$EmptyValueReceived;

  @override
  $Res call({
    Object? fromFunctionName = freezed,
  }) {
    return _then(_$EmptyValueReceived(
      fromFunctionName == freezed
          ? _value.fromFunctionName
          : fromFunctionName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmptyValueReceived implements EmptyValueReceived {
  const _$EmptyValueReceived(this.fromFunctionName);

  @override
  final String fromFunctionName;

  @override
  String toString() {
    return 'AppFailure.emptyValueReceived(fromFunctionName: $fromFunctionName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyValueReceived &&
            const DeepCollectionEquality()
                .equals(other.fromFunctionName, fromFunctionName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(fromFunctionName));

  @JsonKey(ignore: true)
  @override
  _$$EmptyValueReceivedCopyWith<_$EmptyValueReceived> get copyWith =>
      __$$EmptyValueReceivedCopyWithImpl<_$EmptyValueReceived>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception exception) initializationFailure,
    required TResult Function(Exception exception) internalFailure,
    required TResult Function(dynamic failure) googleFailure,
    required TResult Function(dynamic error) unknownError,
    required TResult Function(String fromFunctionName) emptyValueReceived,
    required TResult Function(Map<String, dynamic> keys) parseJsonFailure,
  }) {
    return emptyValueReceived(fromFunctionName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exception exception)? initializationFailure,
    TResult Function(Exception exception)? internalFailure,
    TResult Function(dynamic failure)? googleFailure,
    TResult Function(dynamic error)? unknownError,
    TResult Function(String fromFunctionName)? emptyValueReceived,
    TResult Function(Map<String, dynamic> keys)? parseJsonFailure,
  }) {
    return emptyValueReceived?.call(fromFunctionName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception exception)? initializationFailure,
    TResult Function(Exception exception)? internalFailure,
    TResult Function(dynamic failure)? googleFailure,
    TResult Function(dynamic error)? unknownError,
    TResult Function(String fromFunctionName)? emptyValueReceived,
    TResult Function(Map<String, dynamic> keys)? parseJsonFailure,
    required TResult orElse(),
  }) {
    if (emptyValueReceived != null) {
      return emptyValueReceived(fromFunctionName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializationFailure value)
        initializationFailure,
    required TResult Function(InternalFailure value) internalFailure,
    required TResult Function(GoogleFailure value) googleFailure,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(EmptyValueReceived value) emptyValueReceived,
    required TResult Function(ParseJsonFailure value) parseJsonFailure,
  }) {
    return emptyValueReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitializationFailure value)? initializationFailure,
    TResult Function(InternalFailure value)? internalFailure,
    TResult Function(GoogleFailure value)? googleFailure,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(EmptyValueReceived value)? emptyValueReceived,
    TResult Function(ParseJsonFailure value)? parseJsonFailure,
  }) {
    return emptyValueReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializationFailure value)? initializationFailure,
    TResult Function(InternalFailure value)? internalFailure,
    TResult Function(GoogleFailure value)? googleFailure,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(EmptyValueReceived value)? emptyValueReceived,
    TResult Function(ParseJsonFailure value)? parseJsonFailure,
    required TResult orElse(),
  }) {
    if (emptyValueReceived != null) {
      return emptyValueReceived(this);
    }
    return orElse();
  }
}

abstract class EmptyValueReceived implements AppFailure {
  const factory EmptyValueReceived(final String fromFunctionName) =
      _$EmptyValueReceived;

  String get fromFunctionName;
  @JsonKey(ignore: true)
  _$$EmptyValueReceivedCopyWith<_$EmptyValueReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParseJsonFailureCopyWith<$Res> {
  factory _$$ParseJsonFailureCopyWith(
          _$ParseJsonFailure value, $Res Function(_$ParseJsonFailure) then) =
      __$$ParseJsonFailureCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> keys});
}

/// @nodoc
class __$$ParseJsonFailureCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res>
    implements _$$ParseJsonFailureCopyWith<$Res> {
  __$$ParseJsonFailureCopyWithImpl(
      _$ParseJsonFailure _value, $Res Function(_$ParseJsonFailure) _then)
      : super(_value, (v) => _then(v as _$ParseJsonFailure));

  @override
  _$ParseJsonFailure get _value => super._value as _$ParseJsonFailure;

  @override
  $Res call({
    Object? keys = freezed,
  }) {
    return _then(_$ParseJsonFailure(
      keys == freezed
          ? _value._keys
          : keys // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$ParseJsonFailure implements ParseJsonFailure {
  const _$ParseJsonFailure(final Map<String, dynamic> keys) : _keys = keys;

  final Map<String, dynamic> _keys;
  @override
  Map<String, dynamic> get keys {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_keys);
  }

  @override
  String toString() {
    return 'AppFailure.parseJsonFailure(keys: $keys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParseJsonFailure &&
            const DeepCollectionEquality().equals(other._keys, _keys));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_keys));

  @JsonKey(ignore: true)
  @override
  _$$ParseJsonFailureCopyWith<_$ParseJsonFailure> get copyWith =>
      __$$ParseJsonFailureCopyWithImpl<_$ParseJsonFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception exception) initializationFailure,
    required TResult Function(Exception exception) internalFailure,
    required TResult Function(dynamic failure) googleFailure,
    required TResult Function(dynamic error) unknownError,
    required TResult Function(String fromFunctionName) emptyValueReceived,
    required TResult Function(Map<String, dynamic> keys) parseJsonFailure,
  }) {
    return parseJsonFailure(keys);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exception exception)? initializationFailure,
    TResult Function(Exception exception)? internalFailure,
    TResult Function(dynamic failure)? googleFailure,
    TResult Function(dynamic error)? unknownError,
    TResult Function(String fromFunctionName)? emptyValueReceived,
    TResult Function(Map<String, dynamic> keys)? parseJsonFailure,
  }) {
    return parseJsonFailure?.call(keys);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception exception)? initializationFailure,
    TResult Function(Exception exception)? internalFailure,
    TResult Function(dynamic failure)? googleFailure,
    TResult Function(dynamic error)? unknownError,
    TResult Function(String fromFunctionName)? emptyValueReceived,
    TResult Function(Map<String, dynamic> keys)? parseJsonFailure,
    required TResult orElse(),
  }) {
    if (parseJsonFailure != null) {
      return parseJsonFailure(keys);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializationFailure value)
        initializationFailure,
    required TResult Function(InternalFailure value) internalFailure,
    required TResult Function(GoogleFailure value) googleFailure,
    required TResult Function(UnknownError value) unknownError,
    required TResult Function(EmptyValueReceived value) emptyValueReceived,
    required TResult Function(ParseJsonFailure value) parseJsonFailure,
  }) {
    return parseJsonFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitializationFailure value)? initializationFailure,
    TResult Function(InternalFailure value)? internalFailure,
    TResult Function(GoogleFailure value)? googleFailure,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(EmptyValueReceived value)? emptyValueReceived,
    TResult Function(ParseJsonFailure value)? parseJsonFailure,
  }) {
    return parseJsonFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializationFailure value)? initializationFailure,
    TResult Function(InternalFailure value)? internalFailure,
    TResult Function(GoogleFailure value)? googleFailure,
    TResult Function(UnknownError value)? unknownError,
    TResult Function(EmptyValueReceived value)? emptyValueReceived,
    TResult Function(ParseJsonFailure value)? parseJsonFailure,
    required TResult orElse(),
  }) {
    if (parseJsonFailure != null) {
      return parseJsonFailure(this);
    }
    return orElse();
  }
}

abstract class ParseJsonFailure implements AppFailure {
  const factory ParseJsonFailure(final Map<String, dynamic> keys) =
      _$ParseJsonFailure;

  Map<String, dynamic> get keys;
  @JsonKey(ignore: true)
  _$$ParseJsonFailureCopyWith<_$ParseJsonFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authCancelledByUser,
    required TResult Function() userAlreadySignedIn,
    required TResult Function(FirebaseAuthFailure failure) firebaseAuthFailure,
    required TResult Function() unknownAuthFailure,
    required TResult Function() serverSerror,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authCancelledByUser,
    TResult Function()? userAlreadySignedIn,
    TResult Function(FirebaseAuthFailure failure)? firebaseAuthFailure,
    TResult Function()? unknownAuthFailure,
    TResult Function()? serverSerror,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authCancelledByUser,
    TResult Function()? userAlreadySignedIn,
    TResult Function(FirebaseAuthFailure failure)? firebaseAuthFailure,
    TResult Function()? unknownAuthFailure,
    TResult Function()? serverSerror,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledByUser value) authCancelledByUser,
    required TResult Function(UserAlreadySignedIn value) userAlreadySignedIn,
    required TResult Function(FirebaseAuthAppFailure value) firebaseAuthFailure,
    required TResult Function(UnknownAuthFailure value) unknownAuthFailure,
    required TResult Function(ServerError value) serverSerror,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CancelledByUser value)? authCancelledByUser,
    TResult Function(UserAlreadySignedIn value)? userAlreadySignedIn,
    TResult Function(FirebaseAuthAppFailure value)? firebaseAuthFailure,
    TResult Function(UnknownAuthFailure value)? unknownAuthFailure,
    TResult Function(ServerError value)? serverSerror,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledByUser value)? authCancelledByUser,
    TResult Function(UserAlreadySignedIn value)? userAlreadySignedIn,
    TResult Function(FirebaseAuthAppFailure value)? firebaseAuthFailure,
    TResult Function(UnknownAuthFailure value)? unknownAuthFailure,
    TResult Function(ServerError value)? serverSerror,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

/// @nodoc
abstract class _$$CancelledByUserCopyWith<$Res> {
  factory _$$CancelledByUserCopyWith(
          _$CancelledByUser value, $Res Function(_$CancelledByUser) then) =
      __$$CancelledByUserCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelledByUserCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$CancelledByUserCopyWith<$Res> {
  __$$CancelledByUserCopyWithImpl(
      _$CancelledByUser _value, $Res Function(_$CancelledByUser) _then)
      : super(_value, (v) => _then(v as _$CancelledByUser));

  @override
  _$CancelledByUser get _value => super._value as _$CancelledByUser;
}

/// @nodoc

class _$CancelledByUser extends CancelledByUser {
  const _$CancelledByUser() : super._();

  @override
  String toString() {
    return 'AuthFailure.authCancelledByUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelledByUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authCancelledByUser,
    required TResult Function() userAlreadySignedIn,
    required TResult Function(FirebaseAuthFailure failure) firebaseAuthFailure,
    required TResult Function() unknownAuthFailure,
    required TResult Function() serverSerror,
  }) {
    return authCancelledByUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authCancelledByUser,
    TResult Function()? userAlreadySignedIn,
    TResult Function(FirebaseAuthFailure failure)? firebaseAuthFailure,
    TResult Function()? unknownAuthFailure,
    TResult Function()? serverSerror,
  }) {
    return authCancelledByUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authCancelledByUser,
    TResult Function()? userAlreadySignedIn,
    TResult Function(FirebaseAuthFailure failure)? firebaseAuthFailure,
    TResult Function()? unknownAuthFailure,
    TResult Function()? serverSerror,
    required TResult orElse(),
  }) {
    if (authCancelledByUser != null) {
      return authCancelledByUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledByUser value) authCancelledByUser,
    required TResult Function(UserAlreadySignedIn value) userAlreadySignedIn,
    required TResult Function(FirebaseAuthAppFailure value) firebaseAuthFailure,
    required TResult Function(UnknownAuthFailure value) unknownAuthFailure,
    required TResult Function(ServerError value) serverSerror,
  }) {
    return authCancelledByUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CancelledByUser value)? authCancelledByUser,
    TResult Function(UserAlreadySignedIn value)? userAlreadySignedIn,
    TResult Function(FirebaseAuthAppFailure value)? firebaseAuthFailure,
    TResult Function(UnknownAuthFailure value)? unknownAuthFailure,
    TResult Function(ServerError value)? serverSerror,
  }) {
    return authCancelledByUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledByUser value)? authCancelledByUser,
    TResult Function(UserAlreadySignedIn value)? userAlreadySignedIn,
    TResult Function(FirebaseAuthAppFailure value)? firebaseAuthFailure,
    TResult Function(UnknownAuthFailure value)? unknownAuthFailure,
    TResult Function(ServerError value)? serverSerror,
    required TResult orElse(),
  }) {
    if (authCancelledByUser != null) {
      return authCancelledByUser(this);
    }
    return orElse();
  }
}

abstract class CancelledByUser extends AuthFailure {
  const factory CancelledByUser() = _$CancelledByUser;
  const CancelledByUser._() : super._();
}

/// @nodoc
abstract class _$$UserAlreadySignedInCopyWith<$Res> {
  factory _$$UserAlreadySignedInCopyWith(_$UserAlreadySignedIn value,
          $Res Function(_$UserAlreadySignedIn) then) =
      __$$UserAlreadySignedInCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserAlreadySignedInCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$UserAlreadySignedInCopyWith<$Res> {
  __$$UserAlreadySignedInCopyWithImpl(
      _$UserAlreadySignedIn _value, $Res Function(_$UserAlreadySignedIn) _then)
      : super(_value, (v) => _then(v as _$UserAlreadySignedIn));

  @override
  _$UserAlreadySignedIn get _value => super._value as _$UserAlreadySignedIn;
}

/// @nodoc

class _$UserAlreadySignedIn extends UserAlreadySignedIn {
  const _$UserAlreadySignedIn() : super._();

  @override
  String toString() {
    return 'AuthFailure.userAlreadySignedIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserAlreadySignedIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authCancelledByUser,
    required TResult Function() userAlreadySignedIn,
    required TResult Function(FirebaseAuthFailure failure) firebaseAuthFailure,
    required TResult Function() unknownAuthFailure,
    required TResult Function() serverSerror,
  }) {
    return userAlreadySignedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authCancelledByUser,
    TResult Function()? userAlreadySignedIn,
    TResult Function(FirebaseAuthFailure failure)? firebaseAuthFailure,
    TResult Function()? unknownAuthFailure,
    TResult Function()? serverSerror,
  }) {
    return userAlreadySignedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authCancelledByUser,
    TResult Function()? userAlreadySignedIn,
    TResult Function(FirebaseAuthFailure failure)? firebaseAuthFailure,
    TResult Function()? unknownAuthFailure,
    TResult Function()? serverSerror,
    required TResult orElse(),
  }) {
    if (userAlreadySignedIn != null) {
      return userAlreadySignedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledByUser value) authCancelledByUser,
    required TResult Function(UserAlreadySignedIn value) userAlreadySignedIn,
    required TResult Function(FirebaseAuthAppFailure value) firebaseAuthFailure,
    required TResult Function(UnknownAuthFailure value) unknownAuthFailure,
    required TResult Function(ServerError value) serverSerror,
  }) {
    return userAlreadySignedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CancelledByUser value)? authCancelledByUser,
    TResult Function(UserAlreadySignedIn value)? userAlreadySignedIn,
    TResult Function(FirebaseAuthAppFailure value)? firebaseAuthFailure,
    TResult Function(UnknownAuthFailure value)? unknownAuthFailure,
    TResult Function(ServerError value)? serverSerror,
  }) {
    return userAlreadySignedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledByUser value)? authCancelledByUser,
    TResult Function(UserAlreadySignedIn value)? userAlreadySignedIn,
    TResult Function(FirebaseAuthAppFailure value)? firebaseAuthFailure,
    TResult Function(UnknownAuthFailure value)? unknownAuthFailure,
    TResult Function(ServerError value)? serverSerror,
    required TResult orElse(),
  }) {
    if (userAlreadySignedIn != null) {
      return userAlreadySignedIn(this);
    }
    return orElse();
  }
}

abstract class UserAlreadySignedIn extends AuthFailure {
  const factory UserAlreadySignedIn() = _$UserAlreadySignedIn;
  const UserAlreadySignedIn._() : super._();
}

/// @nodoc
abstract class _$$FirebaseAuthAppFailureCopyWith<$Res> {
  factory _$$FirebaseAuthAppFailureCopyWith(_$FirebaseAuthAppFailure value,
          $Res Function(_$FirebaseAuthAppFailure) then) =
      __$$FirebaseAuthAppFailureCopyWithImpl<$Res>;
  $Res call({FirebaseAuthFailure failure});

  $FirebaseAuthFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$FirebaseAuthAppFailureCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$FirebaseAuthAppFailureCopyWith<$Res> {
  __$$FirebaseAuthAppFailureCopyWithImpl(_$FirebaseAuthAppFailure _value,
      $Res Function(_$FirebaseAuthAppFailure) _then)
      : super(_value, (v) => _then(v as _$FirebaseAuthAppFailure));

  @override
  _$FirebaseAuthAppFailure get _value =>
      super._value as _$FirebaseAuthAppFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$FirebaseAuthAppFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthFailure,
    ));
  }

  @override
  $FirebaseAuthFailureCopyWith<$Res> get failure {
    return $FirebaseAuthFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$FirebaseAuthAppFailure extends FirebaseAuthAppFailure {
  const _$FirebaseAuthAppFailure(this.failure) : super._();

  @override
  final FirebaseAuthFailure failure;

  @override
  String toString() {
    return 'AuthFailure.firebaseAuthFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseAuthAppFailure &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$FirebaseAuthAppFailureCopyWith<_$FirebaseAuthAppFailure> get copyWith =>
      __$$FirebaseAuthAppFailureCopyWithImpl<_$FirebaseAuthAppFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authCancelledByUser,
    required TResult Function() userAlreadySignedIn,
    required TResult Function(FirebaseAuthFailure failure) firebaseAuthFailure,
    required TResult Function() unknownAuthFailure,
    required TResult Function() serverSerror,
  }) {
    return firebaseAuthFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authCancelledByUser,
    TResult Function()? userAlreadySignedIn,
    TResult Function(FirebaseAuthFailure failure)? firebaseAuthFailure,
    TResult Function()? unknownAuthFailure,
    TResult Function()? serverSerror,
  }) {
    return firebaseAuthFailure?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authCancelledByUser,
    TResult Function()? userAlreadySignedIn,
    TResult Function(FirebaseAuthFailure failure)? firebaseAuthFailure,
    TResult Function()? unknownAuthFailure,
    TResult Function()? serverSerror,
    required TResult orElse(),
  }) {
    if (firebaseAuthFailure != null) {
      return firebaseAuthFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledByUser value) authCancelledByUser,
    required TResult Function(UserAlreadySignedIn value) userAlreadySignedIn,
    required TResult Function(FirebaseAuthAppFailure value) firebaseAuthFailure,
    required TResult Function(UnknownAuthFailure value) unknownAuthFailure,
    required TResult Function(ServerError value) serverSerror,
  }) {
    return firebaseAuthFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CancelledByUser value)? authCancelledByUser,
    TResult Function(UserAlreadySignedIn value)? userAlreadySignedIn,
    TResult Function(FirebaseAuthAppFailure value)? firebaseAuthFailure,
    TResult Function(UnknownAuthFailure value)? unknownAuthFailure,
    TResult Function(ServerError value)? serverSerror,
  }) {
    return firebaseAuthFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledByUser value)? authCancelledByUser,
    TResult Function(UserAlreadySignedIn value)? userAlreadySignedIn,
    TResult Function(FirebaseAuthAppFailure value)? firebaseAuthFailure,
    TResult Function(UnknownAuthFailure value)? unknownAuthFailure,
    TResult Function(ServerError value)? serverSerror,
    required TResult orElse(),
  }) {
    if (firebaseAuthFailure != null) {
      return firebaseAuthFailure(this);
    }
    return orElse();
  }
}

abstract class FirebaseAuthAppFailure extends AuthFailure {
  const factory FirebaseAuthAppFailure(final FirebaseAuthFailure failure) =
      _$FirebaseAuthAppFailure;
  const FirebaseAuthAppFailure._() : super._();

  FirebaseAuthFailure get failure;
  @JsonKey(ignore: true)
  _$$FirebaseAuthAppFailureCopyWith<_$FirebaseAuthAppFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownAuthFailureCopyWith<$Res> {
  factory _$$UnknownAuthFailureCopyWith(_$UnknownAuthFailure value,
          $Res Function(_$UnknownAuthFailure) then) =
      __$$UnknownAuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownAuthFailureCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$UnknownAuthFailureCopyWith<$Res> {
  __$$UnknownAuthFailureCopyWithImpl(
      _$UnknownAuthFailure _value, $Res Function(_$UnknownAuthFailure) _then)
      : super(_value, (v) => _then(v as _$UnknownAuthFailure));

  @override
  _$UnknownAuthFailure get _value => super._value as _$UnknownAuthFailure;
}

/// @nodoc

class _$UnknownAuthFailure extends UnknownAuthFailure {
  const _$UnknownAuthFailure() : super._();

  @override
  String toString() {
    return 'AuthFailure.unknownAuthFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnknownAuthFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authCancelledByUser,
    required TResult Function() userAlreadySignedIn,
    required TResult Function(FirebaseAuthFailure failure) firebaseAuthFailure,
    required TResult Function() unknownAuthFailure,
    required TResult Function() serverSerror,
  }) {
    return unknownAuthFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authCancelledByUser,
    TResult Function()? userAlreadySignedIn,
    TResult Function(FirebaseAuthFailure failure)? firebaseAuthFailure,
    TResult Function()? unknownAuthFailure,
    TResult Function()? serverSerror,
  }) {
    return unknownAuthFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authCancelledByUser,
    TResult Function()? userAlreadySignedIn,
    TResult Function(FirebaseAuthFailure failure)? firebaseAuthFailure,
    TResult Function()? unknownAuthFailure,
    TResult Function()? serverSerror,
    required TResult orElse(),
  }) {
    if (unknownAuthFailure != null) {
      return unknownAuthFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledByUser value) authCancelledByUser,
    required TResult Function(UserAlreadySignedIn value) userAlreadySignedIn,
    required TResult Function(FirebaseAuthAppFailure value) firebaseAuthFailure,
    required TResult Function(UnknownAuthFailure value) unknownAuthFailure,
    required TResult Function(ServerError value) serverSerror,
  }) {
    return unknownAuthFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CancelledByUser value)? authCancelledByUser,
    TResult Function(UserAlreadySignedIn value)? userAlreadySignedIn,
    TResult Function(FirebaseAuthAppFailure value)? firebaseAuthFailure,
    TResult Function(UnknownAuthFailure value)? unknownAuthFailure,
    TResult Function(ServerError value)? serverSerror,
  }) {
    return unknownAuthFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledByUser value)? authCancelledByUser,
    TResult Function(UserAlreadySignedIn value)? userAlreadySignedIn,
    TResult Function(FirebaseAuthAppFailure value)? firebaseAuthFailure,
    TResult Function(UnknownAuthFailure value)? unknownAuthFailure,
    TResult Function(ServerError value)? serverSerror,
    required TResult orElse(),
  }) {
    if (unknownAuthFailure != null) {
      return unknownAuthFailure(this);
    }
    return orElse();
  }
}

abstract class UnknownAuthFailure extends AuthFailure {
  const factory UnknownAuthFailure() = _$UnknownAuthFailure;
  const UnknownAuthFailure._() : super._();
}

/// @nodoc
abstract class _$$ServerErrorCopyWith<$Res> {
  factory _$$ServerErrorCopyWith(
          _$ServerError value, $Res Function(_$ServerError) then) =
      __$$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$ServerErrorCopyWith<$Res> {
  __$$ServerErrorCopyWithImpl(
      _$ServerError _value, $Res Function(_$ServerError) _then)
      : super(_value, (v) => _then(v as _$ServerError));

  @override
  _$ServerError get _value => super._value as _$ServerError;
}

/// @nodoc

class _$ServerError extends ServerError {
  const _$ServerError() : super._();

  @override
  String toString() {
    return 'AuthFailure.serverSerror()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authCancelledByUser,
    required TResult Function() userAlreadySignedIn,
    required TResult Function(FirebaseAuthFailure failure) firebaseAuthFailure,
    required TResult Function() unknownAuthFailure,
    required TResult Function() serverSerror,
  }) {
    return serverSerror();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authCancelledByUser,
    TResult Function()? userAlreadySignedIn,
    TResult Function(FirebaseAuthFailure failure)? firebaseAuthFailure,
    TResult Function()? unknownAuthFailure,
    TResult Function()? serverSerror,
  }) {
    return serverSerror?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authCancelledByUser,
    TResult Function()? userAlreadySignedIn,
    TResult Function(FirebaseAuthFailure failure)? firebaseAuthFailure,
    TResult Function()? unknownAuthFailure,
    TResult Function()? serverSerror,
    required TResult orElse(),
  }) {
    if (serverSerror != null) {
      return serverSerror();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledByUser value) authCancelledByUser,
    required TResult Function(UserAlreadySignedIn value) userAlreadySignedIn,
    required TResult Function(FirebaseAuthAppFailure value) firebaseAuthFailure,
    required TResult Function(UnknownAuthFailure value) unknownAuthFailure,
    required TResult Function(ServerError value) serverSerror,
  }) {
    return serverSerror(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CancelledByUser value)? authCancelledByUser,
    TResult Function(UserAlreadySignedIn value)? userAlreadySignedIn,
    TResult Function(FirebaseAuthAppFailure value)? firebaseAuthFailure,
    TResult Function(UnknownAuthFailure value)? unknownAuthFailure,
    TResult Function(ServerError value)? serverSerror,
  }) {
    return serverSerror?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledByUser value)? authCancelledByUser,
    TResult Function(UserAlreadySignedIn value)? userAlreadySignedIn,
    TResult Function(FirebaseAuthAppFailure value)? firebaseAuthFailure,
    TResult Function(UnknownAuthFailure value)? unknownAuthFailure,
    TResult Function(ServerError value)? serverSerror,
    required TResult orElse(),
  }) {
    if (serverSerror != null) {
      return serverSerror(this);
    }
    return orElse();
  }
}

abstract class ServerError extends AuthFailure {
  const factory ServerError() = _$ServerError;
  const ServerError._() : super._();
}

/// @nodoc
mixin _$FirebaseAuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() userDisabled,
    required TResult Function() userNotfound,
    required TResult Function() wrongPassword,
    required TResult Function() operationNotAllowed,
    required TResult Function() weakPassword,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(UserNotFound value) userNotfound,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UnknownFBAuthFailure value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseAuthFailureCopyWith<$Res> {
  factory $FirebaseAuthFailureCopyWith(
          FirebaseAuthFailure value, $Res Function(FirebaseAuthFailure) then) =
      _$FirebaseAuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$FirebaseAuthFailureCopyWithImpl<$Res>
    implements $FirebaseAuthFailureCopyWith<$Res> {
  _$FirebaseAuthFailureCopyWithImpl(this._value, this._then);

  final FirebaseAuthFailure _value;
  // ignore: unused_field
  final $Res Function(FirebaseAuthFailure) _then;
}

/// @nodoc
abstract class _$$InvalidEmailCopyWith<$Res> {
  factory _$$InvalidEmailCopyWith(
          _$InvalidEmail value, $Res Function(_$InvalidEmail) then) =
      __$$InvalidEmailCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidEmailCopyWithImpl<$Res>
    extends _$FirebaseAuthFailureCopyWithImpl<$Res>
    implements _$$InvalidEmailCopyWith<$Res> {
  __$$InvalidEmailCopyWithImpl(
      _$InvalidEmail _value, $Res Function(_$InvalidEmail) _then)
      : super(_value, (v) => _then(v as _$InvalidEmail));

  @override
  _$InvalidEmail get _value => super._value as _$InvalidEmail;
}

/// @nodoc

class _$InvalidEmail implements InvalidEmail {
  const _$InvalidEmail();

  @override
  String toString() {
    return 'FirebaseAuthFailure.invalidEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() userDisabled,
    required TResult Function() userNotfound,
    required TResult Function() wrongPassword,
    required TResult Function() operationNotAllowed,
    required TResult Function() weakPassword,
    required TResult Function() unknown,
  }) {
    return invalidEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
  }) {
    return invalidEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(UserNotFound value) userNotfound,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UnknownFBAuthFailure value) unknown,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail implements FirebaseAuthFailure {
  const factory InvalidEmail() = _$InvalidEmail;
}

/// @nodoc
abstract class _$$UserDisabledCopyWith<$Res> {
  factory _$$UserDisabledCopyWith(
          _$UserDisabled value, $Res Function(_$UserDisabled) then) =
      __$$UserDisabledCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserDisabledCopyWithImpl<$Res>
    extends _$FirebaseAuthFailureCopyWithImpl<$Res>
    implements _$$UserDisabledCopyWith<$Res> {
  __$$UserDisabledCopyWithImpl(
      _$UserDisabled _value, $Res Function(_$UserDisabled) _then)
      : super(_value, (v) => _then(v as _$UserDisabled));

  @override
  _$UserDisabled get _value => super._value as _$UserDisabled;
}

/// @nodoc

class _$UserDisabled implements UserDisabled {
  const _$UserDisabled();

  @override
  String toString() {
    return 'FirebaseAuthFailure.userDisabled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserDisabled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() userDisabled,
    required TResult Function() userNotfound,
    required TResult Function() wrongPassword,
    required TResult Function() operationNotAllowed,
    required TResult Function() weakPassword,
    required TResult Function() unknown,
  }) {
    return userDisabled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
  }) {
    return userDisabled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (userDisabled != null) {
      return userDisabled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(UserNotFound value) userNotfound,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UnknownFBAuthFailure value) unknown,
  }) {
    return userDisabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
  }) {
    return userDisabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (userDisabled != null) {
      return userDisabled(this);
    }
    return orElse();
  }
}

abstract class UserDisabled implements FirebaseAuthFailure {
  const factory UserDisabled() = _$UserDisabled;
}

/// @nodoc
abstract class _$$UserNotFoundCopyWith<$Res> {
  factory _$$UserNotFoundCopyWith(
          _$UserNotFound value, $Res Function(_$UserNotFound) then) =
      __$$UserNotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserNotFoundCopyWithImpl<$Res>
    extends _$FirebaseAuthFailureCopyWithImpl<$Res>
    implements _$$UserNotFoundCopyWith<$Res> {
  __$$UserNotFoundCopyWithImpl(
      _$UserNotFound _value, $Res Function(_$UserNotFound) _then)
      : super(_value, (v) => _then(v as _$UserNotFound));

  @override
  _$UserNotFound get _value => super._value as _$UserNotFound;
}

/// @nodoc

class _$UserNotFound implements UserNotFound {
  const _$UserNotFound();

  @override
  String toString() {
    return 'FirebaseAuthFailure.userNotfound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() userDisabled,
    required TResult Function() userNotfound,
    required TResult Function() wrongPassword,
    required TResult Function() operationNotAllowed,
    required TResult Function() weakPassword,
    required TResult Function() unknown,
  }) {
    return userNotfound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
  }) {
    return userNotfound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (userNotfound != null) {
      return userNotfound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(UserNotFound value) userNotfound,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UnknownFBAuthFailure value) unknown,
  }) {
    return userNotfound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
  }) {
    return userNotfound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (userNotfound != null) {
      return userNotfound(this);
    }
    return orElse();
  }
}

abstract class UserNotFound implements FirebaseAuthFailure {
  const factory UserNotFound() = _$UserNotFound;
}

/// @nodoc
abstract class _$$WrongPasswordCopyWith<$Res> {
  factory _$$WrongPasswordCopyWith(
          _$WrongPassword value, $Res Function(_$WrongPassword) then) =
      __$$WrongPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WrongPasswordCopyWithImpl<$Res>
    extends _$FirebaseAuthFailureCopyWithImpl<$Res>
    implements _$$WrongPasswordCopyWith<$Res> {
  __$$WrongPasswordCopyWithImpl(
      _$WrongPassword _value, $Res Function(_$WrongPassword) _then)
      : super(_value, (v) => _then(v as _$WrongPassword));

  @override
  _$WrongPassword get _value => super._value as _$WrongPassword;
}

/// @nodoc

class _$WrongPassword implements WrongPassword {
  const _$WrongPassword();

  @override
  String toString() {
    return 'FirebaseAuthFailure.wrongPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WrongPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() userDisabled,
    required TResult Function() userNotfound,
    required TResult Function() wrongPassword,
    required TResult Function() operationNotAllowed,
    required TResult Function() weakPassword,
    required TResult Function() unknown,
  }) {
    return wrongPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
  }) {
    return wrongPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (wrongPassword != null) {
      return wrongPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(UserNotFound value) userNotfound,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UnknownFBAuthFailure value) unknown,
  }) {
    return wrongPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
  }) {
    return wrongPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (wrongPassword != null) {
      return wrongPassword(this);
    }
    return orElse();
  }
}

abstract class WrongPassword implements FirebaseAuthFailure {
  const factory WrongPassword() = _$WrongPassword;
}

/// @nodoc
abstract class _$$OperationNotAllowedCopyWith<$Res> {
  factory _$$OperationNotAllowedCopyWith(_$OperationNotAllowed value,
          $Res Function(_$OperationNotAllowed) then) =
      __$$OperationNotAllowedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OperationNotAllowedCopyWithImpl<$Res>
    extends _$FirebaseAuthFailureCopyWithImpl<$Res>
    implements _$$OperationNotAllowedCopyWith<$Res> {
  __$$OperationNotAllowedCopyWithImpl(
      _$OperationNotAllowed _value, $Res Function(_$OperationNotAllowed) _then)
      : super(_value, (v) => _then(v as _$OperationNotAllowed));

  @override
  _$OperationNotAllowed get _value => super._value as _$OperationNotAllowed;
}

/// @nodoc

class _$OperationNotAllowed implements OperationNotAllowed {
  const _$OperationNotAllowed();

  @override
  String toString() {
    return 'FirebaseAuthFailure.operationNotAllowed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OperationNotAllowed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() userDisabled,
    required TResult Function() userNotfound,
    required TResult Function() wrongPassword,
    required TResult Function() operationNotAllowed,
    required TResult Function() weakPassword,
    required TResult Function() unknown,
  }) {
    return operationNotAllowed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
  }) {
    return operationNotAllowed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (operationNotAllowed != null) {
      return operationNotAllowed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(UserNotFound value) userNotfound,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UnknownFBAuthFailure value) unknown,
  }) {
    return operationNotAllowed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
  }) {
    return operationNotAllowed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (operationNotAllowed != null) {
      return operationNotAllowed(this);
    }
    return orElse();
  }
}

abstract class OperationNotAllowed implements FirebaseAuthFailure {
  const factory OperationNotAllowed() = _$OperationNotAllowed;
}

/// @nodoc
abstract class _$$WeakPasswordCopyWith<$Res> {
  factory _$$WeakPasswordCopyWith(
          _$WeakPassword value, $Res Function(_$WeakPassword) then) =
      __$$WeakPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeakPasswordCopyWithImpl<$Res>
    extends _$FirebaseAuthFailureCopyWithImpl<$Res>
    implements _$$WeakPasswordCopyWith<$Res> {
  __$$WeakPasswordCopyWithImpl(
      _$WeakPassword _value, $Res Function(_$WeakPassword) _then)
      : super(_value, (v) => _then(v as _$WeakPassword));

  @override
  _$WeakPassword get _value => super._value as _$WeakPassword;
}

/// @nodoc

class _$WeakPassword implements WeakPassword {
  const _$WeakPassword();

  @override
  String toString() {
    return 'FirebaseAuthFailure.weakPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeakPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() userDisabled,
    required TResult Function() userNotfound,
    required TResult Function() wrongPassword,
    required TResult Function() operationNotAllowed,
    required TResult Function() weakPassword,
    required TResult Function() unknown,
  }) {
    return weakPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
  }) {
    return weakPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (weakPassword != null) {
      return weakPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(UserNotFound value) userNotfound,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UnknownFBAuthFailure value) unknown,
  }) {
    return weakPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
  }) {
    return weakPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (weakPassword != null) {
      return weakPassword(this);
    }
    return orElse();
  }
}

abstract class WeakPassword implements FirebaseAuthFailure {
  const factory WeakPassword() = _$WeakPassword;
}

/// @nodoc
abstract class _$$UnknownFBAuthFailureCopyWith<$Res> {
  factory _$$UnknownFBAuthFailureCopyWith(_$UnknownFBAuthFailure value,
          $Res Function(_$UnknownFBAuthFailure) then) =
      __$$UnknownFBAuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownFBAuthFailureCopyWithImpl<$Res>
    extends _$FirebaseAuthFailureCopyWithImpl<$Res>
    implements _$$UnknownFBAuthFailureCopyWith<$Res> {
  __$$UnknownFBAuthFailureCopyWithImpl(_$UnknownFBAuthFailure _value,
      $Res Function(_$UnknownFBAuthFailure) _then)
      : super(_value, (v) => _then(v as _$UnknownFBAuthFailure));

  @override
  _$UnknownFBAuthFailure get _value => super._value as _$UnknownFBAuthFailure;
}

/// @nodoc

class _$UnknownFBAuthFailure implements UnknownFBAuthFailure {
  const _$UnknownFBAuthFailure();

  @override
  String toString() {
    return 'FirebaseAuthFailure.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnknownFBAuthFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidEmail,
    required TResult Function() userDisabled,
    required TResult Function() userNotfound,
    required TResult Function() wrongPassword,
    required TResult Function() operationNotAllowed,
    required TResult Function() weakPassword,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidEmail,
    TResult Function()? userDisabled,
    TResult Function()? userNotfound,
    TResult Function()? wrongPassword,
    TResult Function()? operationNotAllowed,
    TResult Function()? weakPassword,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(UserDisabled value) userDisabled,
    required TResult Function(UserNotFound value) userNotfound,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
    required TResult Function(WeakPassword value) weakPassword,
    required TResult Function(UnknownFBAuthFailure value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(UserDisabled value)? userDisabled,
    TResult Function(UserNotFound value)? userNotfound,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    TResult Function(WeakPassword value)? weakPassword,
    TResult Function(UnknownFBAuthFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownFBAuthFailure implements FirebaseAuthFailure {
  const factory UnknownFBAuthFailure() = _$UnknownFBAuthFailure;
}
