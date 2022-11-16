// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'content_element_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContentElement {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ColorItem item) colorItemElement,
    required TResult Function(Collection collection) collectionElement,
    required TResult Function(Scene scene) sceneElement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ColorItem item)? colorItemElement,
    TResult Function(Collection collection)? collectionElement,
    TResult Function(Scene scene)? sceneElement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ColorItem item)? colorItemElement,
    TResult Function(Collection collection)? collectionElement,
    TResult Function(Scene scene)? sceneElement,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorItemElement value) colorItemElement,
    required TResult Function(CollectionElement value) collectionElement,
    required TResult Function(SceneElement value) sceneElement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ColorItemElement value)? colorItemElement,
    TResult Function(CollectionElement value)? collectionElement,
    TResult Function(SceneElement value)? sceneElement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorItemElement value)? colorItemElement,
    TResult Function(CollectionElement value)? collectionElement,
    TResult Function(SceneElement value)? sceneElement,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentElementCopyWith<$Res> {
  factory $ContentElementCopyWith(
          ContentElement value, $Res Function(ContentElement) then) =
      _$ContentElementCopyWithImpl<$Res>;
}

/// @nodoc
class _$ContentElementCopyWithImpl<$Res>
    implements $ContentElementCopyWith<$Res> {
  _$ContentElementCopyWithImpl(this._value, this._then);

  final ContentElement _value;
  // ignore: unused_field
  final $Res Function(ContentElement) _then;
}

/// @nodoc
abstract class _$$ColorItemElementCopyWith<$Res> {
  factory _$$ColorItemElementCopyWith(
          _$ColorItemElement value, $Res Function(_$ColorItemElement) then) =
      __$$ColorItemElementCopyWithImpl<$Res>;
  $Res call({ColorItem item});
}

/// @nodoc
class __$$ColorItemElementCopyWithImpl<$Res>
    extends _$ContentElementCopyWithImpl<$Res>
    implements _$$ColorItemElementCopyWith<$Res> {
  __$$ColorItemElementCopyWithImpl(
      _$ColorItemElement _value, $Res Function(_$ColorItemElement) _then)
      : super(_value, (v) => _then(v as _$ColorItemElement));

  @override
  _$ColorItemElement get _value => super._value as _$ColorItemElement;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$ColorItemElement(
      item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ColorItem,
    ));
  }
}

/// @nodoc

class _$ColorItemElement extends ColorItemElement {
  const _$ColorItemElement(this.item) : super._();

  @override
  final ColorItem item;

  @override
  String toString() {
    return 'ContentElement.colorItemElement(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorItemElement &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$$ColorItemElementCopyWith<_$ColorItemElement> get copyWith =>
      __$$ColorItemElementCopyWithImpl<_$ColorItemElement>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ColorItem item) colorItemElement,
    required TResult Function(Collection collection) collectionElement,
    required TResult Function(Scene scene) sceneElement,
  }) {
    return colorItemElement(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ColorItem item)? colorItemElement,
    TResult Function(Collection collection)? collectionElement,
    TResult Function(Scene scene)? sceneElement,
  }) {
    return colorItemElement?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ColorItem item)? colorItemElement,
    TResult Function(Collection collection)? collectionElement,
    TResult Function(Scene scene)? sceneElement,
    required TResult orElse(),
  }) {
    if (colorItemElement != null) {
      return colorItemElement(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorItemElement value) colorItemElement,
    required TResult Function(CollectionElement value) collectionElement,
    required TResult Function(SceneElement value) sceneElement,
  }) {
    return colorItemElement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ColorItemElement value)? colorItemElement,
    TResult Function(CollectionElement value)? collectionElement,
    TResult Function(SceneElement value)? sceneElement,
  }) {
    return colorItemElement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorItemElement value)? colorItemElement,
    TResult Function(CollectionElement value)? collectionElement,
    TResult Function(SceneElement value)? sceneElement,
    required TResult orElse(),
  }) {
    if (colorItemElement != null) {
      return colorItemElement(this);
    }
    return orElse();
  }
}

abstract class ColorItemElement extends ContentElement {
  const factory ColorItemElement(final ColorItem item) = _$ColorItemElement;
  const ColorItemElement._() : super._();

  ColorItem get item;
  @JsonKey(ignore: true)
  _$$ColorItemElementCopyWith<_$ColorItemElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CollectionElementCopyWith<$Res> {
  factory _$$CollectionElementCopyWith(
          _$CollectionElement value, $Res Function(_$CollectionElement) then) =
      __$$CollectionElementCopyWithImpl<$Res>;
  $Res call({Collection collection});
}

/// @nodoc
class __$$CollectionElementCopyWithImpl<$Res>
    extends _$ContentElementCopyWithImpl<$Res>
    implements _$$CollectionElementCopyWith<$Res> {
  __$$CollectionElementCopyWithImpl(
      _$CollectionElement _value, $Res Function(_$CollectionElement) _then)
      : super(_value, (v) => _then(v as _$CollectionElement));

  @override
  _$CollectionElement get _value => super._value as _$CollectionElement;

  @override
  $Res call({
    Object? collection = freezed,
  }) {
    return _then(_$CollectionElement(
      collection == freezed
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Collection,
    ));
  }
}

/// @nodoc

class _$CollectionElement extends CollectionElement {
  const _$CollectionElement(this.collection) : super._();

