double convertRange(
    {required double originalValue,
    double originalMin = 0.0,
    double originalMax = .666,
    //kPageViewPointFraction,
    double newMin = 0.0,
    double newMax = 1.0}) {
  return ((((originalValue - originalMin) * (newMax - newMin)) /
          (originalMax - originalMin)) +
      newMin);
}
