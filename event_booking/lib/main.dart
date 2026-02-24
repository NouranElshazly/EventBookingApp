import 'package:flutter/material.dart';
import 'package:event_booking/core/styles/apptheme.dart';
import 'dart:io';
import 'package:event_booking/features/auth/pages/signin.dart';

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
          bottom: Platform.isAndroid,
          child: child ?? Container(),
        );
      },
      debugShowCheckedModeBanner: false,
      home: Signin(),
    );
  }
}
