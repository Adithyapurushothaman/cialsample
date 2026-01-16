import 'package:cial/features/dashboard/widget/quick_action.dart';
import 'package:cial/features/dashboard/widget/stat_card.dart';
import 'package:cial/features/dashboard/widget/task_tile.dart';
import 'package:cial/features/dashboard/widget/activity_tile.dart';
import 'package:flutter/material.dart';

class DashboardManagerScreen extends StatelessWidget {
  const DashboardManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatCard(
            bgColor: const Color(0xFFE3F2FD),
            iconBg: Colors.blue,
            icon: Icons.people,
            title: 'Total Contracts',
            value: '36',
            footer: '+12 this month',
            footerColor: Colors.green,
          ),
          const SizedBox(height: 12),

          StatCard(
            bgColor: const Color(0xFFFFF8E1),
            iconBg: Colors.orange,
            icon: Icons.directions_car,
            title: 'Active Vehicle Passes',
            value: '8',
            footer: '3 pending',
            footerColor: Colors.orange,
          ),
          const SizedBox(height: 12),

          StatCard(
            bgColor: const Color(0xFFFFF3E0),
            iconBg: Colors.deepOrange,
            icon: Icons.error_outline,
            title: 'Pending Clearances',
            value: '5',
            footer: 'Action required',
            footerColor: Colors.red,
          ),

          const SizedBox(height: 16),

          const Text(
            'Quick Actions',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.2,
            children: const [
              QuickAction(icon: Icons.person_add, label: 'Add Contract'),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            'Pending Tasks',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),

          TaskTile(
            title: 'Vehicle pass approval',
            priority: 'HIGH PRIORITY',
            color: Colors.red,
            bg: Colors.red.shade50,
          ),
          TaskTile(
            title: 'Update emergency contact information',
            priority: 'LOW PRIORITY',
            color: Colors.blue,
            bg: Colors.blue.shade50,
          ),

          const SizedBox(height: 20),

          const Text(
            'Recent Activity',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),

          Card(
            child: Column(
              children: const [
                ActivityTile(
                  title: 'Vehicle pass approved',
                  subtitle: 'DL-01-AB-1234',
                  time: '5 hours ago',
                ),
                ActivityTile(
                  title: 'Tool entry request approved',
                  subtitle: '',
                  time: '1 day ago',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
