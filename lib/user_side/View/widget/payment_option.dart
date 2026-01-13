// ignore_for_file: deprecated_member_use
import 'package:aurum_stay/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentOption extends StatelessWidget {
  final String value;
  final String groupValue;
  final String title;
  final String subtitle;
  final IconData icon;
  final Function(String) onChanged;

  const PaymentOption({
    super.key,
    required this.value,
    required this.icon,
    required this.groupValue,
    required this.title,
    required this.onChanged,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? AppColors.goldText : Colors.white24,
        ),
      ),
      child: RadioListTile<String>(
        value: value,
        groupValue: groupValue,
        activeColor: AppColors.goldText,
        onChanged: (val) => onChanged(val!),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Row(
          children: [
            Icon(icon, color: AppColors.goldText),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 36),
          child: Text(
            subtitle,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ),
      ),
    );
  }
}
