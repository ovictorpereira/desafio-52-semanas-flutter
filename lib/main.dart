import 'package:desafio_52_semanas/model/objetivos.dart';
import 'package:desafio_52_semanas/pages/detalhes.dart';
import 'package:desafio_52_semanas/pages/home.dart';
import 'package:desafio_52_semanas/pages/novo_objetivo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ObjetivosModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.blue),
    );
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/novo_objetivo': (context) => const NovoObjetivo(),
        '/detalhes': (context) => const Detalhes(),
      },
    );
  }
}
