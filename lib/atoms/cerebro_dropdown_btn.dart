import 'package:flutter/material.dart';
import'package:cerebro_mobile/theme/colors.dart';

class CerebroDropdown extends StatefulWidget{
  final List<String> items;
  final String value;
  final void Function(String?)? onChanged;
 
 const CerebroDropdown({
    super.key,
    required this.items,
    required this.value,
    this.onChanged,
  });
  
  @override
  _CerebroDropdownState createState() => _CerebroDropdownState();
}

class _CerebroDropdownState extends State<CerebroDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.value,
      // icon: const Icon(Icons.arrow_downward),
      style: const TextStyle(
        color: Color(0xFF0054A6),
        fontFamily: 'Poppins',
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      onChanged: widget.onChanged,
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class Itemdropdownbutton extends StatefulWidget{
  final List<String> items;
  final String value;
  final void Function(String?)? onChanged;
 
 const Itemdropdownbutton({
    super.key,
    required this.items,
    required this.value,
    this.onChanged,
 });
 
  @override
 _ItemdropdownbuttonState createState() => _ItemdropdownbuttonState();
  }

  class _ItemdropdownbuttonState extends State<Itemdropdownbutton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton <String>(
      isExpanded: true,
      value: widget.value,
     
      style: const TextStyle(
        color: cerebroGreyborder,
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
       
      ),
      onChanged: widget.onChanged,
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
       
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
          
        );
      }).toList(),
    );
  }
  }

  