import 'package:chicken_hatchery/src/core/utils/app_icon.dart';
import 'package:chicken_hatchery/src/core/utils/icon_provider.dart';
import 'package:chicken_hatchery/ui_kit/animated_button.dart';
import 'package:chicken_hatchery/ui_kit/text_with_border.dart';
import 'package:flutter/cupertino.dart';

import '../src/core/utils/size_utils.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const GreenButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AppIcon(
            asset: IconProvider.greenButton.buildImageUrl(),
            width: getWidth(context, baseSize: 221) + 16,
          ),
          TextWithBorder(text)
        ],
      ),
    );
  }
}
