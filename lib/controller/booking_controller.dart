import 'package:flutter/material.dart';
import '../model/booking_model.dart';

class BookingController extends ChangeNotifier {
  final BookingModel booking = BookingModel();

  /// Pick Date
  Future<void> pickDate(BuildContext context, bool isCheckIn) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isCheckIn
          ? DateTime.now()
          : (booking.checkIn ?? DateTime.now()).add(const Duration(days: 1)),
      firstDate: isCheckIn
          ? DateTime.now()
          : (booking.checkIn ?? DateTime.now()),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      if (isCheckIn) {
        booking.checkIn = picked;
        booking.checkOut = null;
      } else {
        booking.checkOut = picked;
      }
      notifyListeners();
    }
  }

  /// Guest Count
  void increaseGuests() {
    booking.guests++;
    notifyListeners();
  }

  void decreaseGuests() {
    if (booking.guests > 1) {
      booking.guests--;
      notifyListeners();
    }
  }
}
