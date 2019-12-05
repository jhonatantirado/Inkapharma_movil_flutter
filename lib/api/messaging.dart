import 'dart:convert';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class Messaging {
  static final Client client = Client();

  static const String serverKey =
      'AAAAJEyvbGo:APA91bF2Q03acJGqMHrjoJcDd8noVWnPK0CDX004Tfaza7kdAkxUb1ulA6wl2SsfyJRJLO58rbs1mvpfbKIaT8q6dWbOIGhmbGFkFjxF69AD_c8KU5yOtNU03gxHijLDPnAYBQ_g7Or7';

  static Future<Response> sendToAll({
    @required String title,
    @required String body,
  }) =>
      sendToTopic(title: title, body: body, topic: 'all');

  static Future<Response> sendToTopic(
          {@required String title,
          @required String body,
          @required String topic}) =>
      sendTo(title: title, body: body, fcmToken: '/topics/$topic');

  static Future<Response> sendTo({
    @required String title,
    @required String body,
    @required String fcmToken,
  }) =>
      client.post(
        'https://fcm.googleapis.com/fcm/send',
        body: json.encode({
          'notification': {'body': '$body', 'title': '$title'},
          'priority': 'high',
          'data': {
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done',
            'title': 'Title',
            'body': 'Body'
          },
          'to': '$fcmToken',
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverKey',
        },
      );
}
