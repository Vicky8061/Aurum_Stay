import 'package:aurum_stay/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// ICON ANIMATION
            AnimatedScale(
              scale: isSelected ? 1.15 : 1.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.gold.withOpacity(0.6),
                            blurRadius: 12,
                            spreadRadius: 1,
                          ),
                        ]
                      : [],
                ),
                child: Icon(
                  icon,
                  size: 26,
                  color: isSelected ? AppColors.gold : Colors.white54,
                ),
              ),
            ),

            const SizedBox(height: 4),

            /// TEXT ANIMATION
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppColors.gold : Colors.white54,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
