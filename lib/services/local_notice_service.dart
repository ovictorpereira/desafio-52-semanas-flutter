// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// class LocalNoticeService {
//   static final LocalNoticeService _notificationService =
//       LocalNoticeService._internal();
//
//   factory LocalNoticeService() {
//     return _notificationService;
//   }
//   LocalNoticeService._internal();
//
//   final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   Future<void> setup() async {
//     // #1
//     const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const iosSetting = DarwinInitializationSettings();
//
//     // #2
//     const initSettings =
//         InitializationSettings(android: androidSetting, iOS: iosSetting);
//
//     // #3
//     await _localNotificationsPlugin.initialize(initSettings).then((_) {
//       debugPrint('setupPlugin: setup success');
//     }).catchError((Object error) {
//       debugPrint('Error: $error');
//     });
//   }
//
//   // String title,
//   //     String body,
//   // int endTime, {
//   // int id = 0,
//   //     String sound = '',
//   // String channel = 'default',
//
//   Future<void> addNotification(
//       {required String title,
//       required String body,
//       required int endTime,
//       required int id,
//       String sound = '',
//       String channel = 'default'}) async {
//     // #1
//     // Initialized the timezone data and defined the time to
//     // wake the notification up. Since the plugin uses tz.TZDateTime as
//     // input for time, you need to convert the endTime value to tz.TZDateTime.
//     tz.initializeTimeZones();
//     final scheduleTime =
//         tz.TZDateTime.fromMillisecondsSinceEpoch(tz.local, endTime);
//
//     // #2
//     final androidDetail = AndroidNotificationDetails(
//         channel, // channel Id
//         channel // channel Name
//         );
//
//     final iosDetail = DarwinNotificationDetails();
//
//     final noticeDetail = NotificationDetails(
//       iOS: iosDetail,
//       android: androidDetail,
//     );
//
//     // #3
//     // Defined the ID of the notification.
//     // It’s useful when you want to cancel a particular notification.
//     // In this tutorial, you don’t need to cancel any particular notification.
//     // Therefore, you can use 0 for all notifications.
//     // final id = 0;
//
//     // #4
//     // Scheduled the notification based on the user’s time zone.
//     await _localNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       scheduleTime,
//       noticeDetail,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       androidAllowWhileIdle: true,
//     );
//   }
//
//   void cancelAllNotification(id) {
//     _localNotificationsPlugin.cancel(id);
//   }
// }
//
// // LocalNoticeService().addNotification(
// // title: 'Primeiro',
// // body: 'Corpo',
// // endTime: DateTime.now().millisecondsSinceEpoch + 1000,
// // id: 0,
// // );
// //
// // LocalNoticeService().addNotification(
// // title: 'Terceiro',
// // body: 'Corpo',
// // endTime:
// // DateTime.now().add(Duration(seconds: 1)).millisecondsSinceEpoch,
// // id: 0,
// // );
