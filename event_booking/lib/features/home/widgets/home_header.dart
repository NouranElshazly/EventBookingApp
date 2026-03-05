// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:event_booking/core/styles/color.dart';
import 'category_item.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback openMenu;
  final VoidCallback? onSearchTap;

  const HomeHeader({super.key, required this.openMenu, this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 230,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            image: DecorationImage(
              image: AssetImage("assets/images/header.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
          height: 230,
          padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
              colors: [
                AppColors.titleColor.withOpacity(0.5),
                AppColors.titleColor.withOpacity(0.2),
              ],
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: openMenu,
                    child: Image.asset("assets/icons/menu_icon.png", width: 24),
                  ),

                  const Column(
                    children: [
                      Text(
                        "Current Location",
                        style: TextStyle(color: Colors.white70, fontSize: 11),
                      ),
                      Text(
                        "Cairo, Egypt",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Image.asset("assets/icons/icon_1.png", width: 22),
                ],
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: onSearchTap,
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/icons/search_icon.png", width: 20),

                      const SizedBox(width: 10),

                      const Expanded(
                        child: Text(
                          "Search...",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      Image.asset("assets/icons/filter_icon.png", width: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          bottom: -20,
          left: 28,
          right: 28,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CategoryItem(
                icon: "assets/icons/sports.png",
                title: "Sports",
                color: Colors.red,
              ),

              CategoryItem(
                icon: "assets/icons/music.png",
                title: "Music",
                color: Colors.orange,
              ),

              CategoryItem(
                icon: "assets/icons/food.png",
                title: "Food",
                color: Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
