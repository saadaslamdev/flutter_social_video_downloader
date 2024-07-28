import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/app_strings.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/styles_manager.dart';
import '../../config/routes_manager.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_constants.dart';
import '../../core/utils/preload_svg_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: AppConstants.animationTime),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animationController.forward();

    preloadAssets();
    Timer.periodic(
      const Duration(milliseconds: AppConstants.navigateTime),
      (timer) => navigateToNextScreen(),
    );
  }

  Future preloadAssets() async {
    PreLoadAssets preLoadAssets = PreLoadAssets();
    await preLoadAssets.preLoadLoadingScreenAssets();
  }

  navigateToNextScreen() {
    if (mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.dashboard,
        (route) => false,
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Image(
                width: context.width * 0.5,
                height: context.width * 0.5,
                fit: BoxFit.scaleDown,
                image: const AssetImage(AppAssets.logo),
              ),
            ),
            Positioned(
              bottom: context.height * 0.05,
              child: Column(
                children: [
                  Text(
                    AppStrings.appName.toUpperCase(),
                    style: getTitleStyle(
                        fontSize: context.width * 0.06,
                        color: AppColors.primaryColor),
                  ),
                  Text(AppStrings.appSlogan,
                      style: getRegularStyle(
                          fontSize: context.width * 0.035,
                          color: AppColors.primaryColor))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
