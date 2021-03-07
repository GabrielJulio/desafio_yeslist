import 'package:desafio_yeslist/bottle_chooser/bottle_chooser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page/home_page.dart';

void main() {
  runApp(YesListChallengeApp());
}

class YesListChallengeApp extends StatelessWidget {
  final title = 'Desafio YesList';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BottleChooser(),
      lazy: false,
      child: MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(title: title),
      ),
    );
  }
}
