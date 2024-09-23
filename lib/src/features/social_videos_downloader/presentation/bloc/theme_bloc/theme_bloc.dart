import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_videos_downloader/src/features/social_videos_downloader/presentation/bloc/theme_bloc/theme_event.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_manager.dart';
import '../../../../../core/utils/styles_manager.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.darkTheme) {
    on<ThemeEventChange>((event, emit) {
      switch (event.currentTheme) {
        case ThemeEventType.toggleDark:
          emit(ThemeState.darkTheme);
          break;
        case ThemeEventType.toggleLight:
          emit(ThemeState.lightTheme);
          break;
      }
    });
  }
}