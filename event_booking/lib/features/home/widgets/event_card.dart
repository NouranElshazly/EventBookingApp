// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:event_booking/core/styles/color.dart';

class EventCard2 extends StatelessWidget {
  final String backgroundImage;
  final String date;
  final String month;
  final String title;
  final String location;
  final List<String> attendees;
  final Color backgroundColor;

  final VoidCallback? onTap;

  const EventCard2({
    super.key,
    required this.backgroundImage,
    required this.date,
    required this.month,
    required this.title,
    required this.location,
    required this.attendees,
    this.backgroundColor = AppColors.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      width: 250,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Image.asset(
                  backgroundImage,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 16,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        month.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    'assets/icons/booking_icon.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ],
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: backgroundColor.withOpacity(0.9),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.titleColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                SizedBox(
                  height: 24,
                  child: Stack(
                    children: attendees.asMap().entries.map((entry) {
                      int idx = entry.key;
                      String avatar = entry.value;
                      if (idx >= 3) return Container();
                      return Positioned(
                        left: idx * 16.0,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(avatar),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                if (attendees.length > 3)
                  Padding(
                    padding: EdgeInsets.only(left: 16.0 * 3, top: 2),
                    child: Text(
                      '+${attendees.length - 3} Going',
                      style: const TextStyle(
                        color: AppColors.titleColor,
                        fontSize: 17,
                      ),
                    ),
                  ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: AppColors.subColor,
                    ),
                    const SizedBox(width: 50),
                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.subColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}

