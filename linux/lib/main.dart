import 'package:cbi/presentation/controllers/bcc_controller.dart';
import 'package:cbi/presentation/controllers/dashboard_controller.dart';
import 'package:cbi/presentation/controllers/home_controller.dart';
import 'package:cbi/presentation/controllers/tcc.controller.dart';
import 'package:cbi/presentation/modules/onbroding_modules/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => TccController());
    Get.lazyPut(() => BccController());
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
