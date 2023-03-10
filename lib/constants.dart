import 'package:flutter/material.dart';

const kInputDecoration = InputDecorationTheme(
  border: OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Colors.purple),
  ),
  floatingLabelStyle: TextStyle(color: Colors.purple),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Colors.amberAccent),
  ),
);

const kAppBar = AppBarTheme(
  backgroundColor: Colors.purple,
  iconTheme: IconThemeData(color: Color(0xFFf5a91f)),
);

const kTituloHome = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 30,
);

const kTotal = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);

const kTituloDetalhe = TextStyle(
  fontSize: 23,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const kItemDetalheValorMarcado = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kItemDetalheValorDesmarcado = TextStyle(
  color: Colors.black54,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kItemDetalheDataMarcado = TextStyle(
  color: Colors.white,
  fontSize: 14.0,
);

const kItemDetalheDataDesmarcado = TextStyle(
  color: Colors.black54,
  fontSize: 14.0,
);

const kItemDetalheTituloMarcado = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 15.0,
);

const kItemDetalheTituloDesmarcado = TextStyle(
  color: Colors.black54,
  fontWeight: FontWeight.bold,
  fontSize: 15.0,
);
