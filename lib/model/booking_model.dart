import 'package:aurum_stay/model/villa_model.dart';

class BookingModel {
  final VillaModel villa;
  DateTime? checkIn;
  DateTime? checkOut;
  int guests = 1;

  BookingModel({required this.villa, this.checkIn, this.checkOut});

  /// Number of nights
  int get nights {
    if (checkIn == null || checkOut == null) return 0;
    return checkOut!.difference(checkIn!).inDays;
  }

  /// Total price calculation
  double totalPrice(double pricePerNight) {
    return nights * pricePerNight;
  }
}
