import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/booking_controller.dart';
import '../utils/app_colors.dart';

class BookingScreen extends StatelessWidget {
  final Map<String, String> villa;

  const BookingScreen({super.key, required this.villa});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookingController(),
      child: Consumer<BookingController>(
        builder: (context, controller, _) {
          final booking = controller.booking;

          return Scaffold(
            backgroundColor: AppColors.bg,
            body: Stack(
              children: [
                /// Image
                Hero(
                  tag: villa["image"]!,
                  child: Image.asset(
                    villa["image"]!,
                    height: 320,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                SafeArea(
                  child: Column(
                    children: [
                      const Spacer(),

                      /// Glass Card
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(32),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 26, 20, 110),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.55),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  villa["title"]!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 20),

                                /// Dates
                                Row(
                                  children: [
                                    _dateTile(
                                      "Check-in",
                                      booking.checkIn,
                                      () => controller.pickDate(context, true),
                                    ),
                                    const SizedBox(width: 16),
                                    _dateTile(
                                      "Check-out",
                                      booking.checkOut,
                                      booking.checkIn == null
                                          ? null
                                          : () => controller.pickDate(
                                              context,
                                              false,
                                            ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                /// Guests
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Guests",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: controller.decreaseGuests,
                                        ),
                                        Text(
                                          booking.guests.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: controller.increaseGuests,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Bottom Button
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: booking.isValid ? () {} : null,
                      child: const Text("Confirm Booking"),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _dateTile(String title, DateTime? date, VoidCallback? onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white54)),
              const SizedBox(height: 6),
              Text(
                date == null ? "Select" : date.toString().split(" ")[0],
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
