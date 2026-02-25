import 'package:event_booking/core/styles/color.dart';
import 'package:event_booking/features/welcom/pages/on_boarding_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset('assets/images/welcompage.png', height: 200),
          nextScreen: OnBoardingScreen1(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: AppColors.backgroundColor,
        ),
      ),
    );
  }
}
