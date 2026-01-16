import 'package:aurum_stay/model/booking_model.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  /// current tab index
  var currentIndex = 0.obs;
  var bookings = <BookingModel>[].obs;

  void changeTab(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
  }

  void addBooking(BookingModel booking) {
    bookings.add(booking);
  }
}
