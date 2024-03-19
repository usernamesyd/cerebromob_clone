import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class CerebroPasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;

  const CerebroPasswordFormField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.icon,
  }) : super(key: key);

  @override
  State<CerebroPasswordFormField> createState() => _CerebroPasswordFormFieldState();
}

class _CerebroPasswordFormFieldState extends State<CerebroPasswordFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = true; // By default, the text is obscured
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: Icon(widget.icon, color: cerebroBlue200,),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: cerebroBlue200,),
          onPressed: _toggleVisibility,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none, 
        ),
        fillColor: cerebroWhite,
        filled: true,
        // Add any other styling or decoration you need
      ),
      // Add any other TextFormField properties you need
    );
  }
}