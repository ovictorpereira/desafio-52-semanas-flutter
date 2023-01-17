import 'package:desafio_52_semanas/components/botao_novo_objetivo.dart';
import 'package:desafio_52_semanas/components/container_total_economizado.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NovoObjetivo extends StatefulWidget {
  const NovoObjetivo({Key? key}) : super(key: key);

  @override
  State<NovoObjetivo> createState() => _NovoObjetivoState();
}

class _NovoObjetivoState extends State<NovoObjetivo> {
  late TextEditingController _nomeObjetivo;
  late TextEditingController _valorObjetivo;
  late TextEditingController _dataObjetivo;

  double totalProgressao = 0;

  @override
  void initState() {
    _nomeObjetivo = TextEditingController();

    _valorObjetivo = TextEditingController();
    _valorObjetivo.addListener(progressaoCounter);
    _valorObjetivo.text = '2';

    _dataObjetivo = TextEditingController();
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
      appBar: AppBar(
        title: const Text("Novo Objetivo"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nomeObjetivo,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: 'Qual o nome do seu objetivo?',
                hintText: 'Ex.: Viagem para Paris',
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _valorObjetivo,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
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
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: const [
                Icon(
                  Icons.info,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 6.0,
                ),
                Expanded(
                  child: Text(
                    'O valor aumentará gradativamente a cada semana',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ContainerTotalEconomizado(
              total: formataMoeda.format(totalProgressao),
            ),
            const SizedBox(
              height: 20,
            ),
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
                    firstDate: DateTime(2022),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                  setState(() {
                    _dataObjetivo.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
            ),
            const SizedBox(
              height: 16,
            ),
            NovoObjetivoBtn(
              nome: _nomeObjetivo.text,
              valor: _valorObjetivo.text,
              data: _dataObjetivo.text,
            ),
          ],
        ),
      ),
    );
  }
}