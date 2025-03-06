import 'package:desafio_52_semanas/constants.dart';
import 'package:desafio_52_semanas/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardObjetivo extends StatelessWidget {
  const CardObjetivo({super.key, required this.item, required this.index});

  final Map item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        elevation: 2,
        child: InkWell(
          splashColor: Colors.purple.withAlpha(30),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/detalhes',
              arguments: {'index': index},
            );
          },
          child: Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 16,
            ),
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
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Text('R\$ ${item['total']}', style: kTotal),
                  ],
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  color: Colors.purple,
                  minHeight: 10,
                  value: calculaPorcentagemDouble(item),
                ),
                const SizedBox(height: 10),
                Text(
                  'R\$ ${calculaAndamento(item)} de ${item['total']}',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Início:', style: TextStyle(fontSize: 15)),
                    Text(
                      DateFormat(
                        'dd/MM/yyyy',
                      ).format(item['semanas'][0]['data']),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Término:', style: TextStyle(fontSize: 15)),
                    Text(
                      DateFormat(
                        'dd/MM/yyyy',
                      ).format(item['semanas'][51]['data']),
                      style: const TextStyle(fontSize: 15),
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
