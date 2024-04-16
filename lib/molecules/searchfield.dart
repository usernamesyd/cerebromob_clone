import 'package:flutter/material.dart';
import 'package:cerebro_mobile/theme/texts.dart';

class CerebroSearchField extends StatelessWidget {
  const CerebroSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Search:',
          style: poppinsParagraph.copyWith(
            color: Colors.black87,
            fontSize: 12,
          ),
        ),
        SizedBox(width: 5),
        Container(
          width: 91,
          height: 19,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: TextField(
            
            decoration: InputDecoration(
              border: InputBorder.none,
              
            ),
          ),
        ),
      ],
    );
  }
}