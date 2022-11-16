// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authWithApple,
    required TResult Function() authWithGoogle,
    required TResult Function(String email, String password)
        authWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authWithApple,
    TResult Function()? authWithGoogle,
    TResult Function(String email, String password)? authWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authWithApple,
    TResult Function()? authWithGoogle,
    TResult Function(String email, String password)? authWithEmailAndPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthWithApple value) authWithApple,
    required TResult Function(AuthWithGoogle value) authWithGoogle,
    required TResult Function(AuthWithEmailAndPassword value)
        authWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthWithApple value)? authWithApple,
    TResult Function(AuthWithGoogle value)? authWithGoogle,
    TResult Function(AuthWithEmailAndPassword value)? authWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthWithApple value)? authWithApple,
    TResult Function(AuthWithGoogle value)? authWithGoogle,
    TResult Function(AuthWithEmailAndPassword value)? authWithEmailAndPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTypeCopyWith<$Res> {
  factory $AuthTypeCopyWith(AuthType value, $Res Function(AuthType) then) =
      _$AuthTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthTypeCopyWithImpl<$Res> implements $AuthTypeCopyWith<$Res> {
  _$AuthTypeCopyWithImpl(this._value, this._then);

  final AuthType _value;
  // ignore: unused_field
  final $Res Function(AuthType) _then;
}

/// @nodoc
abstract class _$$AuthWithAppleCopyWith<$Res> {
  factory _$$AuthWithAppleCopyWith(
          _$AuthWithApple value, $Res Function(_$AuthWithApple) then) =
      __$$AuthWithAppleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthWithAppleCopyWithImpl<$Res> extends _$AuthTypeCopyWithImpl<$Res>
    implements _$$AuthWithAppleCopyWith<$Res> {
  __$$AuthWithAppleCopyWithImpl(
      _$AuthWithApple _value, $Res Function(_$AuthWithApple) _then)
      : super(_value, (v) => _then(v as _$AuthWithApple));

  @override
  _$AuthWithApple get _value => super._value as _$AuthWithApple;
}

/// @nodoc

class _$AuthWithApple implements AuthWithApple {
  const _$AuthWithApple();

  @override
  String toString() {
    return 'AuthType.authWithApple()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthWithApple);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authWithApple,
    required TResult Function() authWithGoogle,
    required TResult Function(String email, String password)
        authWithEmailAndPassword,
  }) {
    return authWithApple();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authWithApple,
    TResult Function()? authWithGoogle,
    TResult Function(String email, String password)? authWithEmailAndPassword,
  }) {
    return authWithApple?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authWithApple,
    TResult Function()? authWithGoogle,
    TResult Function(String email, String password)? authWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (authWithApple != null) {
      return authWithApple();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthWithApple value) authWithApple,
    required TResult Function(AuthWithGoogle value) authWithGoogle,
    required TResult Function(AuthWithEmailAndPassword value)
        authWithEmailAndPassword,
  }) {
    return authWithApple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthWithApple value)? authWithApple,
    TResult Function(AuthWithGoogle value)? authWithGoogle,
    TResult Function(AuthWithEmailAndPassword value)? authWithEmailAndPassword,
  }) {
    return authWithApple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthWithApple value)? authWithApple,
    TResult Function(AuthWithGoogle value)? authWithGoogle,
    TResult Function(AuthWithEmailAndPassword value)? authWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (authWithApple != null) {
      return authWithApple(this);
    }
    return orElse();
  }
}

abstract class AuthWithApple implements AuthType {
  const factory AuthWithApple() = _$AuthWithApple;
}

/// @nodoc
abstract class _$$AuthWithGoogleCopyWith<$Res> {
  factory _$$AuthWithGoogleCopyWith(
          _$AuthWithGoogle value, $Res Function(_$AuthWithGoogle) then) =
      __$$AuthWithGoogleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthWithGoogleCopyWithImpl<$Res> extends _$AuthTypeCopyWithImpl<$Res>
    implements _$$AuthWithGoogleCopyWith<$Res> {
  __$$AuthWithGoogleCopyWithImpl(
      _$AuthWithGoogle _value, $Res Function(_$AuthWithGoogle) _then)
      : super(_value, (v) => _then(v as _$AuthWithGoogle));

  @override
  _$AuthWithGoogle get _value => super._value as _$AuthWithGoogle;
}

/// @nodoc

class _$AuthWithGoogle implements AuthWithGoogle {
  const _$AuthWithGoogle();

