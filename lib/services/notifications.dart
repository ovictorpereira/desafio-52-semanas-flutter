import 'package:awesome_notifications/awesome_notifications.dart';

class Notificacao {
  void novaNotificacao(int id, String titulo, DateTime data) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: id,
          channelKey: 'lembrete',
          title: titulo,
          body:
              'Dia de guardar dinheiro para o Desafio 52 Semanas! Não se esqueça! :)',
          actionType: ActionType.Default),
      schedule: NotificationCalendar.fromDate(date: data),
    );
  }

  void grupoNotificacaoSemanas(List ids, List semanas, String titulo) {
    for (int i = 0; i < 52; i++) {
      int id = ids[i];
      Map semana = semanas[i];
      novaNotificacao(id, titulo, semana['data']);
    }
  }

  void cancelaGrupo(List ids) {
    for (int i = 0; i < 52; i++) {
      int id = ids[i];
      AwesomeNotifications().cancel(id);
    }
  }
}
