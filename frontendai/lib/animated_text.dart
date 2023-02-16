import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Animated extends StatefulWidget {
  const Animated({key});

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  //textcolor adjustment
  var textColors = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          width: 10,
          height: 20,
        ),
        Text(
          "Type",
          style: TextStyle(fontSize: 15, color: textColors),
        ),
        const SizedBox(
          width: 8,
          height: 20,
        ),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Horizon',
          ),
          child: AnimatedTextKit(
              repeatForever: true,
              isRepeatingAnimation: true,
              animatedTexts: [
                TyperAnimatedText(
                    'in a prompt to let the latest AI generate your image...',
                    speed: Duration(milliseconds: 70),
                    textStyle: TextStyle(fontSize: 15, color: textColors)),
              ]),
        )
      ],
    ));
  }
}
