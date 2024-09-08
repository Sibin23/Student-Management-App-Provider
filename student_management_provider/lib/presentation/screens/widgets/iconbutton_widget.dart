import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class IconbuttonWidget extends StatelessWidget {
  const IconbuttonWidget(
      {super.key,
      required this.voidCallback,
      required this.icon,
      required this.iconsize,
      this.iconColor});
  final VoidCallback voidCallback;
  final IconData icon;
  final double iconsize;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        voidCallback();
      },
      child: Container(
        decoration: Theme.of(context).brightness == Brightness.dark
            ? boxDecorCircle
            : boxDecorCircleWhite,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            size: iconsize,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
