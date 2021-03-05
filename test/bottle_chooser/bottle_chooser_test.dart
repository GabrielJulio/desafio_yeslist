import 'package:desafio_yeslist/bottle_chooser/bottle_chooser.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Deve informar o volume do galão de água', () {
    final bottleChooser = BottleChooser(gallon: 5);

    equals(bottleChooser, 5);
  });

  test('Deve informar a quantidade de garrafas', () {
    final bottleChooser = BottleChooser(gallon: 5, bottles: [1.5, 2.6, 5]);

    equals(bottleChooser.bottlesAmount, 3);
  });

  test(
      'Deve informar a quantidade de garrafas mesmo que este não tenha sido informado',
      () {
    final bottleChooser = BottleChooser(gallon: 5);

    equals(bottleChooser.bottlesAmount, 0);
  });

  test('Deve informar os volumes das garrafas', () {
    final bottleChooser = BottleChooser(gallon: 7, bottles: [1.5, 2.6, 5]);

    listEquals(bottleChooser.bottles, [1.5, 2.6, 5]);
  });

  test('Deve informar o volume de sobra água', () {
    final bottleChooser = BottleChooser(gallon: 7, bottles: [1, 2.2, 3.7]);

    equals(bottleChooser.remainingWater, 0);
  });
}
