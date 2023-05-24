import 'package:flutter/cupertino.dart';

import '../../../controllers/home_screen_controller.dart';
import '../../../services/remote_services.dart';
import 'city_tile.dart';

class CityList extends StatelessWidget {
  final HomeScreenController controller;

  const CityList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.cities.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final cityData = controller.cities[index];
        final city = cityData['city'];
        final country = cityData['country'];
        return FutureBuilder<Map<String, dynamic>>(
          future: RemoteServices.fetchWeatherData(city, country),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final weatherData = snapshot.data!;
              return CityTile(
                cityName: weatherData['name'],
                country: country!,
                weatherData: weatherData,
                index: index,
              );
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}