// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'actions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CRUDActions {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() delete,
    required TResult Function() update,
    required TResult Function() save,
    required TResult Function() read,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? delete,
    TResult Function()? update,
    TResult Function()? save,
    TResult Function()? read,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? delete,
    TResult Function()? update,
    TResult Function()? save,
    TResult Function()? read,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Delete value) delete,
    required TResult Function(Update value) update,
    required TResult Function(Save value) save,
    required TResult Function(Read value) read,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Delete value)? delete,
    TResult Function(Update value)? update,
    TResult Function(Save value)? save,
    TResult Function(Read value)? read,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Delete value)? delete,
    TResult Function(Update value)? update,
    TResult Function(Save value)? save,
    TResult Function(Read value)? read,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CRUDActionsCopyWith<$Res> {
  factory $CRUDActionsCopyWith(
          CRUDActions value, $Res Function(CRUDActions) then) =
      _$CRUDActionsCopyWithImpl<$Res>;
}

/// @nodoc
class _$CRUDActionsCopyWithImpl<$Res> implements $CRUDActionsCopyWith<$Res> {
  _$CRUDActionsCopyWithImpl(this._value, this._then);

  final CRUDActions _value;
  // ignore: unused_field
  final $Res Function(CRUDActions) _then;
}

/// @nodoc
abstract class _$$DeleteCopyWith<$Res> {
  factory _$$DeleteCopyWith(_$Delete value, $Res Function(_$Delete) then) =
      __$$DeleteCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteCopyWithImpl<$Res> extends _$CRUDActionsCopyWithImpl<$Res>
    implements _$$DeleteCopyWith<$Res> {
  __$$DeleteCopyWithImpl(_$Delete _value, $Res Function(_$Delete) _then)
      : super(_value, (v) => _then(v as _$Delete));

  @override
  _$Delete get _value => super._value as _$Delete;
}

/// @nodoc

class _$Delete extends Delete {
  const _$Delete() : super._();

  @override
  String toString() {
    return 'CRUDActions.delete()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Delete);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() delete,
    required TResult Function() update,
    required TResult Function() save,
    required TResult Function() read,
  }) {
    return delete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? delete,
    TResult Function()? update,
    TResult Function()? save,
    TResult Function()? read,
  }) {
    return delete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? delete,
    TResult Function()? update,
    TResult Function()? save,
    TResult Function()? read,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Delete value) delete,
    required TResult Function(Update value) update,
    required TResult Function(Save value) save,
    required TResult Function(Read value) read,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Delete value)? delete,
    TResult Function(Update value)? update,
    TResult Function(Save value)? save,
    TResult Function(Read value)? read,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Delete value)? delete,
    TResult Function(Update value)? update,
    TResult Function(Save value)? save,
    TResult Function(Read value)? read,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class Delete extends CRUDActions {
  const factory Delete() = _$Delete;
  const Delete._() : super._();
}

/// @nodoc
abstract class _$$UpdateCopyWith<$Res> {
  factory _$$UpdateCopyWith(_$Update value, $Res Function(_$Update) then) =
      __$$UpdateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateCopyWithImpl<$Res> extends _$CRUDActionsCopyWithImpl<$Res>
    implements _$$UpdateCopyWith<$Res> {
  __$$UpdateCopyWithImpl(_$Update _value, $Res Function(_$Update) _then)
      : super(_value, (v) => _then(v as _$Update));

  @override
  _$Update get _value => super._value as _$Update;
}

/// @nodoc

class _$Update extends Update {
  const _$Update() : super._();

