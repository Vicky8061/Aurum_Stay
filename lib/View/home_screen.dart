import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../controller/home_controller.dart';
import '../model/villa_model.dart';
import '../View/details_screen.dart';
import '../View/widget/aurum_app_bar.dart';
import '../View/widget/destination_card.dart';
import '../View/widget/room_type_chip.dart';
import '../View/widget/search_bar.dart';
import '../View/widget/stay_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = HomeController();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Filter villas based on search
    final List<VillaModel> filteredVillas = controller.searchVillas(
      _searchController.text.trim(),
    );

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: const AurumAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            /// Search Bar
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
                itemCount: controller.destinations.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (_, i) {
                  final dest = controller.destinations[i];
                  return DestinationCard(
                    name: dest["name"]!,
                    image: dest["image"]!,
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            /// Room types
            SizedBox(
              height: 42,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.roomTypes.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, i) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.selectedRoomTypeIndex = i;
                      });
                    },
                    child: RoomTypeChip(
                      title: controller.roomTypes[i],
                      isSelected: i == controller.selectedRoomTypeIndex,
                    ),
                  );
                },
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

            /// Villa Cards
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredVillas.length,
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemBuilder: (_, i) {
                final VillaModel villa = filteredVillas[i];
                return StayCard(
                  title: villa.title,
                  price: villa.price,
                  image: villa.image,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetailsPage(villa: villa),
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
