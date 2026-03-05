// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:event_booking/core/styles/color.dart';

class EmptyEventsScreen extends StatelessWidget {
  const EmptyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      leading: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
      title: const Text(
        "Events",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: appBar,

      body: Column(
        children: [
          const SizedBox(height: 10),

          Center(
            child: Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.greycolor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "UPCOMING",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "PAST EVENTS",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.subColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),

          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.backgroundColor,
            ),
            child: Center(
              child: Image.asset("assets/images/calendar.png", width: 180),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "No Upcoming Event",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.greycolor,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Lorem ipsum dolor sit amet,\nconsectetur",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),

          const Spacer(),

          Center(
            child: Container(
              width: 220,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "EXPLORE EVENTS",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(width: 8),

                  Icon(Icons.arrow_forward, size: 16, color: Colors.white),
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
