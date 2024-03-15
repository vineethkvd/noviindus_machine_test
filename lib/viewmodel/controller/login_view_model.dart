import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:noviindus_machine_test/repository/login_repository/login_repository.dart';
import 'package:noviindus_machine_test/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/home_view.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;

  Future<void> loginApi() async {
    loading.value = true;
    var data = {
      'username': emailController.value.text,
      'password': passwordController.value.text,
    };
    try {
      final token = await _api.loginApi(data);
      if (token != null) {
        // Save token to shared preferences
        await saveTokenToSharedPreferences(token);
        Utils.snackbar("Login Success");
        // Navigate to Home Page
        Get.offAll(HomePage());
      } else {
        Utils.snackbar("Login Failed");
      }
    } catch (error) {
      Utils.snackbar("An error occurred during login");
    } finally {
      loading.value = false;
    }
  }

  Future<void> saveTokenToSharedPreferences(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getTokenFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> checkLoginStatus() async {
    final token = await getTokenFromSharedPreferences();
    if (token != null) {
      // Navigate to Home Page
      Get.offAll(HomePage());
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Check login status when the view model is initialized
    checkLoginStatus();
  }
}
