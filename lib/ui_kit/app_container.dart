import 'package:flutter/cupertino.dart';

class AppContainer extends StatelessWidget {
  final double? horizontalPadding;
  final double? verticalPadding;
  final Widget child;
  const AppContainer({
    super.key,
    this.horizontalPadding,
    this.verticalPadding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFFFFCC93),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          decoration: ShapeDecoration(
            gradient: const RadialGradient(
              radius: 0.8,
              colors: [
                Color(0xFFECDBA5),
                Color(0xFFE9D4A9),
                Color(0xFFFFCC93)
              ],
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 3, color: Color(0xFFCFA06B)),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? 9,
              horizontal: horizontalPadding ?? 14,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
