import 'package:aurum_stay/controller/splashcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0F172A), Color(0xFF020617)],
          ),
        ),
        child: FadeTransition(
          opacity: controller.fadeAnimation,
          child: ScaleTransition(
            scale: controller.scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// LOGO
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC9A24D),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFC9A24D).withOpacity(0.4),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Image.asset("assets/images/logo.png", width: 115),
                ),

                const SizedBox(height: 28),

                /// APP NAME
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Shimmer.fromColors(
                      baseColor: const Color(0xFFC9A24D),
                      highlightColor: Colors.white,
                      child: const Text(
                        "Aurum",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Stay",
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                const Text(
                  "Where Luxury Feels Like Home",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
