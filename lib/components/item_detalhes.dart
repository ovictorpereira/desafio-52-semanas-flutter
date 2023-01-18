import 'package:desafio_52_semanas/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/objetivos.dart';
import '../utils.dart';

class ItemDetalhes extends StatelessWidget {
  const ItemDetalhes({
    Key? key,
    required this.indexObjetivo,
    required this.indexSemana,
    required this.semana,
  }) : super(key: key);

  final int indexObjetivo;
  final int indexSemana;
  final Map semana;

  @override
  Widget build(BuildContext context) {
    return Consumer<ObjetivosModel>(builder: (context, value, child) {
      return Column(
        children: [
          CheckboxListTile(
            tileColor: semana['realizado'] ? Colors.green : Colors.white,
            activeColor: Colors.green,
            controlAffinity: ListTileControlAffinity.leading,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Semana ${(indexSemana + 1).toString()}',
                      style: semana['realizado']
                          ? kItemDetalheTituloMarcado
                          : kItemDetalheTituloDesmarcado,
                    ),
                    Text(
                      formataData.format(semana['data']),
                      style: semana['realizado']
                          ? kItemDetalheDataMarcado
                          : kItemDetalheDataDesmarcado,
                    ),
                  ],
                ),
                Flexible(
                  child: Text(
                    'R\$ ${formataMoeda.format(semana['valor'])}',
                    overflow: TextOverflow.ellipsis,
                    style: semana['realizado']
                        ? kItemDetalheValorMarcado
                        : kItemDetalheValorDesmarcado,
                  ),
                )
              ],
            ),
            value: semana['realizado'],
            onChanged: (bool? v) {
              value.alteraSemanaRealizada(v, indexObjetivo, indexSemana);
            },
          ),
          const SizedBox(
            height: 6,
          ),
        ],
      );
    });
  }
}

//
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// Text(
// (indexSemana + 1).toString(),
// style: semana['realizado']
// ? kItemDetalheMarcado
//     : kItemDetalheDesmarcado,
// ),
// Text(
// 'R\$ ${formataMoeda.format(semana['valor'])}',
// style: semana['realizado']
// ? kItemDetalheMarcado
//     : kItemDetalheDesmarcado,
// ),
// Text(
// formataData.format(semana['data']),
// style: semana['realizado']
// ? kItemDetalheMarcado
//     : kItemDetalheDesmarcado,
// )
// ],
// ),
