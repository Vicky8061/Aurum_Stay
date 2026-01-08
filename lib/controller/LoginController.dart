import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/main_screen.dart';
import '../view/signup_page.dart';

class LoginController extends GetxController {
  /// Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// LOGIN BUTTON ACTION
  void login() {
    // Later: validation + Firebase
    Get.off(() => const MainScreen());
  }

  /// NAVIGATE TO SIGNUP
  void goToSignup() {
    Get.to(() => const SignupScreen());
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
