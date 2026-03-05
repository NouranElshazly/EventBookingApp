// ignore_for_file: deprecated_member_use, unnecessary_underscores, duplicate_import

import 'package:flutter/material.dart';
import 'package:event_booking/core/styles/color.dart';

import 'package:event_booking/features/home/event_screen.dart';
import 'package:event_booking/features/home/map_screen.dart';
import 'package:event_booking/features/home/menu_screen.dart';
import 'package:event_booking/features/home/widgets/event_card.dart';
import 'package:event_booking/features/home/widgets/home_header.dart';
import 'package:event_booking/features/home/widgets/invite_banner.dart';
import 'package:event_booking/features/profile/events_screen.dart';
import 'package:event_booking/features/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    EventDetailsScreen(),
    EventsScreen(),
    MapViewScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openMenu() {
    showGeneralDialog(
      context: context,
      barrierLabel: "Menu",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.3),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => const SizedBox(),
      transitionBuilder: (_, animation, __, ___) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(color: Colors.transparent),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SlideTransition(
                position: Tween(
                  begin: const Offset(-1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: SafeArea(
                  child: Material(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      color: AppColors.backgroundColor,
                      child: const MenuScreen(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: _selectedIndex == 0
          ? SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 120),
                child: Column(
                  children: [
                    HomeHeader(
                      openMenu: _openMenu,
                      onSearchTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const EventsScreen(openSearch: true),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 60),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Upcoming Events",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const EventsScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "See All",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      height: 260,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          EventCard2(
                            backgroundImage: 'assets/images/band1.jpg',
                            date: '12',
                            month: 'Mar',
                            title: 'Music Festival',
                            location: 'Cairo Opera House',
                            attendees: const [
                              'assets/images/revie1.png',
                              'assets/images/revie2.png',
                              'assets/images/revie3.png',
                            ],
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EventDetailsScreen(),
                              ),
                            ),
                          ),

                          EventCard2(
                            backgroundImage: 'assets/images/band_2.jpg',
                            date: '18',
                            month: 'Apr',
                            title: 'Rock Night',
                            location: 'Alexandria Arena',
                            attendees: const [
                              'assets/images/revie1.png',
                              'assets/images/revie2.png',
                              'assets/images/revie3.png',
                            ],
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EventDetailsScreen(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    const InviteBanner(),

                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Nearby You",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "See All",
                            style: TextStyle(color: AppColors.subColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : _pages[_selectedIndex],

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem("assets/icons/explore.png", "Explore", 0),
              _navItem("assets/icons/eventes.png", "Events", 1),
              _navItem("assets/icons/map.png", "Map", 2),
              _navItem("assets/icons/profile_1.png", "Profile", 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String icon, String title, int index) {
    final active = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            width: 26,
            color: active ? AppColors.primaryColor : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: active ? AppColors.primaryColor : AppColors.subColor,
            ),
          ),
        ],
      ),
    );
  }
}
