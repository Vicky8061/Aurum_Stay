import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../model/booking_model.dart';
import '../model/villa_model.dart';

class BookingController extends GetxController {
  final BookingModel model;

  // Require villa in constructor
  BookingController({required VillaModel villa})
    : model = BookingModel(villa: villa);

  /// Date Picker
  Future<void> pickDate(
    BuildContext context,
    bool isCheckIn,
    VoidCallback refresh,
  ) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    if (!isCheckIn && model.checkIn == null) return; // prevent crash

    DateTime firstDate = isCheckIn
        ? today
        : model.checkIn!.add(const Duration(days: 1));
    DateTime initialDate = firstDate;

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
