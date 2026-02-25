import 'package:flutter/material.dart';
import 'package:event_booking/core/styles/color.dart';
import 'package:event_booking/core/styles/text_style.dart';

class TextrichCostumer extends StatelessWidget {
  const TextrichCostumer({
    super.key,
    required this.text1,
    required this.text2,
    required this.onpress,
  });

  final String text1;
  final String text2;
  final VoidCallback? onpress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            text: text1,
            style: TextStyles.mainbody,
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: GestureDetector(
                  onTap: onpress,
                  child: Text(
                    text2,
                    style: TextStyles.body2.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
