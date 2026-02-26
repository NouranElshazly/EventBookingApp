import 'package:flutter/material.dart';
import 'package:event_booking/core/styles/color.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundColor,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 21),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 10),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome, User!",
                  style: TextStyle(
                    color: AppColors.titleColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            _menuItem(
              context,
              title: "My Profile",
              icon: 'assets/icons/profile_icon.png',
            ),
            _menuItem(
              context,
              title: "Message",
              icon: 'assets/icons/massage_icon.png',
            ),
            _menuItem(
              context,
              title: "Calendar",
              icon: 'assets/icons/calendar_icon.png',
            ),
            _menuItem(
              context,
              title: "Booking",
              icon: 'assets/icons/booking_icon.png',
            ),
            _menuItem(
              context,
              title: "Contact Us",
              icon: 'assets/icons/contact_icon.png',
            ),
            _menuItem(
              context,
              title: "Settings",
              icon: 'assets/icons/settings_icon.png',
            ),
            _menuItem(
              context,
              title: "Helps & FAQs",
              icon: 'assets/icons/help_icon.png',
            ),
            _menuItem(
              context,
              title: "Sign Out",
              icon: 'assets/icons/sign_out_icon.png',
            ),

            const SizedBox(height: 25),

            const UpgradeButton(),
          ],
        ),
      ),
    );
  }

  static Widget _menuItem(
    BuildContext context, {
    required String title,
    required String icon,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
        leading: SizedBox(
          width: 22,
          child: Image.asset(icon, fit: BoxFit.contain),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.titleColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        onTap: () => Navigator.pop(context),
      ),
    );
  }
}

class UpgradeButton extends StatelessWidget {
  const UpgradeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFD7F4F3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.workspace_premium, color: Color(0xFF00C2C2), size: 19),
          SizedBox(width: 10),
          Text(
            "Upgrade Pro",
            style: TextStyle(
              color: Color(0xFF00C2C2),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
