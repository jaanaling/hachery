import 'package:advertising_id/advertising_id.dart';
import 'package:chicken_hatchery/src/core/utils/app_icon.dart';
import 'package:chicken_hatchery/src/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../routes/route_value.dart';
import '../../../../core/utils/icon_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startLoading(context);
  }

  Future<void> startLoading(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    final adId = await AdvertisingId.id(true);
    // context.go(RouteValue.home.path);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  IconProvider.background.buildImageUrl(),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: AppIcon(
            asset: IconProvider.logo.buildImageUrl(),
            width: getWidth(context, percent: 1),
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          bottom: height * 0.036 + MediaQuery.of(context).padding.bottom,
          child: const CircularProgressIndicator(
            backgroundColor: Color(0xfff4dfa7),
            color: Color(0xFF650E24),
          ),
        ),
      ],
    );
  }
}
