import 'package:event_booking/core/constant/app_image.dart';
import 'package:event_booking/core/functions/navigation.dart';
import 'package:event_booking/core/functions/validation.dart';
import 'package:event_booking/core/styles/color.dart';
import 'package:event_booking/core/styles/text_style.dart';
import 'package:event_booking/core/widgets/gradient_background.dart';
import 'package:event_booking/core/widgets/main_button.dart';
import 'package:event_booking/core/widgets/svg_picture_custome.dart';
import 'package:event_booking/features/auth/pages/signin.dart';
import 'package:event_booking/features/auth/pages/verification_page.dart';
import 'package:event_booking/features/auth/widgets/custome_text_form.dart';
import 'package:event_booking/features/auth/widgets/passwordtextrform.dart';
import 'package:event_booking/features/auth/widgets/social_button.dart';
import 'package:event_booking/features/auth/widgets/textrich_costumer.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed() {
    if (formKey.currentState!.validate()) {
      push(context, VerificationPage(email: emailController.text));
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
              child: SingleChildScrollView(
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

                    const SizedBox(height: 24),

                    // Title
                    Text(
                      'Sign up',
                      style: TextStyles.h4.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Full name field
                    CustomeTextForm(
                      controller: fullNameController,
                      hinttext: 'Full name',
                      keyboardType: TextInputType.name,
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.grey,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

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

                    const SizedBox(height: 16),

                    // Password field
                    Passwordtextform(
                      controller: passwordController,
                      hinttext: 'Your password',
                      validator: (value) {
                        if (!isValidPassword(value!)) {
                          return 'Min 8 chars, 1 uppercase & 1 number';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // Confirm password field
                    Passwordtextform(
                      controller: confirmPasswordController,
                      hinttext: 'Confirm password',
                      validator: (value) {
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 28),

                    // Sign Up button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: main_button(
                        text: 'SIGN UP',
                        onPressed: _onSignUpPressed,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Center(
                      child: Text(
                        'OR',
                        style: TextStyles.mainbody.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.greycolor,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Google button
                    SocialButton(
                      icon: SvgPictureCustome(
                        path: AppImages.googleSvg,
                        size: 22,
                      ),
                      label: 'Login with Google',
                      onPressed: () {},
                    ),

                    const SizedBox(height: 12),

                    // Facebook button
                    SocialButton(
                      icon: SvgPictureCustome(
                        path: AppImages.facebookSvg,
                        size: 22,
                      ),
                      label: 'Login with Facebook',
                      onPressed: () {},
                    ),

                    const SizedBox(height: 24),

                    // Already have an account
                    TextrichCostumer(
                      text1: 'Already have an account? ',
                      text2: 'Signin',
                      onpress: () => pushReplace(context, const SignInPage()),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
