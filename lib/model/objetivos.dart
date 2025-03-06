import 'dart:async';

import 'package:desafio_52_semanas/services/notifications.dart';
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

  List createListIds() {
    List resultado = [];

    if (objetivos.length == 0) {
      for (int i = 0; i < 52; i++) {
        resultado.add(i + 1);
      }
    } else {
      Map o = objetivos.last;
      int p = o['idNotifications'][51];

      for (int i = p; i < p + 53; i++) {
        resultado.add(i + 1);
      }
    }

    return resultado;
  }

  void adiciona(Objetivo objetivo) {
    Map<String, dynamic> item = {
      'titulo': objetivo.titulo,
      'inicio': objetivo.inicio,
      'idNotifications': createListIds(),
      'progressao': objetivo.progressao,
      'total': objetivo.progressaoCounter(),
      'semanas': objetivo.calculaSemanas(),
    };

    _objetivos.add(item);
    notifyListeners();
    updateDb();
    Notificacao().grupoNotificacaoSemanas(
      item['idNotifications'],
      item['semanas'],
      item['titulo'],
    );
  }

  void alteraSemanaRealizada(bool? valor, int indexObjetivo, int indexSemana) {
    _objetivos[indexObjetivo]['semanas'][indexSemana]['realizado'] = valor;
    notifyListeners();
    updateDb();
  }

  void excluiObjetivo(int indexObjetivo) {
    Notificacao().cancelaGrupo(objetivos[indexObjetivo]['idNotifications']);
    Timer(const Duration(milliseconds: 200), () {
      _objetivos.removeAt(indexObjetivo);
      notifyListeners();
      updateDb();
    });
  }
}
