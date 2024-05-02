import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';

class CerebroSmallBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor; // Optional background color
  final Color? textColor; // Optional text color

  const CerebroSmallBtn({
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
        //padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      ),
      child: Text(
        text
        ,style:TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 12),
      ),
    );
  }
}
