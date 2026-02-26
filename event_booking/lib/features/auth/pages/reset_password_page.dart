import 'package:event_booking/core/functions/navigation.dart';
import 'package:event_booking/core/functions/validation.dart';
import 'package:event_booking/core/styles/color.dart';
import 'package:event_booking/core/styles/text_style.dart';
import 'package:event_booking/core/widgets/gradient_background.dart';
import 'package:event_booking/core/widgets/main_button.dart';
import 'package:event_booking/features/auth/widgets/custome_text_form.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _onSendPressed() {
    if (formKey.currentState!.validate()) {
      // TODO: send reset link to emailController.text
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // Back arrow
                  IconButton(
                    onPressed: () => pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),

                  const SizedBox(height: 32),

                  // Title
                  Text(
                    'Resset Password',
                    style: TextStyles.h4.copyWith(fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 12),

                  // Subtitle
                  Text(
                    'Please enter your email address to\nrequest a password reset',
                    style: TextStyles.body3.copyWith(color: AppColors.subColor),
                  ),

                  const SizedBox(height: 32),

                  // Email field
                  CustomeTextForm(
                    controller: emailController,
                    hinttext: 'abc@email.com',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                    validator: (value) {
                      if (!isvalidEmail(value!)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 28),

                  // Send button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: main_button(
                      text: 'SEND',
                      onPressed: _onSendPressed,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
