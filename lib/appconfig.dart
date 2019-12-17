

import 'package:project_boilerplate/tools/fcm_component.dart';

class AppConfig{
  AppConfig(){
    FCMComponent.instance.init();
  }
}