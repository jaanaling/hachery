import 'package:flutter/material.dart';
import 'package:chicken_hatchery/src/core/utils/icon_provider.dart';
import 'package:chicken_hatchery/ui_kit/animated_button.dart';
import 'package:flutter/cupertino.dart';

class AppButton extends StatelessWidget {
  final BColor color;
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? fontSize;

  const AppButton({
    super.key,
    required this.color,
    required this.onPressed,
    required this.text,
    this.width,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: onPressed,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(color == BColor.blue
                  ? IconProvider.blue.buildImageUrl()
                  : color == BColor.green
                      ? IconProvider.green.buildImageUrl()
                      : IconProvider.yellow.buildImageUrl()), ),
          boxShadow: [
            const BoxShadow(
              color: Color.fromARGB(153, 129, 100, 100),
              blurRadius: 0,
              offset: Offset(0, 3),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize ?? 30,
              fontFamily: 'Bur',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

enum BColor {
  green(),
  yellow(),
  blue();
}
