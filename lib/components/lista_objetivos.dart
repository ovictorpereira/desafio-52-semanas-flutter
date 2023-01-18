import 'package:desafio_52_semanas/constants.dart';
import 'package:desafio_52_semanas/model/objetivos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'card_objetivo.dart';

class ListaObjetivos extends StatelessWidget {
  const ListaObjetivos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ObjetivosModel>(
      builder: (context, value, child) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 66,
                left: 16,
                right: 16,
              ),
              height: 130,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: const Text(
                'Meus objetivos',
                style: kTituloHome,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10.0),
                  itemCount: value.objetivos.length,
                  itemBuilder: (context, i) {
                    return CardObjetivo(
                      item: value.objetivos[i],
                      index: i,
                    );
                  }),
            )
          ],
        );
      },
    );
  }
}
