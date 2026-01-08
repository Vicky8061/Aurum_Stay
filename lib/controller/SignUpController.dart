import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  /// Text Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// SIGN UP ACTION
  void signup() {
    // Later: validation + Firebase
    Get.back(); // go back to login after signup
  }

  /// GO BACK TO LOGIN
  void goToLogin() {
    Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
