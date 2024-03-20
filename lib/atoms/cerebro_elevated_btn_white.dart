import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';

class CerebroElevatedBtnWhite extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor; // Optional background color
  final Color? textColor; // Optional text color

  const CerebroElevatedBtnWhite({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? cerebroWhite,
        side: BorderSide(
          color: cerebroBlue200,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      child: Text(text, style: poppinsH5.copyWith(
        color: textColor ?? cerebroBlue200,
      ),
      ),
    );
  }
}