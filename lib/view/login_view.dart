import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/component/button_widget.dart';
import '../viewmodel/controller/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  final LoginViewModel viewModel = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(() => TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: viewModel.emailController.value,
                    focusNode: viewModel.emailFocusNode.value,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  )),
              const SizedBox(height: 20),
              Obx(() => TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    controller: viewModel.passwordController.value,
                    focusNode: viewModel.passwordFocusNode.value,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  )),
              const SizedBox(height: 20),
              Obx(() => ButtonWidget(
                    // Use Obx to update button based on loading state
                    text: 'Login',
                    color: Colors.blue, // Set desired color for the button
                    borderRadius:
                        BorderRadius.circular(8), // Set desired border radius
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        viewModel.loginApi(); // Call loginApi method
                      }
                    },
                    isLoading: viewModel
                        .loading.value, // Pass loading state to ButtonWidget
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
