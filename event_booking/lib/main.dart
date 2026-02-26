import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:event_booking/core/styles/apptheme.dart';
import 'package:event_booking/features/welcom/pages/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      builder: (context, child) {
        return SafeArea(
          top: false,

          bottom: !kIsWeb && defaultTargetPlatform == TargetPlatform.android,
          child: child ?? Container(),
        );
      },
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