  @override
  String toString() {
    return 'AuthType.authWithGoogle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthWithGoogle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authWithApple,
    required TResult Function() authWithGoogle,
    required TResult Function(String email, String password)
        authWithEmailAndPassword,
  }) {
    return authWithGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authWithApple,
    TResult Function()? authWithGoogle,
    TResult Function(String email, String password)? authWithEmailAndPassword,
  }) {
    return authWithGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authWithApple,
    TResult Function()? authWithGoogle,
    TResult Function(String email, String password)? authWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (authWithGoogle != null) {
      return authWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthWithApple value) authWithApple,
    required TResult Function(AuthWithGoogle value) authWithGoogle,
    required TResult Function(AuthWithEmailAndPassword value)
        authWithEmailAndPassword,
  }) {
    return authWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthWithApple value)? authWithApple,
    TResult Function(AuthWithGoogle value)? authWithGoogle,
    TResult Function(AuthWithEmailAndPassword value)? authWithEmailAndPassword,
  }) {
    return authWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthWithApple value)? authWithApple,
    TResult Function(AuthWithGoogle value)? authWithGoogle,
    TResult Function(AuthWithEmailAndPassword value)? authWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (authWithGoogle != null) {
      return authWithGoogle(this);
    }
    return orElse();
  }
}

abstract class AuthWithGoogle implements AuthType {
  const factory AuthWithGoogle() = _$AuthWithGoogle;
}

/// @nodoc
abstract class _$$AuthWithEmailAndPasswordCopyWith<$Res> {
  factory _$$AuthWithEmailAndPasswordCopyWith(_$AuthWithEmailAndPassword value,
          $Res Function(_$AuthWithEmailAndPassword) then) =
      __$$AuthWithEmailAndPasswordCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class __$$AuthWithEmailAndPasswordCopyWithImpl<$Res>
    extends _$AuthTypeCopyWithImpl<$Res>
    implements _$$AuthWithEmailAndPasswordCopyWith<$Res> {
  __$$AuthWithEmailAndPasswordCopyWithImpl(_$AuthWithEmailAndPassword _value,
      $Res Function(_$AuthWithEmailAndPassword) _then)
      : super(_value, (v) => _then(v as _$AuthWithEmailAndPassword));

  @override
  _$AuthWithEmailAndPassword get _value =>
      super._value as _$AuthWithEmailAndPassword;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$AuthWithEmailAndPassword(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthWithEmailAndPassword implements AuthWithEmailAndPassword {
  const _$AuthWithEmailAndPassword(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthType.authWithEmailAndPassword(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthWithEmailAndPassword &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$AuthWithEmailAndPasswordCopyWith<_$AuthWithEmailAndPassword>
      get copyWith =>
          __$$AuthWithEmailAndPasswordCopyWithImpl<_$AuthWithEmailAndPassword>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authWithApple,
    required TResult Function() authWithGoogle,
    required TResult Function(String email, String password)
        authWithEmailAndPassword,
  }) {
    return authWithEmailAndPassword(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authWithApple,
    TResult Function()? authWithGoogle,
    TResult Function(String email, String password)? authWithEmailAndPassword,
  }) {
    return authWithEmailAndPassword?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authWithApple,
    TResult Function()? authWithGoogle,
    TResult Function(String email, String password)? authWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (authWithEmailAndPassword != null) {
      return authWithEmailAndPassword(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthWithApple value) authWithApple,
    required TResult Function(AuthWithGoogle value) authWithGoogle,
    required TResult Function(AuthWithEmailAndPassword value)
        authWithEmailAndPassword,
  }) {
    return authWithEmailAndPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthWithApple value)? authWithApple,
    TResult Function(AuthWithGoogle value)? authWithGoogle,
    TResult Function(AuthWithEmailAndPassword value)? authWithEmailAndPassword,
  }) {
    return authWithEmailAndPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthWithApple value)? authWithApple,
    TResult Function(AuthWithGoogle value)? authWithGoogle,
    TResult Function(AuthWithEmailAndPassword value)? authWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (authWithEmailAndPassword != null) {
      return authWithEmailAndPassword(this);
    }
    return orElse();
  }
}

abstract class AuthWithEmailAndPassword implements AuthType {
  const factory AuthWithEmailAndPassword(
      final String email, final String password) = _$AuthWithEmailAndPassword;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$AuthWithEmailAndPasswordCopyWith<_$AuthWithEmailAndPassword>
      get copyWith => throw _privateConstructorUsedError;
}
