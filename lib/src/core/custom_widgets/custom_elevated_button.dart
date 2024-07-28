import 'package:flutter/material.dart';

import '../media_query.dart';

class CustomElevatedBtn extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final double? width;

  const CustomElevatedBtn(
      {super.key, this.onPressed, required this.label, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width ?? context.width / 2,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
