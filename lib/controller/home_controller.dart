import '../model/villa_model.dart';

class HomeController {
  /// List of dummy villas
  List<VillaModel> villas = [
    VillaModel(
      id: '1',
      title: "Ocean View Villa",
      price: 18000.00,
      image: "assets/images/villa1.jpg",
      location: "Goa",
      rating: 4.8,
      type: "Villa",
    ),
    VillaModel(
      id: '2',
      title: "Private Pool Villa",
      price: 25000,
      image: "assets/images/villa2.jpg",
      location: "Maldives",
      rating: 4.9,
      type: "Villa",
    ),
    VillaModel(
      id: '3',
      title: "Hilltop Luxury Stay",
      price: 15500,
      image: "assets/images/villa3.jpg",
      location: "Bali",
      rating: 4.7,
      type: "Resort",
    ),
    VillaModel(
      id: '4',
      title: "Royal Heritage Villa",
      price: 32000,
      image: "assets/images/villa5.jpg",
      location: "Dubai",
      rating: 5.0,
      type: "Suite",
    ),
  ];

  /// List of dummy destinations
  List<Map<String, String>> destinations = [
    {"name": "Maldives", "image": "assets/images/maldives.jpg"},
    {"name": "Dubai", "image": "assets/images/dubai.jpg"},
    {"name": "Goa", "image": "assets/images/goa.jpg"},
    {"name": "Bali", "image": "assets/images/bali.webp"},
  ];

  /// Room types
  List<String> roomTypes = ["Deluxe", "Suite", "Villa", "Resort", "Budget"];
  int selectedRoomTypeIndex = 0;

  /// Filter villas by search keyword
  List<VillaModel> searchVillas(String query) {
    if (query.isEmpty) return villas;
    return villas
        .where(
          (villa) =>
              villa.title.toLowerCase().contains(query.toLowerCase()) ||
              villa.location.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  /// Filter villas by selected room type
  List<VillaModel> filterByRoomType(String type) {
    return villas
        .where((villa) => villa.type.toLowerCase() == type.toLowerCase())
        .toList();
  }
}
