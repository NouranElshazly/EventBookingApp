import 'package:flutter/material.dart';
import 'package:event_booking/core/styles/color.dart';
import 'package:event_booking/core/styles/text_style.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onForgotPassword,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final VoidCallback onForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Switch(
              value: value,
              activeThumbColor: AppColors.primaryColor,
              onChanged: onChanged,
            ),

            Text('Remember Me', style: TextStyles.body3),
          ],
        ),
        TextButton(
          onPressed: onForgotPassword,
          child: Text(
            'Forgot Password?',
            style: TextStyles.mainbody.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
