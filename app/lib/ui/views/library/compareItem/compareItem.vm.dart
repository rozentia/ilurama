import 'package:dartz/dartz.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/locator/locator.dart';
import '../../../../entities/color_item/color_item.dart';
import '../../../../models/models.dart';
import '../../../../services/library/library.dart';

class CompareItemViewModel extends BaseViewModel {
  final ColorItem source;
  final ColorItem originalTarget;
  final LibraryServiceInterface _libraryService;
  late ColorItem _target;

  final ValueNotifier<double> fader = ValueNotifier<double>(0);

  CompareItemViewModel(
    this.source,
    this.originalTarget, {
    LibraryService? libraryService,
  })  : _libraryService = libraryService ?? getIt<LibraryServiceInterface>(),
        _target = originalTarget;

  void fade(double value) => fader
    ..value = value
    ..notifyListeners();

  ///@ Source item's brand
  Option<Brand> get sourceItemBrand => _libraryService.brandForKey(source.item.fold((l) => l.brand, (r) => ''));

  ///@ Target item's brand
  Option<Brand> get targetItemBrand => _libraryService.brandForKey(_target.item.fold((l) => l.brand, (r) => ''));

  ColorItem get target => _target;

  void updateTarget(ColorItem newTarget) {
    _target = newTarget;
    notifyListeners();
  }

  ///@
  Option<List<num?>> get sourceGraphData => source.graphData;
  Option<List<num?>> get targetGraphData => _target.graphData;

  ///@
  Option<List<num>> get sourceGraphStops => sourceItemBrand.map<List<num>>((brand) => brand.graphStops ?? []);
  Option<List<num>> get targetGraphStops => targetItemBrand.map<List<num>>((brand) => brand.graphStops ?? []);

  ///@
  ColorItem? getColorItemFromKey(String? key) => key == null
      ? null
      : _libraryService.productForKey(key).fold(
            () => null,
            (product) => ColorItem.fromProduct(product),
          );
}
