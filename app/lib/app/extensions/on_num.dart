extension Integer on int {
  ///@ Returns the distance of this number from [baseNumber]
  int distanceFrom(int baseNumber) => baseNumber - this < 0 ? baseNumber - this * -1 : baseNumber - this;
}

extension Floating on double {
  ///@ Returns the distance of this number from [baseNumber]
  double distanceFrom(double baseNumber) => baseNumber - this < 0 ? baseNumber - this * -1 : baseNumber - this;
}
