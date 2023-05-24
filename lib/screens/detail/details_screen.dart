import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/details_screen_controller.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailScreenController());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  Color(0xffD6672C),
                  Color(0xffF9D9B7),
                  Colors.white,
                ],
                stops: [0.0, 0.7, 1.0],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SlideTransition(
                position: _animation,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.close(1);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xff1F1F1F),
                          size: 30,
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            'C°',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'F°',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 1,
                color:  Colors.grey,
              ),
              const SizedBox(
                height: 30,
              ),
              SlideTransition(
                position: _animation,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child:  Text(
                    controller.weatherData['name'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SlideTransition(
                position: _animation,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child:  Text(
                            '${controller.temp.toInt()}',
                            style: const TextStyle(
                              fontSize: 140,
                              color: Color(0xff1F1F1F),
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/sun.png',
                          height: 20,
                          width: 20,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Text(
                            controller.weatherData['weather'][0]['main'].toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          Row(
                            children:  [
                              const Text(
                                'Feels like',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${controller.feelsLike.toString()}°',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff1F1F1F),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: const Color(0xffcccccc),
              ),
              const SizedBox(
                height: 50,
              ),

              SlideTransition(
                position: _animation,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children:   [
                            const Icon(Icons.arrow_upward, color: Color(0xff1F1F1F),),
                            Text(
                              '${controller.maxTemp.toInt()}°',
                              style: const TextStyle(
                                  color: Color(0xff1F1F1F)
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          'humidity    ${controller.weatherData['main']['humidity']}',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'uv index    2',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children:   [
                            const Icon(Icons.arrow_upward, color: Color(0xff1F1F1F),),
                            Text(
                              '${controller.minTemp.toInt()}°',
                              style: const TextStyle(
                                  color: Color(0xff1F1F1F)
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          'wind    ${controller.weatherData['wind']['speed']} m/s',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'pressure    ${controller.weatherData['main']['pressure']} mmHg',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 1,
                color: const Color(0xffcccccc),
              ),
              const SizedBox(
                height: 50,
              ),

              SlideTransition(
                position: _animation,
                child: SingleChildScrollView(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: const [
                            Text(
                              'now',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14
                              ),
                            ),
                            Text(
                              '17',
                              style: TextStyle(
                                  color: Color(0xff1F1F1F),
                                  fontSize: 14
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: const [
                            Text(
                              '10 am',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14
                              ),
                            ),
                            Text(
                              '18',
                              style: TextStyle(
                                  color: Color(0xff1F1F1F),
                                  fontSize: 14
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: const [
                            Text(
                              '11 am',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14
                              ),
                            ),
                            Text(
                              '19',
                              style: TextStyle(
                                  color: Color(0xff1F1F1F),
                                  fontSize: 14
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
