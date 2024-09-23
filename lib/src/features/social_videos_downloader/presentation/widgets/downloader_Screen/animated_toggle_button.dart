import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_videos_downloader/src/core/media_query.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/app_colors.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/app_strings.dart';
import 'package:flutter_social_videos_downloader/src/core/utils/styles_manager.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/presentation/bloc/theme_bloc/theme_event.dart';

import '../../bloc/theme_bloc/theme_bloc.dart';

class AnimatedToggleButton extends StatefulWidget {
  const AnimatedToggleButton({super.key});

  @override
  State<AnimatedToggleButton> createState() => _AnimatedToggleButtonState();
}

class _AnimatedToggleButtonState extends State<AnimatedToggleButton> {
  bool isToggled = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => toggleState(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(isToggled ? AppStrings.darkMode : AppStrings.lightMode,
                style: getBoldStyle(
                    color: AppColors.white, fontSize: context.height * 0.015)),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: context.width * 0.2,
              height: context.height * 0.04,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                    top: 1.5,
                    left: isToggled ? context.width * 0.1 : 0,
                    right: isToggled ? 0 : context.width * 0.1,
                    child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                              scale: animation, child: child);
                        },
                        child: isToggled
                            ? Icon(
                                Icons.mode_night,
                                color: AppColors.primaryColor,
                                size: context.height * 0.035,
                                key: UniqueKey(),
                              )
                            : Icon(
                                Icons.sunny,
                                color: AppColors.primaryColor,
                                size: context.height * 0.035,
                                key: UniqueKey(),
                              )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toggleState() {
    setState(() {
      isToggled = !isToggled;
    });
    BlocProvider.of<ThemeBloc>(context).add(ThemeEventChange(
        isToggled ? ThemeEventType.toggleLight : ThemeEventType.toggleDark));
  }
}
