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
      icon:   Icon(Icons.keyboard_arrow_down,
      color:  Color(0xFF0054A6),
      size:  28 ),
      onChanged: widget.onChanged,
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
          style: TextStyle( 
            color: Color(0xFF0054A6),
             fontFamily: 'Poppins', 
             fontSize: value == widget.value ? 25 : 20, 
            fontWeight: value == widget.value ? FontWeight.bold : FontWeight.normal,
        ),
          ),
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
 
  @override _ItemdropdownbuttonState createState() => _ItemdropdownbuttonState();
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


class GeneralDropdown extends StatefulWidget {
  final List<String> items;
  final String initialValue;
  final ValueChanged<String> onChanged;

  const GeneralDropdown({
    required this.items,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  _GeneralDropdownState createState() => _GeneralDropdownState();
}

class _GeneralDropdownState extends State<GeneralDropdown> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
                color: cerebroGreyborder,
                width: 1.0,
                style: BorderStyle.solid,
            
            ),
          color: cerebroGreyinput,
        ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 0.0),
        
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            DropdownButton<String>(
              isExpanded: true,
              items: widget.items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, 
                  style: TextStyle(
                    color: cerebroGreyborder,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  ),
                );
              }).toList(),

              value: dropdownValue,
              onChanged: (String? value,) {
                setState(() {
                  dropdownValue = value!;
                });
                widget.onChanged(value!);
              },
            ),
          ],
        ),
      ),
    );
  }
}