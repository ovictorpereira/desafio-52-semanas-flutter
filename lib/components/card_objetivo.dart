import 'package:desafio_52_semanas/constants.dart';
import 'package:desafio_52_semanas/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardObjetivo extends StatelessWidget {
  const CardObjetivo({Key? key, required this.item, required this.index})
      : super(key: key);

  final Map item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        elevation: 2,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');

            // Navigator.pushNamed(context, '/detalhes');

            Navigator.pushNamed(
              context,
              '/detalhes',
              arguments: {'index': index},
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item['titulo'],
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Text(
                      'R\$ ${item['total']}',
                      style: kTotal,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                  minHeight: 6,
                  value: calculaPorcentagemDouble(item),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'R\$ ${calculaAndamento(item)} de ${item['total']}',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Início:'),
                    Text(
                      DateFormat('dd/MM/yyyy')
                          .format(item['semanas'][0]['data']),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Término:'),
                    Text(
                      DateFormat('dd/MM/yyyy')
                          .format(item['semanas'][51]['data']),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
