import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;



class HomeScreenController extends GetxController{
  final cities = [
    {
      'city':'London',
      'country':'United Kingdom',
    },
    {
      'city':'New York',
      'country':'USA',
    },
    {
      'city':'Paris',
      'country':'France',
    },
    {
      'city':'Tokyo',
      'country':'Japan',
    },
    {
      'city':'Kerala',
      'country':'India',
    },
    {
      'city':'surrey',
      'country':'Canada',
    },
   ];

  RxString formattedTime = ''.obs;




  String getCurrentTimeByCountry(String? country, String? city) {
    final location = tz.getLocation('${country}/${city}');
    final currentTime = tz.TZDateTime.now(location);

    return currentTime.toString();
  }




}