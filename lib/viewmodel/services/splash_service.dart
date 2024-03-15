import 'dart:async';

import 'package:get/get.dart';
import 'package:noviindus_machine_test/res/routes/routes_name.dart';

class SplashService {
  void isLogin() {
    Timer(Duration(seconds: 3), () {
      Get.offNamed(RouteName.loginView);
    });
  }
}
