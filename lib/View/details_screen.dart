import 'package:aurum_stay/View/widget/favorite_heart.dart';
import 'package:aurum_stay/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, String> villa;

  const DetailsPage({super.key, required this.villa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          // Scrollable content with SliverAppBar
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 400,
                pinned: true,
                backgroundColor: const Color(0xFF020617),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: const [FavoriteHeart(), SizedBox(width: 16)],
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: villa["image"]!,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(villa["image"]!, fit: BoxFit.cover),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.15),
                                Colors.black.withOpacity(0.85),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Content
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title & Price
                      Text(
                        villa["title"]!,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        villa["price"]!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFC107),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // About
                      const Text(
                        "About this stay",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Experience luxury like never before with premium interiors, "
                        "private pool, scenic views and 24x7 service. "
                        "Perfect for couples, families and luxury travellers.",
                        style: TextStyle(color: Colors.white70, height: 1.6),
                      ),
                      const SizedBox(height: 24),

                      // Facilities
                      const Text(
                        "Facilities",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          _FacilityIcon(icon: Icons.wifi, label: "Wi-Fi"),
                          _FacilityIcon(icon: Icons.pool, label: "Pool"),
                          _FacilityIcon(
                            icon: Icons.local_parking,
                            label: "Parking",
                          ),
                          _FacilityIcon(icon: Icons.ac_unit, label: "AC"),
                        ],
                      ),
                      const SizedBox(height: 120), // space for fixed button
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Fixed Book Now Button
          Positioned(
            bottom: 16,
            left: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC107),
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Book Now",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Facility Icon Widget
class _FacilityIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FacilityIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.white10,
          child: Icon(icon, color: Colors.white, size: 22),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}
