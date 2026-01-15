import 'package:cial/core/routing/routes.dart';
import 'package:cial/core/widget/app_bar.dart';

import 'package:cial/features/dashboard/widget/stat_card.dart';
import 'package:cial/features/dashboard/widget/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreenEmployee extends StatelessWidget {
  const DashboardScreenEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Menu')),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                // handle logout
              },
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          CustomAppBar(
            title: 'Dashboard',
            subtitle:
                "Welcome back! Here's what's happening with your contracts.",
            roleText: 'Employee',
            onProfileTap: () {
              // Handle profile tap
            },
            onLogoutTap: () {
              context.goNamed(AppRoute.login);
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatCard(
                    bgColor: const Color(0xFFFFF3E0),
                    iconBg: Colors.deepOrange,
                    icon: Icons.error_outline,
                    title: 'Pending Clearances',
                    value: '3',
                    footer: 'Action required',
                    footerColor: Colors.red,
                  ),

                  const SizedBox(height: 16),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.green.shade100,
                            child: const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Active',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Valid till Dec 2026',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Pending Tasks',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),

                  TaskTile(
                    title: 'Submit police clearance for 3 new employees',
                    priority: 'HIGH PRIORITY',
                    color: Colors.red,
                    bg: Colors.red.shade50,
                  ),
                  TaskTile(
                    title: 'Renew vehicle pass for 2 vehicles',
                    priority: 'MEDIUM PRIORITY',
                    color: Colors.orange,
                    bg: Colors.orange.shade50,
                  ),
                  TaskTile(
                    title: 'Update emergency contact information',
                    priority: 'LOW PRIORITY',
                    color: Colors.blue,
                    bg: Colors.blue.shade50,
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
