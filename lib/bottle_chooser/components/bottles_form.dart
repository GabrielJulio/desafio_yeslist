import 'package:desafio_yeslist/bottle_chooser/bottle_chooser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottlesForm extends StatefulWidget {
  const BottlesForm();

  @override
  _BottlesFormState createState() => _BottlesFormState();
}

class _BottlesFormState extends State<BottlesForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottleChooser>(builder: (_, bottleChooser, __) {
      final screen = MediaQuery.of(context).size;

      return FormField<List<num>>(
        initialValue: bottleChooser.bottles,
        validator: (bottles) {
          if (bottles == null || bottles.isEmpty) return 'Insira uma garrafa';
          return null;
        },
        builder: (state) {
          return Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Garrafas',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.black,
                    onPressed: () {
                      state.value!.add(0);
                      state.didChange(state.value);
                    },
                  ),
                ],
              ),
              Column(children: [
                Container(
                  height: screen.height * 0.30,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.value!.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: screen.height * .06,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  initialValue: state.value![index].toString(),
                                  decoration: const InputDecoration(
                                      labelText: 'Garrafa (em Litros)',
                                      isDense: true),
                                  keyboardType: TextInputType.number,
                                  validator: (bottle) {
                                    if (bottle == null || bottle.isEmpty)
                                      return 'Obrigatório';
                                    if (num.parse(bottle) <= 0)
                                      return 'Precisa ser maior que 0';
                                    return null;
                                  },
                                  onChanged: (newValue) =>
                                      state.value![index] = num.parse(newValue),
                                ),
                              ),
                              IconButton(
                                padding: const EdgeInsets.all(0),
                                icon: Icon(Icons.remove),
                                color: Colors.red,
                                onPressed: () {
                                  state.value!.remove(state.value![index]);
                                  state.didChange(state.value);
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ]),
              if (state.hasError)
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    state.errorText!,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                )
            ],
          );
        },
      );
    });
  }
}
