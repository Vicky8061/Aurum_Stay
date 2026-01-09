class BookingModel {
  DateTime? checkIn;
  DateTime? checkOut;
  int guests = 2;

  /// Calculate number of nights
  int get nights {
    if (checkIn == null || checkOut == null) return 0;
    return checkOut!.difference(checkIn!).inDays;
  }

  /// Calculate total price based on price per night
  String totalPrice(String pricePerNight) {
    if (pricePerNight.isEmpty || nights == 0) return "0";
    final price =
        int.tryParse(pricePerNight.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    return (price * nights).toString();
  }
}
