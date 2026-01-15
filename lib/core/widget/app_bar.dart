import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final String roleText; // 👈 dynamic role
  final VoidCallback onProfileTap;
  final VoidCallback onLogoutTap;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.roleText,
    required this.onProfileTap,
    required this.onLogoutTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(150);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 1,
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Top Row (Logo + Company + Role + Menu)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Image.asset('assets/image/cial_logo.png', height: 40),
                  const SizedBox(width: 8),

                  /// Company + Role
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'ABC Construction Pvt Ltd',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          roleText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Menu
                  PopupMenuButton<_MenuAction>(
                    icon: const Icon(Icons.more_vert),
                    color: Colors.white, // 👈 popup background color
                    onSelected: (value) {
                      if (value == _MenuAction.profile) {
                        onProfileTap();
                      } else {
                        onLogoutTap();
                      }
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(
                        value: _MenuAction.profile,
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              size: 20,
                              color: Colors.black, // 👈 icon color for contrast
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Profile',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: _MenuAction.logout,
                        child: Row(
                          children: [
                            Icon(Icons.logout, size: 20, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Logout', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// Screen Title + Subtitle
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _MenuAction { profile, logout }
