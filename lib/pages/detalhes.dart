import 'package:desafio_52_semanas/constants.dart';
import 'package:desafio_52_semanas/model/objetivos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/item_detalhes.dart';
import '../utils.dart';

class Detalhes extends StatefulWidget {
  const Detalhes({Key? key}) : super(key: key);

  @override
  State<Detalhes> createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final oIndex = arguments['index'];

    return Consumer<ObjetivosModel>(
      builder: (context, value, child) {
        final Map item = value.objetivos[oIndex];
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            elevation: 0,
            actions: [
              PopupMenuButton(
                onSelected: (String v) {
                  if (v == 'excluir') {
                    value.excluiObjetivo(oIndex);
                    Navigator.pop(context, 'excluir');
                  }
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: 'excluir',
                      child: Row(
                        children: const [
                          Icon(
                            Icons.delete,
                            color: Colors.blue,
                          ),
                          Text('Excluir objetivo'),
                        ],
                      ),
                    ),
                  ];
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 16, left: 16, right: 30, bottom: 4),
                height: 140,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        item['titulo'],
                        style: kTituloDetalhe,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Text(
                          calculaPorcentagemString(item),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: LinearProgressIndicator(
                            color: Colors.yellow[200],
                            minHeight: 12,
                            value: calculaPorcentagemDouble(item),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Text(
                          'R\$ ${calculaAndamento(item)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          ' / R\$ ${item['total']}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[200],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: item['semanas'].length,
                    itemBuilder: (context, i) {
                      return ItemDetalhes(
                        indexObjetivo: oIndex,
                        indexSemana: i,
                        semana: item['semanas'][i],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Scaffold(
// backgroundColor: Colors.grey[200],
// appBar: AppBar(
// elevation: 0,
// actions: [
// PopupMenuButton(
// onSelected: (String v) {
// print(v);
// },
// itemBuilder: (context) {
// return [
// PopupMenuItem(
// value: 'excluir',
// child: Row(
// children: const [
// Icon(
// Icons.delete,
// color: Colors.blue,
// ),
// Text('Excluir objetivo'),
// ],
// ),
// ),
// ];
// },
// ),
// ],
// ),
// body: Container(),
// )

// Consumer<ObjetivosModel>(
// builder: (context, value, child) {
// final Map item = value.objetivos[oIndex];
// return Container();
// },
// ),

// Column(
// children: [
// Container(
// padding: const EdgeInsets.only(
// top: 0, left: 16, right: 30, bottom: 4),
// height: 126,
// decoration: const BoxDecoration(
// color: Colors.blue,
// borderRadius: BorderRadius.only(
// bottomRight: Radius.circular(40),
// ),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Flexible(
// child: Text(
// item['titulo'],
// style: kTituloDetalhe,
// ),
// ),
// const SizedBox(
// height: 10.0,
// ),
// Row(
// children: [
// Text(
// calculaPorcentagemString(item),
// style: const TextStyle(color: Colors.white),
// ),
// const SizedBox(
// width: 16,
// ),
// Expanded(
// child: LinearProgressIndicator(
// color: Colors.yellow[200],
// minHeight: 6,
// value: calculaPorcentagemDouble(item),
// ),
// ),
// ],
// ),
// const SizedBox(
// height: 6,
// ),
// Row(
// children: [
// Text(
// 'R\$ ${calculaAndamento(item)}',
// style: const TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// ),
// ),
// Text(
// ' / R\$ ${item['total']}',
// style: TextStyle(
// fontSize: 16,
// color: Colors.grey[200],
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// Expanded(
// child: Padding(
// padding: const EdgeInsets.all(16.0),
// child: ListView.builder(
// itemCount: item['semanas'].length,
// itemBuilder: (context, i) {
// return ItemDetalhes(
// indexObjetivo: oIndex,
// indexSemana: i,
// semana: item['semanas'][i],
// );
// },
// ),
// ),
// ),
// ],
// )
