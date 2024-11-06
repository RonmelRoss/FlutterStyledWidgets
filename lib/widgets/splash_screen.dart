import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_styled_widgets/widgets/login_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to HomeScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Get.to(LoginScreen());
    });
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100),
            SizedBox(height: 20),
            Text(
              "Styled Widgets",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
