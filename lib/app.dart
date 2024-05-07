import 'package:cerebro_mobile/pages/splash_page.dart';
import 'package:cerebro_mobile/pages/student/classes/class_list.dart';
import 'package:cerebro_mobile/pages/student/classes/myClass1.dart';
import 'package:cerebro_mobile/pages/student/dashboard/dashboard.dart';
import 'package:cerebro_mobile/pages/teacher/myclasses/specific_classpagev2.dart';
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
      home: ClassList(),
    );
  }
}