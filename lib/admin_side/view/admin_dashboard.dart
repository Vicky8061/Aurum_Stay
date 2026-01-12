import 'package:aurum_stay/admin_side/view/add_stay_screen.dart';
import 'package:aurum_stay/admin_side/widget/dashboard_card.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      /// APP BAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.bg,
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              // TODO: Admin logout
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// OVERVIEW
            const Text(
              'Overview',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            /// STATS
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.3,
              children: const [
                DashboardCard(
                  title: 'Total Villas',
                  value: '12',
                  icon: Icons.home_work,
                ),
                DashboardCard(
                  title: 'Bookings',
                  value: '86',
                  icon: Icons.book_online,
                ),
                DashboardCard(title: 'Users', value: '240', icon: Icons.people),
                DashboardCard(
                  title: 'Revenue',
                  value: '₹2.4L',
                  icon: Icons.currency_rupee,
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// QUICK ACTIONS
            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                /// ADD VILLA
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: AppColors.goldText,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 6,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AddStayScreen()),
                      );
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      'Add Villa',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                /// VIEW BOOKINGS
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.white.withOpacity(0.15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      // TODO: View Bookings
                    },
                    icon: const Icon(Icons.list, color: Colors.white),
                    label: const Text(
                      'View Bookings',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
