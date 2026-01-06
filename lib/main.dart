import 'package:aurum_stay/View/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AurumStay());
}

class AurumStay extends StatelessWidget {
  const AurumStay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
