import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator/locator.dart';
import '../../../entities/content_types/content_types.dart';
import '../../../entities/filter_settings/filter_settings.dart';
import '../../../services/content/content.dart';
import '../../../services/user/user.dart';

class LibraryFilterModalViewModel extends ReactiveViewModel {
  final ContentServiceInterface _contentService;

  LibraryFilterModalViewModel({
    ContentService? contentService,
    UserService? userService,
  }) : _contentService = contentService ?? getIt<ContentServiceInterface>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_contentService as ReactiveServiceMixin];

  LibraryFilterSettings get currentFilterSettings => _contentService.libraryFilterSettings;
  bool get hasFilter => currentFilterSettings != LibraryFilterSettings.clear();

  void clearFilterSettings() {
    _contentService.updateLibraryFilterSettings(LibraryFilterSettings.clear());
  }

  List<String> get availableBrands => _contentService.availableBrands;
  List<bool> get selectedBrands => availableBrands
      .map(
        (availableBrand) => currentFilterSettings.showBrands.contains(availableBrand),
      )
      .toList();
  void selectBrand(int selection) => _contentService.updateLibraryFilterSettings(
        currentFilterSettings.toggleBrand(availableBrands[selection]),
      );

  List<String> get availableBranches => _contentService.availableBranches.keys.toList();

  List<ColorItemType> get availableTypes => _contentService.availableTypes;
  List<bool> get selectedTypes => availableTypes.map((type) => currentFilterSettings.showTypes.contains(type)).toList();
  void selectType(int selection) => _contentService.updateLibraryFilterSettings(
        currentFilterSettings.toggleType(availableTypes[selection]),
      );

  HSVColor get currentColor => currentFilterSettings.hue == null
      ? HSVColor.fromColor(Colors.white)
      : HSVColor.fromAHSV(1, currentFilterSettings.hue!, 1, 1);

  void updateColorFilter(HSVColor newColor) {
    _contentService.updateLibraryFilterSettings(currentFilterSettings.copyWith.hue(newColor.hue));
    notifyListeners();
  }
}
