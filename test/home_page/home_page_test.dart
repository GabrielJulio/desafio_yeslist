import 'package:desafio_yeslist/bottle_chooser/components/bottle_chooser_form.dart';
import 'package:desafio_yeslist/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Deve carregar o formulário de garrafas',
      (WidgetTester tester) async {
    await tester.pumpWidget(YesListChallengeApp());

    final formFinder = find.byType(BottleChooserForm);

    expect(formFinder, findsOneWidget);
  });
}
