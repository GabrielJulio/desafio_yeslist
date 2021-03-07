import 'package:desafio_yeslist/bottle_chooser/bottle_chooser.dart';
import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final listEquals = DeepCollectionEquality.unordered().equals;
  test('Deve informar o volume do galão de água', () {
    final bottleChooser = BottleChooser();
    bottleChooser.gallon = 5;

    expect(bottleChooser.gallon, equals(5));
  });

  test('Deve informar a quantidade de garrafas', () {
    final bottleChooser = BottleChooser();
    bottleChooser.gallon = 5;
    bottleChooser.bottles = [1.5, 2.6, 5];

    expect(bottleChooser.bottlesAmount, equals(3));
  });

  test('Deve informar os volumes das garrafas', () {
    final bottleChooser = BottleChooser();
    bottleChooser.gallon = 7;
    bottleChooser.bottles = [1.5, 2.6, 5];

    expect(bottleChooser.bottles, equals([1.5, 2.6, 5]));
  });

  test('Deve informar o volume de sobra água', () {
    final bottleChooser = BottleChooser();
    bottleChooser.gallon = 7;
    bottleChooser.bottles = [1, 2.2, 3.7];

    expect(bottleChooser.remainingWater, equals(0));
  });

  test(
      'Deve escolher a melhor combinação de garrafas:\n'
      '- Preencher totalmente o Galão com a água das garrafas escolhidas\n'
      '- Gastar a menor quantidade garrafas possível\n'
      '- Se sobrar água, que seja a menor quantidade possível\n', () {
    BottleChooser bottleChooser = BottleChooser();
    bottleChooser.gallon = 7;
    bottleChooser.bottles = [1, 3, 4.5, 1.5, 3.5];

    expect(listEquals(bottleChooser.chooseBottles(), ([1, 1.5, 4.5])), true);
    expect(bottleChooser.remainingWater, equals(0));

    bottleChooser.gallon = 5;
    bottleChooser.bottles = [1, 3, 4.5, 1.5];

    expect(listEquals(bottleChooser.chooseBottles(), ([4.5])), true);
    expect(bottleChooser.remainingWater, equals(0.5));

    bottleChooser.gallon = 10.4;
    bottleChooser.bottles = [6, 1.3, 1.5, 3];

    expect(listEquals(bottleChooser.chooseBottles(), ([3, 6, 1.3])), true);
    expect(bottleChooser.remainingWater, equals(0.1));
  });
}
