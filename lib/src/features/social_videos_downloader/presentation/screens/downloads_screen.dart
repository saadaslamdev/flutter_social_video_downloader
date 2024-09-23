import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles_manager.dart';
import '../widgets/downloads_screen/downloads_screen_body.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Downloads',
          textAlign: TextAlign.center,
          style: getTitleStyle(
            color: AppColors.white,
          ),
        ),
      ),
      body: const DownloadsScreenBody(),
    );
  }
}
