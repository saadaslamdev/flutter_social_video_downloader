import 'package:flutter/material.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/app_colors.dart';

import '../media_query.dart';

class CustomElevatedBtn extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final Color? backgroundColor;
  final double? width;

  const CustomElevatedBtn(
      {super.key,
      this.onPressed,
      required this.label,
      this.backgroundColor,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width ?? context.width / 2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Text(label, style: const TextStyle(color: AppColors.white)),
      ),
    );
  }
}
