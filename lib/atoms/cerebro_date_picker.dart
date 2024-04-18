import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CerebroDateInputFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool allowPastDates;
  final bool allowFutureDates;

  const CerebroDateInputFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.allowPastDates = true,
    this.allowFutureDates = true,
  }) : super(key: key);

  @override
  _CerebroDateInputFormFieldState createState() =>
      _CerebroDateInputFormFieldState();
}

class _CerebroDateInputFormFieldState extends State<CerebroDateInputFormField> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: widget.allowPastDates ? DateTime(1900) : DateTime.now(),
      lastDate: widget.allowFutureDates ? DateTime(2101) : DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller.text = DateFormat.yMMMd().format(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Color.fromARGB(255, 110, 110, 110)),
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_today),
          color: cerebroBlue200,
          onPressed: () {
            _selectDate(context);
          },
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: cerebroGreyborder,
            width: 1.0,
          ),
        ),
        fillColor: cerebroGreyinput,
        filled: true,
      ),
    );
  }
}
