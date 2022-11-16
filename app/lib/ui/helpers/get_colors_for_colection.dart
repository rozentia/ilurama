import 'package:ilurama/app/locator/locator.dart';
import 'package:ilurama/models/models.dart';
import 'package:ilurama/services/library/library.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

Future<List<Color>> getColorsForCollection(Collection collection) async {
  final libraryService = getIt<LibraryServiceInterface>();
  final productColors = libraryService
      .productsForKeys(collection.products ?? [])
      .fold<List<Product>>(
          [], (list, possibleProduct) => possibleProduct.fold(() => list, (product) => [...list, product]))
      .map<Color>((product) => product.safeColor)
      .toList();
  return [...productColors];
}
