import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/splash/widgets/hero_text.dart';
import '../../utilities/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Define the animation using Tween and CurvedAnimation
    animation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    // Start the animation
    _controller.forward();

    // Set a timer to navigate to the home screen after a certain duration
    Timer(
      const Duration(seconds: 2),
          () => Get.offNamed(Routes.homeScreen),
    );
  }

  @override
  void dispose() {
    // Dispose the animation controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Apply a fade transition to the HeroText widget
            FadeTransition(
              opacity: _controller,
              child: const HeroText(),
            ),
          ],
        ),
      ),
    );
  }
}
