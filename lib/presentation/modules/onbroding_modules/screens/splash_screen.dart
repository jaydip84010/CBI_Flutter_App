import 'package:cbi/presentation/modules/home_modules/screens/home_screen.dart';
import 'package:cbi/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../../../common_widget/custom_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then(
      (_) async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false,
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomAnimation(
          seconds: 1000,
          verticalOffset: 200,

          child: Image(
            height: 210,
            width:210,
            image: AssetImage(AppImages.logo),
          ),
        ),
      ),
    );
  }
}
