import 'package:flutter/material.dart';

import 'objetivo.dart';

class ObjetivosModel extends ChangeNotifier {
  final List _objetivos = [];

  get objetivos => _objetivos;

  void adiciona(Objetivo objetivo) {
    // List item = [objetivo, objetivo.calculaSemanas()];

    Map<String, dynamic> item = {
      'titulo': objetivo.titulo,
      'inicio': objetivo.inicio,
      'progressao': objetivo.progressao,
      'total': objetivo.progressaoCounter(),
      'semanas': objetivo.calculaSemanas(),
    };

    _objetivos.add(item);
    notifyListeners();
  }

  void alteraSemanaRealizada(bool? valor, int indexObjetivo, int indexSemana) {
    _objetivos[indexObjetivo]['semanas'][indexSemana]['realizado'] = valor;
    notifyListeners();
  }

  void excluiObjetivo(int indexObjetivo) {
    _objetivos.removeAt(indexObjetivo);
    notifyListeners();
  }
}
