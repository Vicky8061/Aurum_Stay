import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

import '../../model/booking_model.dart';
import '../../utils/app_colors.dart';

class MyBookingsScreen extends StatelessWidget {
  final RxList<BookingModel> bookings;

  const MyBookingsScreen({super.key, required this.bookings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('My Bookings'),
        backgroundColor: AppColors.bg,
      ),
      body: Obx(() {
        if (bookings.isEmpty) {
          return const Center(
            child: Text(
              'No bookings yet',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];

            return Card(
              color: Colors.white12,
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: _buildImage(booking.villa.image),
                ),
                title: Text(
                  booking.villa.title,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '${booking.nights} nights • ${booking.guests} guests',
                  style: const TextStyle(color: Colors.white70),
                ),
                trailing: Text(
                  '₹${booking.totalPrice(booking.villa.price).toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: AppColors.goldText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  // 🌐 Cross-platform image loader
  Widget _buildImage(String path) {
    if (kIsWeb) {
      return Image.network(
        path,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            const Icon(Icons.image, color: Colors.white),
      );
    } else {
      return Image.file(
        File(path),
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            const Icon(Icons.image, color: Colors.white),
      );
    }
  }
}
