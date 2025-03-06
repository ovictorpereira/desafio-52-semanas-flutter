import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:desafio_52_semanas/components/lista_objetivos.dart';
import 'package:desafio_52_semanas/components/sem_objetivos.dart';
import 'package:desafio_52_semanas/model/objetivos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    final store = Provider.of<ObjetivosModel>(context, listen: false);
    store.loadDb();

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Consumer<ObjetivosModel>(
        builder: (context, value, child) {
          return value.objetivos.length == 0
              ? const SemObjetivos()
              : const ListaObjetivos();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/novo_objetivo');
        },
        backgroundColor: const Color(0xFFf5a91f),
        child: const Icon(Icons.add, color: Colors.purple),
      ),
    );
  }
}

// padding: const EdgeInsets.only(
// top: 0, left: 16, right: 30, bottom: 4),
// height: 126,
// decoration: const BoxDecoration(
// color: Colors.blue,
// borderRadius: BorderRadius.only(
// bottomRight: Radius.circular(40),
// ),
// ),

// Stack(
// fit: StackFit.loose,
// children: [
// Container(
// color: Colors.grey[100],
// ),
// Container(
// height: 160,
// decoration: const BoxDecoration(
// color: Colors.blue,
// borderRadius: BorderRadius.only(
// bottomRight: Radius.circular(40),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(
// top: 80,
// right: 20,
// left: 20,
// bottom: 20,
// ),
// child: ListView(
// children: [
// value.objetivos.length == 0
// ? const Text('Sem objetivos')
// : Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Meus objetivos',
// style: GoogleFonts.quicksand(
// textStyle: kTituloHome,
// ),
// ),
// const SizedBox(
// height: 30,
// ),
// for (int i = 0; i < value.objetivos.length; i++)
// CardObjetivo(
// item: value.objetivos[i],
// index: i,
// ),
// ],
// )
// ],
// ),
// ),
// ],
// )
