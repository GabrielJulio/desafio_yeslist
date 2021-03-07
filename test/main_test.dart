import 'package:desafio_yeslist/home_page/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:desafio_yeslist/main.dart';

void main() {
  testWidgets('Deve carregar a HomePage', (WidgetTester tester) async {
    await tester.pumpWidget(YesListChallengeApp());
    final homePageFinder = find.byType(HomePage);

    expect(homePageFinder, findsOneWidget);
  });
}
