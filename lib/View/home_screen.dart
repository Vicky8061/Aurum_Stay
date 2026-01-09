import 'package:aurum_stay/View/details_screen.dart';
import 'package:aurum_stay/View/widget/aurum_app_bar.dart';
import 'package:aurum_stay/View/widget/destination_card.dart';
import 'package:aurum_stay/View/widget/room_type_chip.dart';
import 'package:aurum_stay/View/widget/search_bar.dart';
import 'package:aurum_stay/View/widget/stay_card.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  /// DATA (Later replace with API)
  final List<Map<String, String>> destinations = [
    {"name": "Maldives", "image": "assets/images/maldives.jpg"},
    {"name": "Dubai", "image": "assets/images/dubai.jpg"},
    {"name": "Goa", "image": "assets/images/goa.jpg"},
    {"name": "Bali", "image": "assets/images/bali.webp"},
  ];

  final List<Map<String, String>> villas = [
    {
      "title": "Ocean View Villa",
      "price": "₹18,000 / night",
      "image": "assets/images/villa1.jpg",
    },
    {
      "title": "Private Pool Villa",
      "price": "₹25,000 / night",
      "image": "assets/images/villa2.jpg",
    },
    {
      "title": "Hilltop Luxury Stay",
      "price": "₹15,500 / night",
      "image": "assets/images/villa3.jpg",
    },
    {
      "title": "Royal Heritage Villa",
      "price": "₹32,000 / night",
      "image": "assets/images/villa5.jpg",
    },
  ];

  final List<String> roomTypes = [
    "Deluxe",
    "Suite",
    "Villa",
    "Resort",
    "Budget",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: const AurumAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            SearchBarWidget(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              onClear: () {
                _searchController.clear();
                setState(() {});
              },
            ),
            const SizedBox(height: 20),

            /// Destinations
            SizedBox(
              height: 140,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                separatorBuilder: (_, _) => const SizedBox(width: 16),
                itemBuilder: (_, i) => DestinationCard(
                  name: destinations[i]["name"]!,
                  image: destinations[i]["image"]!,
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// Room types
            SizedBox(
              height: 42,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: roomTypes.length,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (_, i) =>
                    RoomTypeChip(title: roomTypes[i], isSelected: i == 0),
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              "Recommended stays",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            /// Stay cards with smooth animation
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: villas.length,
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemBuilder: (_, i) {
                final villa = villas[i];
                return StayCard(
                  title: villa["title"]!,
                  price: villa["price"]!,
                  image: villa["image"]!,
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FadeTransition(
                              opacity: animation,
                              child: DetailsPage(villa: villa),
                            ),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                              return ScaleTransition(
                                scale: Tween<double>(begin: 0.95, end: 1.0)
                                    .animate(
                                      CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.easeOut,
                                      ),
                                    ),
                                child: FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                              );
                            },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
