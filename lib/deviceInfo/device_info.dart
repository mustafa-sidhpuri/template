import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfo {
  //TODO: change values as per the versions and change same for backend
  String deviceId = '';
  String deviceNo = '';
  String deviceModelNo = '';
  String deviceName = '';
  String deviceType = '';
  String osVersion = '';
  String appVersion = '';

  //this will be used for mobile apps
  late PackageInfo packageInfo;

  static final DeviceInfo _singleTon =
  DeviceInfo._internal();

  DeviceInfo._internal();

  static getInstance() => _singleTon;

  void initialize() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    packageInfo = await PackageInfo.fromPlatform();

    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      // change properties for web
      deviceId = webBrowserInfo.appName.toString();
      deviceNo = webBrowserInfo.appName.toString();
      deviceModelNo = webBrowserInfo.browserName.toString();
      deviceName = webBrowserInfo.appName.toString();
      deviceType = 'W';
      osVersion = webBrowserInfo.appVersion.toString();
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.androidId.toString();
      deviceNo = androidInfo.androidId.toString();
      deviceModelNo = androidInfo.model.toString();
      deviceName = androidInfo.brand.toString();
      deviceType = 'A';
      osVersion = androidInfo.version.release.toString();
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor.toString();
      deviceNo = iosInfo.identifierForVendor.toString();
      deviceModelNo = iosInfo.model.toString();
      deviceName = iosInfo.name.toString();
      deviceType = 'I';
      osVersion = iosInfo.systemVersion.toString();
    } else if (Platform.isMacOS) {
      MacOsDeviceInfo macOsDeviceInfo = await deviceInfo.macOsInfo;
      deviceId = macOsDeviceInfo.computerName.toString() +
          macOsDeviceInfo.hostName.toString();
      deviceNo = macOsDeviceInfo.computerName.toString() +
          macOsDeviceInfo.hostName.toString();
      deviceModelNo = macOsDeviceInfo.model.toString();
      deviceName = macOsDeviceInfo.computerName.toString();
      deviceType = 'M';
      osVersion = macOsDeviceInfo.kernelVersion.toString();
    } 
    appVersion = packageInfo.version;
  }
}

