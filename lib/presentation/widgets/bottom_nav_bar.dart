import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ja_chuiin/presentation/screens/chat/chat_screen.dart';
import 'package:ja_chuiin/presentation/screens/map/map_screen.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavItem(
            icon: Icons.home_outlined,
            label: '홈',
            onTap: () => Get.to(() => MapScreen()),
          ),
          _NavItem(
            icon: Icons.shopping_bag_outlined,
            label: '공동구매',
            onTap: () {},
          ),
          _NavItem(
            icon: Icons.smart_toy_outlined,
            label: 'AI추천',
            onTap: () => Get.to(() => ChatScreen()),
          ),
          if (!kIsWeb)
            _NavItem(
              icon: Icons.location_on_outlined,
              label: '지도',
              onTap: () => Get.to(() => MapScreen()),
            ),
          _NavItem(
            icon: Icons.person_outline,
            label: '마이',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label, style: const TextStyle(fontSize: 9)),
    );
  }
}
