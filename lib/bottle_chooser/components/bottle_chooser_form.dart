import 'package:desafio_yeslist/bottle_chooser/bottle_chooser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'bottles_form.dart';

class BottleChooserForm extends StatefulWidget {
  @override
  _BottleChooserFormState createState() => _BottleChooserFormState();
}

class _BottleChooserFormState extends State<BottleChooserForm> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final primaryColor = Theme.of(context).primaryColor;
    final screen = MediaQuery.of(context).size;

    return Consumer<BottleChooser>(builder: (_, bottleChooser, __) {
      return Form(
        key: formKey,
        child: Center(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Galão (em Litros)',
                ),
                enabled: !bottleChooser.isLoading,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (gallon) {
                  if (gallon == null || gallon.isEmpty)
                    return 'Preencha o volume do galão em Litros';
                  else
                    return null;
                },
                onSaved: (gallon) => bottleChooser.gallon = num.parse(gallon!),
              ),
              SizedBox(height: screen.height * .025),
              BottlesForm(),
              SizedBox(height: screen.height * .025),
              SizedBox(
                  height: screen.height * .05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        primary: primaryColor),
                    onPressed: !bottleChooser.isLoading
                        ? () async {
                            if (formKey.currentState == null) {
                              return null;
                            }
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              bottleChooser.isLoading = true;
                              bottleChooser.chooseBottles();
                              bottleChooser.isLoading = false;
                            }
                          }
                        : null,
                    child: bottleChooser.isLoading
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                        : const Text(
                            'Obter melhor combinação de garrafas',
                            style: TextStyle(fontSize: 16),
                          ),
                  ))
            ],
          ),
        ),
      );
    });
  }
}
