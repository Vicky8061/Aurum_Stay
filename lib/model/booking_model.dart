class BookingModel {
  DateTime? checkIn;
  DateTime? checkOut;
  int guests;

  BookingModel({this.checkIn, this.checkOut, this.guests = 2});

  bool get isValid => checkIn != null && checkOut != null;

  int get nights {
    if (checkIn == null || checkOut == null) return 0;
    return checkOut!.difference(checkIn!).inDays;
  }

  int totalPrice(int pricePerNight) {
    return nights * pricePerNight;
  }
}
