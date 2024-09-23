import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ContainerWithShadows extends StatelessWidget {
  final double widthMultiplier;
  final double heightMultiplier;
  final Widget? child;
  final bool applyGradient;
  const ContainerWithShadows(
      {super.key,
      required this.widthMultiplier,
      required this.heightMultiplier,
      this.child,
      this.applyGradient = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * widthMultiplier,
      height: MediaQuery.of(context).size.height * heightMultiplier,
      decoration: BoxDecoration(
        gradient: applyGradient
            ? const LinearGradient(
                colors: [AppColors.primaryColorLight, AppColors.primaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: applyGradient ? null : Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 5,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: child ?? Container(),
    );
  }
}
