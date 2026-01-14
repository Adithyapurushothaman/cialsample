import 'package:cial/core/routing/routes.dart';
import 'package:cial/features/dashboard/widget/app_bar.dart';
import 'package:cial/features/dashboard/widget/quick_action.dart';
import 'package:cial/features/dashboard/widget/stat_card.dart';
import 'package:cial/features/dashboard/widget/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:cial/features/dashboard/widget/activity_tile.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
            onMenuTap: () {
              // open drawer / logout menu
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatCard(
                    bgColor: const Color(0xFFE3F2FD),
                    iconBg: Colors.blue,
                    icon: Icons.people,
                    title: 'Total Employees',
                    value: '24',
                    footer: '+5 this month',
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
                                'Contract Status',
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
                    children: [
                      QuickAction(
                        icon: Icons.person_add,
                        label: 'Add Employee',
                        onTap: () {
                          context.pushNamed(AppRoute.employeeForm);
                        },
                      ),
                      QuickAction(
                        icon: Icons.track_changes,
                        label: 'Track Request',
                      ),
                      QuickAction(icon: Icons.build, label: 'Tool Entry'),
                      QuickAction(
                        icon: Icons.description,
                        label: 'Material Entry',
                      ),
                    ],
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

                  const Text(
                    'Recent Activity',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),

                  Card(
                    child: Column(
                      children: const [
                        ActivityTile(
                          title: 'Employee "Rajesh Kumar" clearance approved',
                          subtitle: '',
                          time: '2 hours ago',
                        ),
                        ActivityTile(
                          title: 'Vehicle pass pending',
                          subtitle: 'DL-01-AB-1234',
                          time: '5 hours ago',
                        ),
                        ActivityTile(
                          title: 'Tool entry request submitted',
                          subtitle: '',
                          time: '1 day ago',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
