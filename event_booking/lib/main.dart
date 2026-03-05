// import 'package:event_booking/features/profile/events_screen.dart';
// import 'package:event_booking/features/search/pages/search_white_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:event_booking/core/styles/apptheme.dart';
import 'package:event_booking/features/welcom/pages/splash_screen.dart';
// import 'package:event_booking/features/profile/profile_screen.dart';

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
      home: const SplashScreen(),
    );
  }
}
