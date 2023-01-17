import 'package:intl/intl.dart';

final formataMoeda = NumberFormat("#,##0.00", "pt_BR");
final formataData = DateFormat('dd/MM/yyyy');

String calculaAndamento(Map item) {
  double count = 0;
  for (var i in item['semanas']) {
    if (i['realizado'] == true) {
      count = count + i['valor'];
    }
  }

  return formataMoeda.format(count);
}

double calculaPorcentagemDouble(Map item) {
  double x = 0;
  for (var i in item['semanas']) {
    if (i['realizado'] == true) {
      x++;
    }
  }

  return x / 52;
}

String calculaPorcentagemString(Map item) {
  double x = 0;
  for (var i in item['semanas']) {
    if (i['realizado'] == true) {
      x++;
    }
  }

  double count = (x / 52) * 100;

  return '${count.toInt().toString()}%';
}
