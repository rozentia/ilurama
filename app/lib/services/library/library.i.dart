import 'package:dartz/dartz.dart';

import '../../app/core/core.dart';
import '../../models/models.dart';

abstract class LibraryServiceInterface {
  ///@ The products in the library
  Iterable<Product> get products;

  ///@ Returns a possibly null product for the given key
  Option<Product> productForKey(String key);

  ///@ Returns the possible products found for given keys
  List<Option<Product>> productsForKeys(List<String> keys);

  ///@ The brands in the library
  Iterable<Brand> get brands;

  ///@ Reutrns a possibly null brand for the given key
  Option<Brand> brandForKey(String key);

  ///@ Checks if local library is outdated
  Future<bool> checkForUpdates();

  ///@ Checks the latest IluramaMeta document's library version, if outdated downloads the json files and updates the local library
  Future<Either<AppFailure, dynamic>> updateLocalLibrary();
}
