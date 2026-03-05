// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:event_booking/core/styles/color.dart';

class InviteBanner extends StatelessWidget {
  const InviteBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [

          Container(
            height: 160,
            decoration: BoxDecoration(
              color: const Color(0xFF4A43EC)
                  .withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
            ),
          ),

          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(30),
              child: Image.asset(
                "assets/images/banner.jpg",
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            left: 20,
            top: 30,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                const Text(
                  "Invite Your Friends",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const Text(
                  "Get \$20 for ticket",
                ),

                const SizedBox(height: 10),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.primaryColor,
                  ),
                  onPressed: () {},
                  child: const Text("INVITE"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}