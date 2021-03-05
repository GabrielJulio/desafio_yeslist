class BottleChooser {
  late num _gallon;
  List<num> _bottles = [];
  num _remainingWater = 0;

  BottleChooser({required gallon, bottles});

  // Getters
  num get gallon => _gallon;

  List<num> get bottles => _bottles;

  int get bottlesAmount => bottles.length;

  num get remainingWater => _remainingWater;

  // Setters
  set gallon(num newValue) {
    if (newValue > 0) _gallon = newValue;
  }

  set bottles(List<num> startValues) {
    if (startValues.isNotEmpty) {
      startValues.forEach((bottle) {
        if (bottle > 0) _bottles.add(bottle);
      });
    }
  }
}
