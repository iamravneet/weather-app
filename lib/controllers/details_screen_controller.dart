import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class DetailScreenController extends GetxController with GetSingleTickerProviderStateMixin{
   Map<String, dynamic> weatherData = {};
   var temp;
   var maxTemp;
   var minTemp;
   var feelsLike;
   late AnimationController animationController;
   late Animation<Offset> animation;


  @override
  void onInit() {
    if(Get.arguments != null){
      weatherData = Get.arguments;
      temp = weatherData['main']['temp'];
      maxTemp = weatherData['main']['temp_max'];
      minTemp = weatherData['main']['temp_min'];
      feelsLike = weatherData['main']['feels_like'];
    }
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));
    animationController.forward();

    super.onInit();
  }

   @override
   void dispose() {
     animationController.dispose();
     super.dispose();
   }
}