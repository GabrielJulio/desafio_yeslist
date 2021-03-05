import 'package:desafio_yeslist/home_page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Deve indicar que está na Tela Base',
      (WidgetTester tester) async {
    await tester.pumpWidget(MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
            home: HomePage(
          title: 'título',
        ))));

    final textFinder = find.text('Tela Base');
    expect(textFinder, findsOneWidget);
  });
}
