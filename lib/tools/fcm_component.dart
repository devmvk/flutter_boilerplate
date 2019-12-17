import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:project_boilerplate/utils/logger.dart';

class FCMComponent {
  FCMComponent._();

  static FCMComponent get instance => FCMComponent._();
  final FirebaseMessaging _fbMessaging = FirebaseMessaging();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();
  final String fcmToken = "FCM_TOKEN_KEY";

  Future<void> init() async {
    await this.handleMessaging();
    await this.initFbMessaging();
    appLog.d("FCM component initialization complete");
  }

  Future initFbMessaging() async {
    appLog.i("initFbMessaging");
    _fbMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        appLog.i("onMessage");
        showNotification(message);
        return;
      },
      onResume: (Map<String, dynamic> message) {
        appLog.i("onResume");
        showNotification(message);
        return;
      },
      onLaunch: (Map<String, dynamic> message) {
        appLog.i("onLaunch");
        showNotification(message);
        return;
      },
    );
    await _fbMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true),
    );
    _fbMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      appLog.i("IOS Settings registered: $settings");
    });
    _fbMessaging.getToken().then((String token) {
      assert(token != null);
      // TODO save token in storage
      appLog.i("$fcmToken : $token");
      //KeyValueStorage.instance.save(key: fcmToken, value: token);
    });
  }

  Future<void> showNotification(Map<String, dynamic> message) async {
    var android = AndroidNotificationDetails("devmvk-flutter-boilerplate",
        "Boilerplate", "An app with 3rd party apps config");
    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android, iOS);
    appLog.i("notification message : $message");
    await flutterLocalNotificationPlugin.show(
      (DateTime.now().millisecondsSinceEpoch / 1000).round(),
      message["notification"]["title"],
      message["notification"]["body"],
      platform,
    );
  }

  Future handleMessaging() async{
    appLog.i("handleMessaging");
    var android = new AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var platform = new InitializationSettings(android, ios);
    await flutterLocalNotificationPlugin.initialize(platform);
    _fbMessaging
        .requestNotificationPermissions(); //Default requests for sound, alert and badge as true
    _fbMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      appLog.i("Settings registered: $settings");
    });
  }
}
