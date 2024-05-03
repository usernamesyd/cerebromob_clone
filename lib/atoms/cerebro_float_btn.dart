import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class CerebroFloatingButton extends StatelessWidget {
  final String text; // Text to be displayed

  // Constructor that requires the text to be passed in
  const CerebroFloatingButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cerebroWhite,
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          // Wrap the icon with InkWell to make it tappable
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xFF0054A6), // Blue color for the circle
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.keyboard_arrow_left_rounded,
                color: cerebroWhite,
                size: 28,
              ),
            ),
          ),
          SizedBox(width: 20),
          Text(
            text, // Use the passed-in text
            style: TextStyle(
              color: Color(0xFF0054A6),
              fontFamily: 'Poppins',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
