import 'package:aurum_stay/model/booking_model.dart';
import 'package:get/get.dart';

class UserBookingsController extends GetxController {
  // List of all bookings
  var bookings = <BookingModel>[].obs;

  void addBooking(BookingModel booking) {
    bookings.add(booking);
  }

  void removeBooking(BookingModel booking) {
    bookings.remove(booking);
  }
}
