import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ilurama/entities/content_types/color_item_type.dart';

part 'library_filter_settings.g.dart';

@immutable
@CopyWith()
class LibraryFilterSettings extends Equatable {
  final List<String> _showBrands;
  final List<String> _showBranches;
  final String? _searchTerm;
  final List<ColorItemType> _showTypes;
  final double? _hue;

  const LibraryFilterSettings({
    double? hue,
    List<String>? showBrands,
    String? searchTerm,
    List<ColorItemType>? showTypes,
    List<String>? showBranches,
  })  : _showBrands = showBrands ?? const [],
        _showBranches = showBranches ?? const [],
        _searchTerm = searchTerm,
        _showTypes = showTypes ?? const [],
        _hue = hue;

  factory LibraryFilterSettings.clear() {
    return const LibraryFilterSettings(showBrands: [], showTypes: []);
  }

  bool get isClear => _searchTerm == null && _showBrands.isEmpty && _showBranches.isEmpty && _showTypes.isEmpty;

  double? get hue => _hue;
  List<String> get showBrands => _showBrands;
  List<String> get showBranches => _showBranches;
  String? get searchTerm => _searchTerm;
  List<ColorItemType> get showTypes => _showTypes;

  LibraryFilterSettings toggleBrand(String brand) => copyWith.showBrands(_showBrands.contains(brand)
      ? ([..._showBrands]..removeWhere((element) => element == brand))
      : ([..._showBrands, brand]));

  LibraryFilterSettings toggleType(ColorItemType type) => copyWith.showTypes(_showTypes.contains(type)
      ? ([..._showTypes]..removeWhere((element) => element == type))
      : ([..._showTypes, type]));

  @override
  List<Object?> get props => [
        _showBrands,
        _searchTerm,
        _showTypes,
        _hue,
      ];
}
