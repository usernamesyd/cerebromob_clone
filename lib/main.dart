import 'package:cerebro_mobile/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

// ===============================================
//
// DO NOT CHANGE ANYTHING IN THIS FILE.
// For any page changes, go to lib/app.dart
// 
// ===============================================

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );  
  runApp(const CerebroMobileApp());
}