  @override
  String toString() {
    return 'CRUDActions.update()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Update);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() delete,
    required TResult Function() update,
    required TResult Function() save,
    required TResult Function() read,
  }) {
    return update();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? delete,
    TResult Function()? update,
    TResult Function()? save,
    TResult Function()? read,
  }) {
    return update?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? delete,
    TResult Function()? update,
    TResult Function()? save,
    TResult Function()? read,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Delete value) delete,
    required TResult Function(Update value) update,
    required TResult Function(Save value) save,
    required TResult Function(Read value) read,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Delete value)? delete,
    TResult Function(Update value)? update,
    TResult Function(Save value)? save,
    TResult Function(Read value)? read,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Delete value)? delete,
    TResult Function(Update value)? update,
    TResult Function(Save value)? save,
    TResult Function(Read value)? read,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class Update extends CRUDActions {
  const factory Update() = _$Update;
  const Update._() : super._();
}

/// @nodoc
abstract class _$$SaveCopyWith<$Res> {
  factory _$$SaveCopyWith(_$Save value, $Res Function(_$Save) then) =
      __$$SaveCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveCopyWithImpl<$Res> extends _$CRUDActionsCopyWithImpl<$Res>
    implements _$$SaveCopyWith<$Res> {
  __$$SaveCopyWithImpl(_$Save _value, $Res Function(_$Save) _then)
      : super(_value, (v) => _then(v as _$Save));

  @override
  _$Save get _value => super._value as _$Save;
}

/// @nodoc

class _$Save extends Save {
  const _$Save() : super._();

  @override
  String toString() {
    return 'CRUDActions.save()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Save);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() delete,
    required TResult Function() update,
    required TResult Function() save,
    required TResult Function() read,
  }) {
    return save();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? delete,
    TResult Function()? update,
    TResult Function()? save,
    TResult Function()? read,
  }) {
    return save?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? delete,
    TResult Function()? update,
    TResult Function()? save,
    TResult Function()? read,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Delete value) delete,
    required TResult Function(Update value) update,
    required TResult Function(Save value) save,
    required TResult Function(Read value) read,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Delete value)? delete,
    TResult Function(Update value)? update,
    TResult Function(Save value)? save,
    TResult Function(Read value)? read,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Delete value)? delete,
    TResult Function(Update value)? update,
    TResult Function(Save value)? save,
    TResult Function(Read value)? read,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class Save extends CRUDActions {
  const factory Save() = _$Save;
  const Save._() : super._();
}

/// @nodoc
abstract class _$$ReadCopyWith<$Res> {
  factory _$$ReadCopyWith(_$Read value, $Res Function(_$Read) then) =
      __$$ReadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReadCopyWithImpl<$Res> extends _$CRUDActionsCopyWithImpl<$Res>
    implements _$$ReadCopyWith<$Res> {
  __$$ReadCopyWithImpl(_$Read _value, $Res Function(_$Read) _then)
      : super(_value, (v) => _then(v as _$Read));

  @override
  _$Read get _value => super._value as _$Read;
}

/// @nodoc

class _$Read extends Read {
  const _$Read() : super._();

  @override
  String toString() {
    return 'CRUDActions.read()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Read);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() delete,
    required TResult Function() update,
    required TResult Function() save,
    required TResult Function() read,
  }) {
    return read();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? delete,
    TResult Function()? update,
    TResult Function()? save,
    TResult Function()? read,
  }) {
    return read?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? delete,
    TResult Function()? update,
    TResult Function()? save,
    TResult Function()? read,
    required TResult orElse(),
  }) {
    if (read != null) {
      return read();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Delete value) delete,
    required TResult Function(Update value) update,
    required TResult Function(Save value) save,
    required TResult Function(Read value) read,
  }) {
    return read(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Delete value)? delete,
    TResult Function(Update value)? update,
    TResult Function(Save value)? save,
    TResult Function(Read value)? read,
  }) {
    return read?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Delete value)? delete,
    TResult Function(Update value)? update,
    TResult Function(Save value)? save,
    TResult Function(Read value)? read,
    required TResult orElse(),
  }) {
    if (read != null) {
      return read(this);
    }
    return orElse();
  }
}

abstract class Read extends CRUDActions {
  const factory Read() = _$Read;
  const Read._() : super._();
}
