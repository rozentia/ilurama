import 'package:flutter/widgets.dart';

extension ExtendedColorList on List<Color> {
  List<Color> get seamlessSweep => [...this, first];
}

extension NonNullList<T> on List<T?> {
  List<T> get toNonNull {
    final result = <T>[];
    for (final item in this) {
      if (item != null) result.add(item);
    }
    return result;
  }
}
