import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/route_manager.dart';
import 'package:weather_app/screens/detail/details_screen.dart';
import 'package:weather_app/screens/home/home_screen.dart';
import 'package:weather_app/screens/splash/splash_screen.dart';
import 'package:weather_app/utilities/routes.dart';

class AppPages {
  static const initialPage = Routes.splashScreen;
  static final pages = [

    GetPage(
        name: Routes.splashScreen,
        page: () =>  const SplashScreen()
    ),


    GetPage(
        name: Routes.homeScreen,
        transition: Transition.downToUp,
        transitionDuration: const Duration(seconds: 3),
        page: () => const HomeScreen()
    ),

    GetPage(
        name: Routes.detailsScreen,
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(seconds: 1),
        page: () => const DetailsScreen()
    ),

  ];
}