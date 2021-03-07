import 'package:flutter/material.dart';

class BottleChooser extends ChangeNotifier {
  num gallon = 0;
  List<num> bottles = [];
  num _remainingWater = 0;
  bool _isLoading = false;

  List<num> bestCombination = [];

  BottleChooser();

  // Getters
  int get bottlesAmount => bottles.length;

  num get remainingWater => num.parse(_remainingWater.toStringAsFixed(2));

  bool get isLoading => _isLoading;

  // Setters
  set isLoading(bool newValue) {
    _isLoading = newValue;
    notifyListeners();
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

    this.bestCombination = bestCombination;
    notifyListeners();
    return bestCombination;
  }
}
