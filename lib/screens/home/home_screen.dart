import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/home_screen_controller.dart';
import 'package:weather_app/screens/home/widgets/city_list.dart';
import 'package:weather_app/screens/home/widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Instantiate the HomeScreenController using Get.put()
    final controller = Get.put(HomeScreenController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Display the HomeHeader widget
              const HomeHeader(),
              const SizedBox(height: 20),
              Container(
                height: 1,
                color: const Color(0xffcccccc),
              ),
              const SizedBox(height: 40),
              // Display the CityList widget and pass the controller
              CityList(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
