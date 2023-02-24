import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:desafio_52_semanas/constants.dart';
import 'package:desafio_52_semanas/model/objetivos.dart';
import 'package:desafio_52_semanas/pages/detalhes.dart';
import 'package:desafio_52_semanas/pages/home.dart';
import 'package:desafio_52_semanas/pages/novo_objetivo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('database');

  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'lembrete',
          channelName: 'Lembrete Depositos',
          channelDescription: 'Lembrete para realização do depósito semanal',
        )
      ],
      debug: true);

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
      const SystemUiOverlayStyle(statusBarColor: Colors.purple),
    );
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: kInputDecoration,
        appBarTheme: kAppBar,
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('pt', 'BR'),
      ],
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
