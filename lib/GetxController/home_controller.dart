import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeController extends GetxController {
  var connectionStatus = 1.obs;

  // 1: connected 0: disConnected
  //bool isConnected=await InternetConnectionChecker().hasConnection;
  late StreamSubscription<InternetConnectionStatus> listener;

  @override
  void onInit() {
    super.onInit();
    listener = InternetConnectionChecker()
        .onStatusChange
        .listen((InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          connectionStatus.value = 1;
          debugPrint("connected: ${connectionStatus.value}");
          break;
        case InternetConnectionStatus.disconnected:
          connectionStatus.value = 0;

          break;
      }
    });
  }

  checkInternetAndRun(Function onConnected) {
    listener.onData((data) {
      if (data == InternetConnectionStatus.connected) {
        onConnected();
      } else if (data == InternetConnectionStatus.disconnected) {
        // TODO: Do something, like show snackbar
      }
    });
  }
}
