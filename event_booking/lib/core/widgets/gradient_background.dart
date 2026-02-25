import 'dart:ui';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // White base background
        Container(color: Colors.white),

        // Blurred gradient blob — far bottom right corner
        Positioned(
          bottom: -120,
          right: -150,
          child: Opacity(
            opacity: 0.1,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
              child: Container(
                width: 349,
                height: 322,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  gradient: SweepGradient(
                    colors: [
                      Color(0xFF5669FF), // primary
                      Color(0xFF8B97FF), // primary light
                      Color(0xFF5669FF), // primary
                      Color(0xFF3A4FFF), // primary dark
                      Color(0xFF5669FF), // close sweep
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        // Page content on top
        child,
      ],
    );
  }
}
