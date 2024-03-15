import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../res/colors/app_color.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void toastMessage(BuildContext context, String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.blueColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
  static void snackbar(String message, {String? title}) {
    Get.snackbar(
      title ?? "",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColor.blueColor,
      colorText: Colors.white,
      duration: Duration(seconds: 3),
    );
  }
}
