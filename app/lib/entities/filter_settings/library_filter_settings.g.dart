// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_filter_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LibraryFilterSettingsCWProxy {
  LibraryFilterSettings hue(double? hue);

  LibraryFilterSettings searchTerm(String? searchTerm);

  LibraryFilterSettings showBranches(List<String>? showBranches);

  LibraryFilterSettings showBrands(List<String>? showBrands);

  LibraryFilterSettings showTypes(List<ColorItemType>? showTypes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LibraryFilterSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LibraryFilterSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  LibraryFilterSettings call({
    double? hue,
    String? searchTerm,
    List<String>? showBranches,
    List<String>? showBrands,
    List<ColorItemType>? showTypes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLibraryFilterSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLibraryFilterSettings.copyWith.fieldName(...)`
class _$LibraryFilterSettingsCWProxyImpl
    implements _$LibraryFilterSettingsCWProxy {
  final LibraryFilterSettings _value;

  const _$LibraryFilterSettingsCWProxyImpl(this._value);

  @override
  LibraryFilterSettings hue(double? hue) => this(hue: hue);

  @override
  LibraryFilterSettings searchTerm(String? searchTerm) =>
      this(searchTerm: searchTerm);

  @override
  LibraryFilterSettings showBranches(List<String>? showBranches) =>
      this(showBranches: showBranches);

  @override
  LibraryFilterSettings showBrands(List<String>? showBrands) =>
      this(showBrands: showBrands);

  @override
  LibraryFilterSettings showTypes(List<ColorItemType>? showTypes) =>
      this(showTypes: showTypes);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LibraryFilterSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LibraryFilterSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  LibraryFilterSettings call({
    Object? hue = const $CopyWithPlaceholder(),
    Object? searchTerm = const $CopyWithPlaceholder(),
    Object? showBranches = const $CopyWithPlaceholder(),
    Object? showBrands = const $CopyWithPlaceholder(),
    Object? showTypes = const $CopyWithPlaceholder(),
  }) {
    return LibraryFilterSettings(
      hue: hue == const $CopyWithPlaceholder()
          ? _value.hue
          // ignore: cast_nullable_to_non_nullable
          : hue as double?,
      searchTerm: searchTerm == const $CopyWithPlaceholder()
          ? _value.searchTerm
          // ignore: cast_nullable_to_non_nullable
          : searchTerm as String?,
      showBranches: showBranches == const $CopyWithPlaceholder()
          ? _value.showBranches
          // ignore: cast_nullable_to_non_nullable
          : showBranches as List<String>?,
      showBrands: showBrands == const $CopyWithPlaceholder()
          ? _value.showBrands
          // ignore: cast_nullable_to_non_nullable
          : showBrands as List<String>?,
      showTypes: showTypes == const $CopyWithPlaceholder()
          ? _value.showTypes
          // ignore: cast_nullable_to_non_nullable
          : showTypes as List<ColorItemType>?,
    );
  }
}

extension $LibraryFilterSettingsCopyWith on LibraryFilterSettings {
  /// Returns a callable class that can be used as follows: `instanceOfLibraryFilterSettings.copyWith(...)` or like so:`instanceOfLibraryFilterSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LibraryFilterSettingsCWProxy get copyWith =>
      _$LibraryFilterSettingsCWProxyImpl(this);
}
