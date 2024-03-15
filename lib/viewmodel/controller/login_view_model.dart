import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:noviindus_machine_test/repository/login_repository/login_repository.dart';
import 'package:noviindus_machine_test/utils/utils.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  void loginApi() {
    loading.value = true;
    Map<String, dynamic> data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    _api
        .loginApi(data)
        .then((value) => Utils.snackbar("Login Success"))
        .onError((error, stackTrace) => Utils.snackbar("Login Fails"));
  }
}
