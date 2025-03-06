import 'package:desafio_52_semanas/components/botao_novo_objetivo.dart';
import 'package:desafio_52_semanas/components/container_total_economizado.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NovoObjetivo extends StatefulWidget {
  const NovoObjetivo({super.key});

  @override
  State<NovoObjetivo> createState() => _NovoObjetivoState();
}

class _NovoObjetivoState extends State<NovoObjetivo> {
  late TextEditingController _nomeObjetivo;
  late TextEditingController _valorObjetivo;
  late TextEditingController _dataObjetivo;
  late TextEditingController _horarioNotificacao;

  double totalProgressao = 0;

  @override
  void initState() {
    _nomeObjetivo = TextEditingController();

    _valorObjetivo = TextEditingController();
    _valorObjetivo.addListener(progressaoCounter);
    _valorObjetivo.text = '2';

    _dataObjetivo = TextEditingController();
    _horarioNotificacao = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nomeObjetivo.dispose();
    _valorObjetivo.dispose();
    super.dispose();
  }

  final formataMoeda = NumberFormat("#,##0.00", "pt_BR");

  void progressaoCounter() {
    String num;
    _valorObjetivo.text == '' ? num = '0' : num = _valorObjetivo.text;

    double soma = 0;
    double count = 0;
    for (int i = 0; i < 52; i++) {
      soma = soma + double.parse(num);
      count = count + soma;
    }

    setState(() {
      totalProgressao = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Novo Objetivo"), elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: _nomeObjetivo,
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: 'Qual o nome do seu objetivo?',
                hintText: 'Ex.: Viagem para Paris',
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _valorObjetivo,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixText: 'R\$ ',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: 'Qual o valor incial?',
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: const [
                Icon(Icons.info, color: Colors.purple),
                SizedBox(width: 6.0),
                Flexible(
                  child: Text(
                    'O valor aumentará gradativamente a cada semana',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ContainerTotalEconomizado(
              total: formataMoeda.format(totalProgressao),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _dataObjetivo,
              readOnly: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_month),
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: 'Qual a data de início?',
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null) {
                  String formattedDate = DateFormat(
                    'dd/MM/yyyy',
                  ).format(pickedDate);
                  setState(() {
                    _dataObjetivo.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _horarioNotificacao,
              readOnly: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.schedule),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: 'Qual o melhor horário para notificações?',
              ),
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(
                        context,
                      ).copyWith(alwaysUse24HourFormat: true),
                      child: child ?? Container(),
                    );
                  },
                );

                if (pickedTime != null) {
                  final hour = pickedTime.hour.toString().padLeft(2, "0");
                  final min = pickedTime.minute.toString().padLeft(2, "0");
                  setState(() {
                    _horarioNotificacao.text = "$hour:$min";
                  });
                } else {}
              },
            ),
            const SizedBox(height: 16),
            NovoObjetivoBtn(
              nome: _nomeObjetivo.text,
              valor: _valorObjetivo.text,
              data: _dataObjetivo.text,
              horario: _horarioNotificacao.text,
            ),
          ],
        ),
      ),
    );
  }
}
