import 'package:aurum_stay/user_side/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    scaleAnimation = Tween<double>(begin: 0.85, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOutBack),
    );

    animationController.forward();

    _goToLogin();
  }

  void _goToLogin() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.off(() => const LoginScreen());
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
