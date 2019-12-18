import 'package:project_boilerplate/services/handlers/network/api_urls.dart';
import 'package:project_boilerplate/services/handlers/network/network_handler.dart';
import 'package:project_boilerplate/utils/app_strings.dart';
import 'package:project_boilerplate/utils/functions.dart';

class AppDataInterface{
  AppDataInterface._();
  static AppDataInterface get instance => AppDataInterface._();

  final NetworkHandler _networkHandler = NetworkHandler(
    baseURL: getBuildMode() == AppStrings.RELEASE
        ? APIUrls.prodBaseUrl
        : APIUrls.testBaseUrl,
  );
  NetworkHandler get networkHandler => this._networkHandler;
}