import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';

class CerebroElevatedBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor; // Optional background color
  final Color? textColor; // Optional text color

  const CerebroElevatedBtn({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? cerebroBlue200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      child: Text(
        text,
        style: poppinsH5.copyWith(
          color: textColor ?? cerebroWhite,
        ),
      ),
    );
  }
}

class CerebroOutlinedBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor; 
  final Color? borderColor; 
  final Color? textColor; 

  const CerebroOutlinedBtn({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.transparent,
        side: BorderSide(
          color: cerebroBlue100, // Set the color of the border
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      child: Text(
        text,
        style: poppinsH5.copyWith(
          color: textColor ?? cerebroBlue200,
          fontSize: 14,
        ),
      ),
    );
  }
}
