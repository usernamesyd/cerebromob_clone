import 'package:cerebro_mobile/pages/splash_page.dart';
import 'package:cerebro_mobile/pages/student/dashboard/dashboard.dart';
import 'package:cerebro_mobile/pages/teacher/dashboard/dashboard.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class CerebroMobileApp extends StatelessWidget {
  const CerebroMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: cerebroBlue100,
      ),
      home: SplashPage(),
    );
  }
}