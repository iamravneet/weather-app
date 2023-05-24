import 'package:flutter/cupertino.dart';

class HeroText extends StatelessWidget {
  const HeroText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Hero(
      tag: 'today', // Unique tag for the Hero animation
      child: DefaultTextStyle(
        style: TextStyle(
          decoration: TextDecoration.none, // Remove underline
        ),
        child: Text(
          'What is\nthe weather like\ntoday?', // Text content
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'CirceBold',
            color: Color(0xff1F1F1F), // Text color
          ),
          textAlign: TextAlign.start, // Text alignment
        ),
      ),
    );
  }
}
