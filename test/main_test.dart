import 'package:flutter_test/flutter_test.dart';

import 'package:desafio_yeslist/main.dart';

void main() {
  testWidgets('Deve indicar que está na Tela Base',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final titleFinder = find.text('Desafio YesList');

    expect(titleFinder, findsOneWidget);
  });
}
