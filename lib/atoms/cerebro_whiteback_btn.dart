import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';

class WhiteBackButton extends StatelessWidget {
  const WhiteBackButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: cerebroBlue100, // Make sure this color is defined in your theme
          ),
        ),
      ),
    );
  }
}