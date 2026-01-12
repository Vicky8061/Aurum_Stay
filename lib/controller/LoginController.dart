import 'package:aurum_stay/user_side/view/main_screen.dart';
import 'package:aurum_stay/user_side/view/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
