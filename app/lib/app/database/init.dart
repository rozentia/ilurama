import 'package:ilurama/app/database/constants.dart';
import 'package:ilurama/models/models.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initializeDatabase() async {
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(DatabaseConstants.adapterIdProductFormat)) {
    Hive.registerAdapter(ProductFormatAdapter());
  }
  if (!Hive.isAdapterRegistered(DatabaseConstants.adapterIdTransmissionData)) {
    Hive.registerAdapter(TransmissionDataAdapter());
  }
  if (!Hive.isAdapterRegistered(DatabaseConstants.adapterIdProduct)) {
    Hive.registerAdapter(ProductAdapter());
  }
  if (!Hive.isAdapterRegistered(DatabaseConstants.adapterIdBrand)) {
    Hive.registerAdapter(BrandAdapter());
  }

  await Hive.openBox<Product>(DatabaseConstants.productsBoxName);
  await Hive.openBox<Brand>(DatabaseConstants.brandsBoxName);
}
