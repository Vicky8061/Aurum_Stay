import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class DestinationCard extends StatelessWidget {
  final String name;
  final String image;

  const DestinationCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Stack(
        children: [
          Image.asset(image, width: 180, height: 140, fit: BoxFit.cover),
          Container(
            width: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.15),
                  Colors.black.withOpacity(0.65),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              name,
              style: const TextStyle(
                color: AppColors.goldText,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
