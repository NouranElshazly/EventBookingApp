import 'package:event_booking/core/styles/color.dart';
import 'package:event_booking/core/styles/text_style.dart';
import 'package:event_booking/core/functions/navigation.dart';
import 'package:flutter/material.dart';

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.backgroundColor,
    isScrollControlled: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return const FilterBottomSheet();
    },
  );
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  int _selectedCategory = 0;
  int _selectedDate = 1; // 0=Today, 1=Tomorrow, 2=This week
  RangeValues _priceRange = const RangeValues(20, 120);
  String _location = 'New York, USA';

  final List<Map<String, dynamic>> _categories = [
    {'label': 'Sports', 'icon': Icons.sports_basketball},
    {'label': 'Music', 'icon': Icons.music_note},
    {'label': 'Art', 'icon': Icons.palette},
    {'label': 'Food', 'icon': Icons.restaurant},
    {'label': 'Tech', 'icon': Icons.computer},
  ];

  final List<String> _dateOptions = ['Today', 'Tomorrow', 'This week'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.subColor.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Title row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Filter', style: TextStyles.h4.copyWith(fontWeight: FontWeight.bold)),
              IconButton(
                onPressed: () => pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Category icons
          SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final isSelected = _selectedCategory == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedCategory = index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.accentColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _categories[index]['icon'] as IconData,
                          color: isSelected ? Colors.white : AppColors.subColor,
                          size: 26,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _categories[index]['label'] as String,
                        style: TextStyles.body3.copyWith(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.titleColor,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // Time & Date
          Text(
            'Time & Date',
            style: TextStyles.body2.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),

          // Date toggle chips
          Row(
            children: List.generate(_dateOptions.length, (index) {
              final isSelected = _selectedDate == index;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () => setState(() => _selectedDate = index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primaryColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? AppColors.primaryColor : AppColors.subColor.withValues(alpha: 0.4),
                      ),
                    ),
                    child: Text(
                      _dateOptions[index],
                      style: TextStyles.body3.copyWith(
                        color: isSelected ? Colors.white : AppColors.titleColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),

          // Choose from calendar
          GestureDetector(
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: AppColors.primaryColor,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (picked != null) {
                setState(() => _selectedDate = -1);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.subColor.withValues(alpha: 0.3)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.calendar_month, color: AppColors.primaryColor, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Choose from calendar',
                    style: TextStyles.body3.copyWith(color: AppColors.titleColor),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.subColor),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Location
          Text(
            'Location',
            style: TextStyles.body2.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.subColor.withValues(alpha: 0.3)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.location_on, color: AppColors.primaryColor, size: 20),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _location,
                    style: TextStyles.body3.copyWith(color: AppColors.titleColor),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.subColor),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Price range
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select price range',
                style: TextStyles.body2.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                '\$${_priceRange.start.toInt()}-\$${_priceRange.end.toInt()}',
                style: TextStyles.body3.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          RangeSlider(
            values: _priceRange,
            min: 0,
            max: 500,
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.accentColor,
            onChanged: (values) => setState(() => _priceRange = values),
          ),
          const SizedBox(height: 16),

          // RESET / APPLY buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _selectedCategory = 0;
                      _selectedDate = 1;
                      _priceRange = const RangeValues(20, 120);
                      _location = 'New York, USA';
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size(double.infinity, 52),
                  ),
                  child: Text(
                    'RESET',
                    style: TextStyles.body2.copyWith(
                      color: AppColors.titleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size(double.infinity, 52),
                    elevation: 0,
                  ),
                  child: Text(
                    'APPLY',
                    style: TextStyles.body2.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
