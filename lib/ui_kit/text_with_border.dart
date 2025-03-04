import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWithBorder extends StatelessWidget {
  final double fontSize;
  const TextWithBorder(
    this.text, {
    this.fontSize = 30,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    const Color borderColor = Color(0xFF007004);

    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Bw Surco DEMO',
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 4
              ..color = borderColor,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontFamily: 'Bw Surco DEMO',
          ),
        ),
      ],
    );
  }
}
