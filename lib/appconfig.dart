

import 'package:project_boilerplate/services/app_data_interface.dart';
import 'package:project_boilerplate/tools/fcm_component.dart';

class AppConfig{ 

  final AppDataInterface _appDataInterface = AppDataInterface.instance;
  AppDataInterface get appDataInterface => this._appDataInterface;

  AppConfig(){
    FCMComponent.instance.init();
  }
}