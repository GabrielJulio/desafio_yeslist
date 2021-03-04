import 'package:flutter_test/flutter_test.dart';

import 'package:desafio_yeslist/main.dart';

void main() {
  testWidgets('Deve indicar que está na Tela Base',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Tela Base'), findsOneWidget);
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsNothing);
  });
}
