import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

import '../core/core.dart';

extension PotentialEmptyFailure<T> on Option<T> {
  Either<AppFailure, T> getOrFailure(String functionName) => fold(
        () => Left(EmptyValueReceived(functionName)),
        (a) => Right(a),
      );
  Widget getOrEmptyWidget(Widget Function(T) ifSome) => fold(() => const SizedBox(), ifSome);
}

extension ExpandListOfEither<T, K> on Iterable<Either<T, K>> {
  bool get hasLeft => fold<bool>(
        false,
        (previousValue, element) => previousValue ? previousValue : element.isLeft(),
      );

  Iterable<T> get allLeft => fold<Iterable<T>>(
        [],
        (previousValue, element) => element.isRight()
            ? previousValue
            : [...previousValue, element.swap().getOrElse(() => throw UnimplementedError())],
      );
}

extension ResolveLeft<T, K> on Either<T, K> {
  T get leftOrThrow => swap().getOrElse(() => throw UnimplementedError());
  K get rightOrThrow => getOrElse(() => throw UnimplementedError());
}
