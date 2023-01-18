import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'objetivo.dart';

class ObjetivosModel extends ChangeNotifier {
  final _db = Hive.box('database');
  List _objetivos = [];

  get objetivos => _objetivos;

  void loadDb() {
    if (_db.get("dbObjetivos") != null) {
      _objetivos = _db.get("dbObjetivos");
    }
  }

  void updateDb() {
    _db.put("dbObjetivos", _objetivos);
  }

  void adiciona(Objetivo objetivo) {
    Map<String, dynamic> item = {
      'titulo': objetivo.titulo,
      'inicio': objetivo.inicio,
      'progressao': objetivo.progressao,
      'total': objetivo.progressaoCounter(),
      'semanas': objetivo.calculaSemanas(),
    };

    _objetivos.add(item);
    notifyListeners();
    updateDb();
  }

  void alteraSemanaRealizada(bool? valor, int indexObjetivo, int indexSemana) {
    _objetivos[indexObjetivo]['semanas'][indexSemana]['realizado'] = valor;
    notifyListeners();
    updateDb();
  }

  void excluiObjetivo(int indexObjetivo) {
    var timer = Timer(const Duration(milliseconds: 200), () {
      _objetivos.removeAt(indexObjetivo);
      notifyListeners();
      updateDb();
    });
  }
}