  @override
  final Collection collection;

  @override
  String toString() {
    return 'ContentElement.collectionElement(collection: $collection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionElement &&
            const DeepCollectionEquality()
                .equals(other.collection, collection));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(collection));

  @JsonKey(ignore: true)
  @override
  _$$CollectionElementCopyWith<_$CollectionElement> get copyWith =>
      __$$CollectionElementCopyWithImpl<_$CollectionElement>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ColorItem item) colorItemElement,
    required TResult Function(Collection collection) collectionElement,
    required TResult Function(Scene scene) sceneElement,
  }) {
    return collectionElement(collection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ColorItem item)? colorItemElement,
    TResult Function(Collection collection)? collectionElement,
    TResult Function(Scene scene)? sceneElement,
  }) {
    return collectionElement?.call(collection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ColorItem item)? colorItemElement,
    TResult Function(Collection collection)? collectionElement,
    TResult Function(Scene scene)? sceneElement,
    required TResult orElse(),
  }) {
    if (collectionElement != null) {
      return collectionElement(collection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorItemElement value) colorItemElement,
    required TResult Function(CollectionElement value) collectionElement,
    required TResult Function(SceneElement value) sceneElement,
  }) {
    return collectionElement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ColorItemElement value)? colorItemElement,
    TResult Function(CollectionElement value)? collectionElement,
    TResult Function(SceneElement value)? sceneElement,
  }) {
    return collectionElement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorItemElement value)? colorItemElement,
    TResult Function(CollectionElement value)? collectionElement,
    TResult Function(SceneElement value)? sceneElement,
    required TResult orElse(),
  }) {
    if (collectionElement != null) {
      return collectionElement(this);
    }
    return orElse();
  }
}

abstract class CollectionElement extends ContentElement {
  const factory CollectionElement(final Collection collection) =
      _$CollectionElement;
  const CollectionElement._() : super._();

  Collection get collection;
  @JsonKey(ignore: true)
  _$$CollectionElementCopyWith<_$CollectionElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SceneElementCopyWith<$Res> {
  factory _$$SceneElementCopyWith(
          _$SceneElement value, $Res Function(_$SceneElement) then) =
      __$$SceneElementCopyWithImpl<$Res>;
  $Res call({Scene scene});
}

/// @nodoc
class __$$SceneElementCopyWithImpl<$Res>
    extends _$ContentElementCopyWithImpl<$Res>
    implements _$$SceneElementCopyWith<$Res> {
  __$$SceneElementCopyWithImpl(
      _$SceneElement _value, $Res Function(_$SceneElement) _then)
      : super(_value, (v) => _then(v as _$SceneElement));

  @override
  _$SceneElement get _value => super._value as _$SceneElement;

  @override
  $Res call({
    Object? scene = freezed,
  }) {
    return _then(_$SceneElement(
      scene == freezed
          ? _value.scene
          : scene // ignore: cast_nullable_to_non_nullable
              as Scene,
    ));
  }
}

/// @nodoc

class _$SceneElement extends SceneElement {
  const _$SceneElement(this.scene) : super._();

  @override
  final Scene scene;

  @override
  String toString() {
    return 'ContentElement.sceneElement(scene: $scene)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SceneElement &&
            const DeepCollectionEquality().equals(other.scene, scene));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(scene));

  @JsonKey(ignore: true)
  @override
  _$$SceneElementCopyWith<_$SceneElement> get copyWith =>
      __$$SceneElementCopyWithImpl<_$SceneElement>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ColorItem item) colorItemElement,
    required TResult Function(Collection collection) collectionElement,
    required TResult Function(Scene scene) sceneElement,
  }) {
    return sceneElement(scene);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ColorItem item)? colorItemElement,
    TResult Function(Collection collection)? collectionElement,
    TResult Function(Scene scene)? sceneElement,
  }) {
    return sceneElement?.call(scene);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ColorItem item)? colorItemElement,
    TResult Function(Collection collection)? collectionElement,
    TResult Function(Scene scene)? sceneElement,
    required TResult orElse(),
  }) {
    if (sceneElement != null) {
      return sceneElement(scene);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ColorItemElement value) colorItemElement,
    required TResult Function(CollectionElement value) collectionElement,
    required TResult Function(SceneElement value) sceneElement,
  }) {
    return sceneElement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ColorItemElement value)? colorItemElement,
    TResult Function(CollectionElement value)? collectionElement,
    TResult Function(SceneElement value)? sceneElement,
  }) {
    return sceneElement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ColorItemElement value)? colorItemElement,
    TResult Function(CollectionElement value)? collectionElement,
    TResult Function(SceneElement value)? sceneElement,
    required TResult orElse(),
  }) {
    if (sceneElement != null) {
      return sceneElement(this);
    }
    return orElse();
  }
}

abstract class SceneElement extends ContentElement {
  const factory SceneElement(final Scene scene) = _$SceneElement;
  const SceneElement._() : super._();

  Scene get scene;
  @JsonKey(ignore: true)
  _$$SceneElementCopyWith<_$SceneElement> get copyWith =>
      throw _privateConstructorUsedError;
}
