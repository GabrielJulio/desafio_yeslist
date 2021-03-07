import 'package:desafio_yeslist/bottle_chooser/bottle_chooser.dart';
import 'package:desafio_yeslist/bottle_chooser/components/bottle_chooser_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * .7,
          width: MediaQuery.of(context).size.width * .7,
          child: ClipRect(
            child: Column(
              children: [
                BottleChooserForm(),
                SizedBox(
                  height: 30,
                ),
                Consumer<BottleChooser>(builder: (_, bottleChooser, __) {
                  if (bottleChooser.bestCombination.length > 0) {
                    return Row(children: [
                      Text(
                          'A melhor combinção é usando as garrafas de volume:'),
                      Row(
                        children: bottleChooser.bestCombination
                            .map((bottle) => Text(
                                  ' ${bottle}L',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ))
                            .toList(),
                      )
                    ]);
                  } else {
                    return Container();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
