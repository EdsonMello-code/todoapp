import 'unit.dart';

abstract interface class Either<L, R> {
  Unit fold({
    Unit Function(R value)? right,
    Unit Function(L value)? left,
  });
}

class Right<L, R> extends Either<L, R> {
  final R _value;

  Right(this._value);

  @override
  Unit fold({
    Unit Function(R value)? right,
    Unit Function(L value)? left,
  }) {
    right?.call(_value);
    return unit;
  }
}

class Left<L, R> extends Either<L, R> {
  final L _failure;

  Left(this._failure);

  @override
  Unit fold({
    Unit Function(R value)? right,
    Unit Function(L value)? left,
  }) {
    left?.call(_failure);
    return unit;
  }
}
