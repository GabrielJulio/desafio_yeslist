class BottleChooser {
  late num _gallon;
  List<num> _bottles;
  num _remainingWater = 0;

  BottleChooser({required double gallon, required List<num> bottles})
      : _gallon = gallon,
        _bottles = bottles;

  // Getters
  num get gallon => _gallon;

  List<num> get bottles => _bottles;

  int get bottlesAmount => bottles.length;

  num get remainingWater => _remainingWater;

  // Setters
  set gallon(num newValue) {
    if (newValue > 0) _gallon = newValue;
  }

  set bottles(List<num> newValues) {
    if (newValues.isNotEmpty) {
      _bottles.clear();
      newValues.forEach((bottle) {
        if (bottle > 0) _bottles.add(bottle);
      });
    }
  }

  // Methods
  List<num> chooseBottles() {
    List<num> bestCombination = [];
    List<num> reverseOrderBottles = bottles;
    reverseOrderBottles.sort();
    reverseOrderBottles = List.from(reverseOrderBottles.reversed);
    _remainingWater = gallon;

    reverseOrderBottles.forEach((bottle) {
      if ((_remainingWater - bottle) >= 0) {
        _remainingWater = _remainingWater - bottle;
        bestCombination.add(bottle);
      }
    });

    return bestCombination;
  }
}
