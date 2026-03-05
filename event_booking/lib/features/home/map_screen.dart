// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:event_booking/core/styles/color.dart';

class MapViewScreen extends StatelessWidget {
  const MapViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/map.png", fit: BoxFit.cover),
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Colors.black.withOpacity(.08),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.grey,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      _circleButton(Icons.my_location, () {}),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _filter(
                        "Sports",
                        Image.asset(
                          "assets/icons/sports.png",
                          width: 16,
                          color: Colors.red,
                        ),
                      ),

                      _filter(
                        "Music",
                        Image.asset(
                          "assets/icons/music.png",
                          width: 16,
                          color: Colors.blue,
                        ),
                      ),

                      _filter(
                        "Food",
                        Image.asset(
                          "assets/icons/food.png",
                          width: 16,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),
              ],
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * .40,
            left: MediaQuery.of(context).size.width * .40,
            child: _marker("assets/images/marker1.png"),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * .50,
            left: MediaQuery.of(context).size.width * .25,
            child: _marker("assets/images/marker2.png"),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * .60,
            left: MediaQuery.of(context).size.width * .50,
            child: _marker("assets/images/marker3.png"),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * .30,
            left: MediaQuery.of(context).size.width * .60,
            child: _marker("assets/images/marker4.png"),
          ),

          Positioned(
            bottom: 25,
            left: 16,
            right: 16,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.black.withOpacity(.12),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/images/event_map.jpg",
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Wed, Apr 28 • 5:30 PM",
                              style: TextStyle(
                                color: AppColors.greycolor,
                                fontSize: 12,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              "Jo Malone London's\nMother's Day Presents",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              "Radius Gallery • Santa Cruz, CA",
                              style: TextStyle(
                                color: AppColors.greycolor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppColors.backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.bookmark_border, size: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// CIRCLE BUTTON
  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }

  /// FILTER (عدلناها لتقبل Widget)
  static Widget _filter(String text, Widget icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(children: [icon, const SizedBox(width: 6), Text(text)]),
    );
  }

  /// IMAGE MARKER (كبرناه)
  static Widget _marker(String image) {
    return Image.asset(image, width: 75, height: 75, fit: BoxFit.contain);
  }
}
