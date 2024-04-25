import 'package:cerebro_mobile/molecules/searchdues.dart';
import 'package:flutter/material.dart';
import 'package:cerebro_mobile/theme/texts.dart';

class SearchDues extends StatelessWidget {
  const SearchDues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      SizedBox(width: 5,),
        Text(
          'Search',
          style: poppinsParagraph.copyWith(
            color: Colors.black87,
            fontSize: 14,
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 125,
          height: 25,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: TextField(
            style: TextStyle(
              fontSize: 10
            ),
            decoration: InputDecoration(
            border: InputBorder.none,
              
            ),
          ),
        ),
      ],
    );
  }
}