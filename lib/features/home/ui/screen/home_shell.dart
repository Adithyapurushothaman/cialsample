import 'package:cial/core/routing/routes.dart';
import 'package:cial/core/widget/app_bar.dart';
import 'package:cial/features/auth/ui/provider/auth_provider.dart';
import 'package:cial/features/contracte/ui/screens/add_contractee.dart';
import 'package:cial/features/contracte/ui/screens/contractee_details_screen.dart';
import 'package:cial/features/dashboard/ui/dashboard_screen_contractor.dart';
import 'package:cial/features/dashboard/ui/dashboard_screen_employee.dart';
import 'package:cial/features/dashboard/ui/dashboard_screen_manager.dart';
import 'package:cial/features/dashboard/ui/tab_index_provider.dart';
import 'package:cial/features/employee/ui/screen/add_employee_screen.dart';
import 'package:cial/features/employee/ui/screen/employee_list_screen.dart';
import 'package:cial/features/task/ui/screens/add_task_screen.dart';
import 'package:cial/features/task/ui/screens/task_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// ---------------------------------------------------------------------------
/// Role tab model
/// ---------------------------------------------------------------------------
class RoleTab {
  final String label;
  final IconData icon;
  final Widget screen;
  final String subtitle;

  const RoleTab({
    required this.label,
    required this.icon,
    required this.screen,
    required this.subtitle,
  });
}

/// ---------------------------------------------------------------------------
/// HomeShell
/// ---------------------------------------------------------------------------
class HomeShell extends ConsumerStatefulWidget {
  const HomeShell({super.key});

  @override
  ConsumerState<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends ConsumerState<HomeShell> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final role = authState.role;
    final currentIndex = ref.watch(homeTabIndexProvider);

    final tabs = _tabsForRole(role!);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: tabs[currentIndex].label,
            subtitle: tabs[currentIndex].subtitle,
            roleText: _roleText(role),
            onProfileTap: () {},
            onLogoutTap: () {
              context.goNamed(AppRoute.login);
            },
          ),

          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: tabs.map((e) => e.screen).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(homeTabIndexProvider.notifier).state = index;
        },
        items: tabs
            .map(
              (tab) => BottomNavigationBarItem(
                icon: Icon(tab.icon),
                label: tab.label,
              ),
            )
            .toList(),
      ),
    );
  }

  /// -------------------------------------------------------------------------
  /// Drawer
  /// -------------------------------------------------------------------------
  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                context.goNamed(AppRoute.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Role → Tabs mapping
/// ---------------------------------------------------------------------------
List<RoleTab> _tabsForRole(UserRole role) {
  switch (role) {
    case UserRole.employee:
      return [
        const RoleTab(
          label: 'Dashboard',
          icon: Icons.dashboard,
          screen: DashboardScreenEmployee(),
          subtitle: 'Welcome back!',
        ),
        RoleTab(
          label: 'Tasks',
          icon: Icons.task,
          screen: TaskDetailsScreen(),
          subtitle: 'View and manage tasks',
        ),
        const RoleTab(
          label: 'Add Task',
          icon: Icons.add,
          screen: AddTaskScreen(),
          subtitle: 'Add a new task',
        ),
      ];

    case UserRole.manager:
      return [
        const RoleTab(
          label: 'Dashboard',
          icon: Icons.dashboard,
          screen: DashboardManagerScreen(),
          subtitle: 'Welcome back!',
        ),
        RoleTab(
          label: 'Contractors',
          icon: Icons.business,
          screen: ContracteeDetailsScreen(),
          subtitle: 'View and manage Contractors',
        ),
        const RoleTab(
          label: 'Add Contractor',
          icon: Icons.add,
          screen: AddContracteeScreen(),
          subtitle: 'Add a new Contractor',
        ),
      ];

    case UserRole.contractor:
      return [
        const RoleTab(
          label: 'Dashboard',
          icon: Icons.dashboard,
          screen: DashboardContractorScreen(),
          subtitle: 'Welcome back!',
        ),
        RoleTab(
          label: 'Employees',
          icon: Icons.people,
          screen: EmployeeDetailsScreen(),
          subtitle: 'View and manage labourers',
        ),
        const RoleTab(
          label: 'Add Employee',
          icon: Icons.person_add,
          screen: AddEmployeeScreen(),
          subtitle: 'Add a new labourer',
        ),
      ];
  }
}

/// ---------------------------------------------------------------------------
/// Role → AppBar text
/// ---------------------------------------------------------------------------
String _roleText(UserRole role) {
  switch (role) {
    case UserRole.employee:
      return 'Employee';
    case UserRole.manager:
      return 'Manager';
    case UserRole.contractor:
      return 'Contractor Admin';
  }
}
