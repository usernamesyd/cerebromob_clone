import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
class CerebroIconOnlyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final Color iconColor;
  final Color backgroundColor;
  final double iconSize;
  const CerebroIconOnlyButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.iconSize = 20.0,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: cerebroBlue100,
        side: BorderSide(
          color: Colors.white, // White border color
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: 20,
      ),
    );
  }
}