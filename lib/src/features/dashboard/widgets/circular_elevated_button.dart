import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/app_colors.dart';

class CircularElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  const CircularElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ElevatedButton(
        onPressed: () {
          onPressed.call();
        },
        style: ElevatedButton.styleFrom(
            minimumSize: Size(context.width * 0.08, context.height * 0.08),
            backgroundColor: backgroundColor ?? AppColors.primaryColorLight,
            shape: const CircleBorder(),
            overlayColor: AppColors.primaryColor),
        child: Center(child: child),
      ),
    );
  }
}
