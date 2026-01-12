import 'dart:ui';
import 'package:aurum_stay/user_side/View/widget/aurum_text_field.dart';
import 'package:aurum_stay/controller/SignUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F172A), Color(0xFF020617)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                width: 380,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white24, width: 1.2),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 90,
                      color: const Color(0xFFFFC107),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      "Create Your Account",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      "Start your luxury journey with Aurum Stay",
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 28),

                    AurumTextField(
                      hint: "Full Name",
                      icon: Icons.person_outline,
                      controller: controller.nameController,
                    ),

                    const SizedBox(height: 16),

                    AurumTextField(
                      hint: "Email Address",
                      icon: Icons.email_outlined,
                      controller: controller.emailController,
                    ),

                    const SizedBox(height: 16),

                    AurumTextField(
                      hint: "Password",
                      icon: Icons.lock_outline,
                      controller: controller.passwordController,
                      obscure: true,
                    ),

                    const SizedBox(height: 28),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFC107),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: controller.signup,
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.white70),
                        ),
                        TextButton(
                          onPressed: controller.goToLogin,
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xFFFFC107),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
