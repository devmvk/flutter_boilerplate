import 'dart:io';

import 'package:project_boilerplate/utils/app_strings.dart';

String getBuildMode() {
  if (const bool.fromEnvironment("dart.vm.product")) {
    return AppStrings.RELEASE;
  }
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode ? AppStrings.DEBUG : AppStrings.PROFILE;
}

String getAppPlatform() {
  return Platform.isAndroid ? AppStrings.ANDROID : AppStrings.IOS;
}