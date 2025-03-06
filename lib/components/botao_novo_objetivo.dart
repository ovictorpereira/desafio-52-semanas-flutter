import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/objetivo.dart';
import '../model/objetivos.dart';

class NovoObjetivoBtn extends StatelessWidget {
  const NovoObjetivoBtn({
    super.key,
    required this.nome,
    required this.valor,
    required this.data,
    required this.horario,
  });

  final String nome;
  final String valor;
  final String data;
  final String horario;

  @override
  Widget build(BuildContext context) {
    return Consumer<ObjetivosModel>(
      builder: (context, value, child) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            minimumSize: const Size.fromHeight(36),
          ),
          onPressed:
              nome == '' || data == '' || horario == ''
                  ? null
                  : () {
                    String dt = '$data $horario';
                    Objetivo dados = Objetivo(
                      titulo: nome,
                      progressao: double.parse(valor),
                      inicio: DateFormat('dd/MM/yyyy hh:mm').parse(dt),
                    );
                    value.adiciona(dados);
                    Navigator.pop(context);
                  },
          child: const Text('Começar!'),
        );
      },
    );
  }
}
