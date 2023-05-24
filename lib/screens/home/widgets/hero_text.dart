import 'package:flutter/cupertino.dart';

class HomeHeroText extends StatelessWidget {
  const HomeHeroText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Hero(
      tag: 'today',
      child: DefaultTextStyle(
        style: TextStyle(
          decoration: TextDecoration.none, // Remove underline
        ),
        child: Text(
          "today",
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'CirceBold',
            color: Color(0xff1F1F1F),
          ),
        ),
      ),
    );
  }
}