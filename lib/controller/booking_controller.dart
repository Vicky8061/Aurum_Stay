import 'package:flutter/material.dart';
import '../model/booking_model.dart';

class BookingController {
  final BookingModel model = BookingModel();

  /// Date Picker (your exact logic)
  Future<void> pickDate(
    BuildContext context,
    bool isCheckIn,
    VoidCallback refresh,
  ) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    DateTime firstDate;
    DateTime initialDate;

    if (isCheckIn) {
      firstDate = today;
      initialDate = today;
    } else {
      final checkInDate = DateTime(
        model.checkIn!.year,
        model.checkIn!.month,
        model.checkIn!.day,
      );
      firstDate = checkInDate.add(const Duration(days: 1));
      initialDate = firstDate;
    }

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: today.add(const Duration(days: 365)),
    );

    if (picked != null) {
      if (isCheckIn) {
        model.checkIn = picked;
        model.checkOut = null;
      } else {
        model.checkOut = picked;
      }
      refresh();
    }
  }

  void increaseGuests(VoidCallback refresh) {
    model.guests++;
    refresh();
  }

  void decreaseGuests(VoidCallback refresh) {
    if (model.guests > 1) {
      model.guests--;
      refresh();
    }
  }
}
