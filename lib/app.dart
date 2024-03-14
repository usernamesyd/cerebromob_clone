import 'package:cerebro_mobile/atoms/cerebro_elevated-btn.dart';
import 'package:cerebro_mobile/pages/login/splash_page.dart';
import 'package:flutter/material.dart';

class CerebroMobileApp extends StatelessWidget {
  const CerebroMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashPage(),
      home: Scaffold(body:CerebroElevatedBtn(
        onPressed: () => {print('btn pressed.')}, 
        text: 'LOGIN'),
        ),
    );
  }
}