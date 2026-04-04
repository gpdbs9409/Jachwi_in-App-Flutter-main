import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ja_chuiin/core/constants/app_colors.dart';
import 'package:ja_chuiin/core/constants/size_config.dart';
import 'package:ja_chuiin/presentation/screens/profile/my_page_screen.dart';
import 'package:ja_chuiin/presentation/screens/profile/settings_screen.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Size get preferredSize =>
      Size.fromHeight(SizeConfig.deviceHeight * 0.1);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: SizeConfig.deviceHeight * 0.1,
      backgroundColor: kPrimaryColor,
      title: const Text('자취인'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => Get.to(() => MyPageScreen()),
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => Get.to(() => SettingsScreen()),
        ),
      ],
    );
  }
}
