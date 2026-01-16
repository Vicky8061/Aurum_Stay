import 'package:aurum_stay/model/villa_model.dart';

class BookingModel {
  final VillaModel villa; // required
  DateTime? checkIn;
  DateTime? checkOut;
  int guests;

  BookingModel({
    required this.villa,
    this.checkIn,
    this.checkOut,
    this.guests = 1,
  });

  /// Number of nights
  int get nights {
    if (checkIn == null || checkOut == null) return 0;
    return checkOut!.difference(checkIn!).inDays;
  }

  /// Total price calculation
  double totalPrice(double price) {
    return nights * villa.price; // price comes from villa
  }
}
