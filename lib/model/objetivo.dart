import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class Objetivo {
  String titulo;
  double progressao;
  DateTime inicio;

  Objetivo({
    required this.titulo,
    required this.progressao,
    required this.inicio,
  });

  final formataMoeda = NumberFormat("#,##0.00", "pt_BR");

  List calculaSemanas() {
    List semanas = [];
    double soma = 0;
    for (int i = 0; i < 52; i++) {
      soma = soma + progressao;

      DateTime dia = Jiffy.parseFromDateTime(inicio).add(weeks: i).dateTime;
      Map<String, dynamic> item = {
        'data': dia,
        'realizado': false,
        'valor': soma
      };
      semanas.add(item);
    }
    return semanas;
  }

  String progressaoCounter() {
    double soma = 0;
    double count = 0;
    for (int i = 0; i < 52; i++) {
      soma = soma + (progressao);
      count = count + soma;
    }
    return formataMoeda.format(count);
  }
}
