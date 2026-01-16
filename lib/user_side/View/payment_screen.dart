import 'package:aurum_stay/controller/BottomNavController.dart';
import 'package:aurum_stay/controller/user_booking_controller.dart';
import 'package:aurum_stay/model/booking_model.dart';
import 'package:aurum_stay/user_side/View/widget/payment_option.dart';
import 'package:aurum_stay/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  final double totalAmount;
  final BookingModel booking;

  const PaymentScreen({
    super.key,
    required this.totalAmount,
    required this.booking,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedMethod = "upi";

  // Safe GetX controller fetch
  late final UserBookingsController bookingsController;

  @override
  void initState() {
    super.initState();
    bookingsController = Get.isRegistered<UserBookingsController>()
        ? Get.find<UserBookingsController>()
        : Get.put(UserBookingsController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text("Payment", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.bg,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Total Amount Card
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Amount",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  Text(
                    "₹${widget.totalAmount.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.goldText,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// Title
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Choose Payment Method",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// Payment Options
            PaymentOption(
              value: "upi",
              groupValue: selectedMethod,
              icon: Icons.qr_code,
              title: "UPI",
              subtitle: "Google Pay, PhonePe, Paytm",
              onChanged: (value) => setState(() => selectedMethod = value),
            ),
            PaymentOption(
              value: "card",
              groupValue: selectedMethod,
              icon: Icons.credit_card,
              title: "Debit / Credit Card",
              subtitle: "Visa, MasterCard",
              onChanged: (value) => setState(() => selectedMethod = value),
            ),
            PaymentOption(
              value: "wallet",
              groupValue: selectedMethod,
              icon: Icons.account_balance_wallet,
              title: "Wallet",
              subtitle: "Paytm, Amazon Pay",
              onChanged: (value) => setState(() => selectedMethod = value),
            ),

            const Spacer(),

            /// Pay Now Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // 1️⃣ Add booking to global list
                  bookingsController.addBooking(widget.booking);

                  // 2️⃣ Switch to My Bookings tab
                  if (Get.isRegistered<BottomNavController>()) {
                    final navController = Get.find<BottomNavController>();
                    navController.changeTab(2);
                  }

                  // 3️⃣ Show success snackbar
                  Get.snackbar(
                    "Payment Successful",
                    "Your stay has been booked!",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green.shade600,
                    colorText: Colors.white,
                  );

                  // 4️⃣ Return to main screen
                  Get.until((route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.goldText,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "Pay Now",
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
      ),
    );
  }
}
