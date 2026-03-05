// ignore_for_file: deprecated_member_use

import 'package:event_booking/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:event_booking/core/styles/color.dart';
import 'package:event_booking/core/styles/text_style.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 220,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/event_detalis.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 40,
                      left: 16,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    ),

                    Positioned(
                      top: 40,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          "assets/icons/Fav_icon.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: -25,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 70,
                                child: Stack(
                                  children: const [
                                    CircleAvatar(
                                      radius: 14,
                                      backgroundImage: AssetImage(
                                        "assets/images/revie1.png",
                                      ),
                                    ),
                                    Positioned(
                                      left: 18,
                                      child: CircleAvatar(
                                        radius: 14,
                                        backgroundImage: AssetImage(
                                          "assets/images/revie2.png",
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 36,
                                      child: CircleAvatar(
                                        radius: 14,
                                        backgroundImage: AssetImage(
                                          "assets/images/revie3.png",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 6),

                              const Text(
                                "+20 Going",
                                style: TextStyle(
                                  color: AppColors.backgroundColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(width: 12),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.accentColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  "Invite",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 55),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "International Band Music Concert",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 10),

                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(
                      "assets/images/date.png",
                      width: 24,
                      height: 24,
                    ),
                  ),
                  title: const Text("14 December, 2021"),
                  subtitle: const Text("Tuesday, 4:00PM - 9:00PM"),
                ),

                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(
                      "assets/images/location.png",
                      width: 24,
                      height: 24,
                    ),
                  ),
                  title: const Text("Gala Convention Center"),
                  subtitle: const Text("36 Guild Street London, UK"),
                ),

                const SizedBox(height: 10),

                ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/organizer.jpg",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: const Text("Ashfak Sayem"),
                  subtitle: const Text("Organizer"),
                  trailing: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      side: const BorderSide(color: AppColors.primaryColor),
                    ),
                    child: const Text("Follow"),
                  ),
                ),

                const SizedBox(height: 10),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "About Event",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 10),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Enjoy your favorite dish and a lovely time with friends and family and have a great time. Food from local food trucks will be available.",
                    style: TextStyle(height: 1.5, color: AppColors.accentColor),
                  ),
                ),

                const SizedBox(height: 120),
              ],
            ),
          ),

          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width / 2 - 100,
            child: SizedBox(
              width: 235,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff5568FE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BUY TICKET \$120",
                      style: TextStyles.body2.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
