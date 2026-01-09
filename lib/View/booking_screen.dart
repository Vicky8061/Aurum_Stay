import 'dart:ui';
import 'package:flutter/material.dart';
import '../../controller/booking_controller.dart';
import '../../utils/app_colors.dart';
import '../model/villa_model.dart';
import 'package:aurum_stay/View/widget/booking_tile.dart';
import 'package:aurum_stay/View/widget/counter_button.dart';
import 'package:aurum_stay/View/widget/icon_button.dart';

class BookingScreen extends StatefulWidget {
  final VillaModel villa; //

  const BookingScreen({super.key, required this.villa});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late BookingController controller;

  @override
  void initState() {
    super.initState();
    controller = BookingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          Hero(
            tag: widget.villa.image,
            child: Image.asset(
              widget.villa.image,
              height: 320,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      IconButtons(
                        icon: Icons.arrow_back,
                        onTap: () => Navigator.pop(context),
                      ),
                      const Spacer(),
                      const IconButtons(icon: Icons.favorite_border),
                    ],
                  ),
                ),

                const Spacer(),

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
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(32),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.villa.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColors.gold,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  widget.villa.rating.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(width: 12),
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.white54,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  widget.villa.location,
                                  style: const TextStyle(color: Colors.white54),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              widget.villa.price,
                              style: const TextStyle(
                                color: AppColors.goldText,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 24),

                            /// DATES
                            Row(
                              children: [
                                Expanded(
                                  child: BookingTile(
                                    title: "Check-in",
                                    value: controller.model.checkIn == null
                                        ? "Select"
                                        : controller.model.checkIn!
                                              .toString()
                                              .split(" ")[0],
                                    onTap: () =>
                                        controller.pickDate(context, true, () {
                                          setState(() {});
                                        }),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: BookingTile(
                                    title: "Check-out",
                                    value: controller.model.checkOut == null
                                        ? "Select"
                                        : controller.model.checkOut!
                                              .toString()
                                              .split(" ")[0],
                                    onTap: controller.model.checkIn == null
                                        ? null
                                        : () => controller.pickDate(
                                            context,
                                            false,
                                            () {
                                              setState(() {});
                                            },
                                          ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            /// GUESTS
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Guests",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      CounterButton(
                                        icon: Icons.remove,
                                        onTap: () =>
                                            controller.decreaseGuests(() {
                                              setState(() {});
                                            }),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                        ),
                                        child: Text(
                                          controller.model.guests.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      CounterButton(
                                        icon: Icons.add,
                                        onTap: () =>
                                            controller.increaseGuests(() {
                                              setState(() {});
                                            }),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 24),

                            /// Booking Summary
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Booking Summary",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  _SummaryRow(
                                    left: "Price / night",
                                    right: widget.villa.price,
                                  ),
                                  _SummaryRow(
                                    left: "Nights",
                                    right: controller.model.nights.toString(),
                                  ),
                                  _SummaryRow(
                                    left: "Guests",
                                    right: controller.model.guests.toString(),
                                  ),
                                  const Divider(color: Colors.white24),
                                  _SummaryRow(
                                    left: "Total",
                                    right:
                                        "₹${controller.model.totalPrice(widget.villa.price)}",
                                    isBold: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Confirm Booking Button
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.55),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.goldText,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        elevation: 6,
                      ),
                      onPressed:
                          (controller.model.checkIn == null ||
                              controller.model.checkOut == null)
                          ? null
                          : () {
                              // Navigate to payment or success screen
                            },
                      child: const Text(
                        "Confirm Booking",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Booking Summary Row
class _SummaryRow extends StatelessWidget {
  final String left;
  final String right;
  final bool isBold;

  const _SummaryRow({
    required this.left,
    required this.right,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            left,
            style: TextStyle(
              color: Colors.white70,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            right,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
