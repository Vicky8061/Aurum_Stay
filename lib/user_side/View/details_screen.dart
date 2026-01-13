import 'package:aurum_stay/model/villa_model.dart';
import 'package:aurum_stay/user_side/View/booking_screen.dart';
import 'package:aurum_stay/user_side/View/widget/facility_icon.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class DetailsPage extends StatelessWidget {
  final VillaModel villa;
  const DetailsPage({super.key, required this.villa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
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
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: villa.image,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(villa.image, fit: BoxFit.cover),
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
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        villa.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "₹${villa.price.toStringAsFixed(0)} / night",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFC107),
                        ),
                      ),
                      const SizedBox(height: 24),
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
                      const Text(
                        "Facilities",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: const [
                          FacilityChip(icon: Icons.wifi, label: "Wi-Fi"),
                          FacilityChip(icon: Icons.pool, label: "Pool"),
                          FacilityChip(
                            icon: Icons.local_parking,
                            label: "Parking",
                          ),
                          FacilityChip(icon: Icons.ac_unit, label: "AC"),
                          FacilityChip(icon: Icons.dining, label: "BreakFast"),
                        ],
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            left: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.goldText,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BookingScreen(villa: villa),
                  ),
                );
              },
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
