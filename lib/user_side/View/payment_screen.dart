import 'package:aurum_stay/controller/booking_controller.dart';
import 'package:aurum_stay/user_side/View/widget/payment_option.dart';
import 'package:aurum_stay/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final double totalAmount;
  const PaymentScreen({super.key, required this.totalAmount});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedMethod = "upi";
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
                    "₹${widget.totalAmount}",
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
              onChanged: (value) {
                setState(() => selectedMethod = value);
              },
            ),

            PaymentOption(
              value: "card",
              groupValue: selectedMethod,
              icon: Icons.credit_card,
              title: "Debit / Credit Card",
              subtitle: "Visa, MasterCard",
              onChanged: (value) {
                setState(() => selectedMethod = value);
              },
            ),

            PaymentOption(
              value: "wallet",
              groupValue: selectedMethod,
              icon: Icons.account_balance_wallet,
              title: "Wallet",
              subtitle: "Paytm, Amazon Pay",
              onChanged: (value) {
                setState(() => selectedMethod = value);
              },
            ),

            const Spacer(),

            /// Pay Now Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Payment logic
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
