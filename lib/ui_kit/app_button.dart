import 'package:chicken_hatchery/src/core/utils/size_utils.dart';
import 'package:chicken_hatchery/ui_kit/animated_button.dart';
import 'package:chicken_hatchery/ui_kit/app_container.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? fontSize;
  final double? width;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
        onPressed: onPressed,
        child: AppContainer(
          verticalPadding: 21,
          child: SizedBox(
            width: width ?? getWidth(context, baseSize: 221),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF3F1F1A),
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontFamily: 'Bw Surco DEMO',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ));
  }
}
