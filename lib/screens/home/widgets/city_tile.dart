import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controllers/home_screen_controller.dart';
import '../../../utilities/routes.dart';

class CityTile extends StatelessWidget {
  final String cityName;
  final String country;
  final Map<String, dynamic> weatherData;
  final int index;

  const CityTile({
    Key? key,
    required this.cityName,
    required this.country,
    required this.weatherData,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final temperature = weatherData['main']['temp'];
    final formattedTime = DateFormat('hh:mm a').format(
      DateTime.now().toUtc().add(
        Duration(seconds: weatherData['timezone']),
      ),
    );
    final weatherCondition = weatherData['weather'][0]['main'];
    final weatherIcon = _getWeatherIcon(weatherCondition);
    final controller = Get.find<HomeScreenController>();
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigate to the details screen with weatherData as arguments
            Get.toNamed(Routes.detailsScreen, arguments: weatherData);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      country,
                      style:  TextStyle(
                        fontSize: 12,
                        fontFamily: 'Circe',
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      cityName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'CirceBold',
                        color: Color(0xff1F1F1F),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      formattedTime,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Circe',
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${temperature.toInt()}°",
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'CirceBold',
                            color: Color(0xff1F1F1F),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          weatherIcon,
                          height: 20,
                          width: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        // Display a horizontal divider if this is not the last city tile
        if (index != controller.cities.length - 1)
          Container(
            height: 1,
            color: const Color(0xffcccccc),
          ),
        const SizedBox(height: 40),
      ],
    );
  }

  // Get the weather icon based on the weather condition
  String _getWeatherIcon(String condition) {
    switch (condition) {
      case 'Clouds':
        return 'assets/cloudy.png';
      case 'Sunny':
        return 'assets/sunny.png';
      case 'Clear':
        return 'assets/sun.png';
      case 'Rain':
        return 'assets/rainy.png';
      default:
        return 'assets/unknown.png';
    }
  }
}
