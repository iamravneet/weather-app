import 'package:flutter/material.dart';
import 'hero_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          // Display the HomeHeroText widget
          HomeHeroText(),
          Icon(Icons.add, color: Color(0xff1F1F1F), size: 30),
        ],
      ),
    );
  }
}
