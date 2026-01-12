import 'package:flutter/material.dart';
import 'package:aurum_stay/utils/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onClear;
  final ValueChanged<String> onChanged;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onClear,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: AppColors.gold),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Search hotels, rooms, cities",
                hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                border: InputBorder.none,
              ),
              onChanged: onChanged,
            ),
          ),
          if (controller.text.isNotEmpty)
            GestureDetector(
              onTap: onClear,
              child: const Icon(Icons.close, color: Colors.white54),
            ),
        ],
      ),
    );
  }
}
