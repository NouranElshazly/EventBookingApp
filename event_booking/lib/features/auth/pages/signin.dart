import 'package:event_booking/core/widgets/svg_picture_custome.dart';
import 'package:flutter/material.dart';
import 'package:event_booking/core/constant/app_image.dart';
import 'package:event_booking/core/functions/navigation.dart';
import 'package:event_booking/core/functions/validation.dart';
import 'package:event_booking/core/styles/color.dart';
import 'package:event_booking/core/styles/text_style.dart';
import 'package:event_booking/features/auth/widgets/custome_text_form.dart';
import 'package:event_booking/core/widgets/main_button.dart';
import 'package:event_booking/features/auth/widgets/passwordtextrform.dart';
import 'package:event_booking/features/auth/widgets/remember_me_row.dart';
import 'package:event_booking/features/auth/widgets/social_button.dart';
import 'package:event_booking/features/auth/widgets/textrich_costumer.dart';
import 'package:event_booking/features/auth/pages/reset_password_page.dart';
import 'package:event_booking/features/auth/pages/signup.dart';
import 'package:event_booking/core/widgets/gradient_background.dart';
// import 'package:event_booking/features/main/main_app_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Controllers to read field values
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Remember me state
  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Validation method called on button press
  void _onSignInPressed() {
    if (formKey.currentState!.validate()) {
      // All fields are valid — navigate to main page
      // You can access values via:
      // emailController.text
      // passwordController.text
      // push(context, MainAppPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GradientBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),

                    // Logo
                    Align(child: Image.asset(AppImages.logoPng)),

                    const SizedBox(height: 32),

                    // Title
                    Text(
                      'Sign in',
                      style: TextStyles.h4.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 21),

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

                    const SizedBox(height: 19),

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

                    const SizedBox(height: 8),

                    // Remember Me + Forgot Password
                    RememberMeRow(
                      value: rememberMe,
                      onChanged: (value) => setState(() => rememberMe = value),
                      onForgotPassword: () =>
                          push(context, ResetPasswordPage()),
                    ),

                    const SizedBox(height: 24),

                    // Sign In button
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: main_button(
                        text: 'SIGN IN ',
                        onPressed: _onSignInPressed,
                      ),
                    ),

                    const SizedBox(height: 24),
                    Center(
                      child: Text(
                        "OR",
                        style: TextStyles.mainbody.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.greycolor,
                        ),
                      ),
                    ),
                    SizedBox(height: 9),

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

                    // Don't have an account
                    TextrichCostumer(
                      text1: "Don't have an account? ",
                      text2: 'Sign up',
                      onpress: () => pushReplace(context, Signup()),
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
