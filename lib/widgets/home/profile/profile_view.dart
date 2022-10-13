import 'package:flutter/material.dart';
import 'package:src_core_bloc/widgets/home/profile/profile_menu_item.dart';
import 'package:src_core_bloc/widgets/home/profile/profile_pic.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenuItem(
              text: "My Account",
              icon: Icons.account_box_outlined,
              press: () => {},
            ),
            ProfileMenuItem(
              text: "Notifications",
              icon: Icons.notifications_outlined,
              press: () {},
            ),
            ProfileMenuItem(
              text: "Settings",
              icon: Icons.settings_outlined,
              press: () {},
            ),
            ProfileMenuItem(
              text: "Help Center",
              icon: Icons.announcement_outlined,
              press: () {},
            ),
            ProfileMenuItem(
              text: "Log Out",
              icon: Icons.logout,
              press: () {},
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
