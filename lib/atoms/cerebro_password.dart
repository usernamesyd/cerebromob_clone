import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class CerebroPassword extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final IconData? icon;
  final bool isPassword;

  const CerebroPassword({
    Key? key,
    required this.controller,
    required this.text,
    this.icon,
    this.isPassword = false,  
  }) : super(key: key);

  @override
  _CerebroPasswordState createState() => _CerebroPasswordState();
}

class _CerebroPasswordState extends State<CerebroPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: widget.icon != null ? Icon(widget.icon, color: cerebroBlue200) : null,
        suffixIcon: widget.isPassword
            ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: IconButton(
                  icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                  color: cerebroBlue200,
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
            )
            : null,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none, 
        ),
        fillColor: cerebroWhite,
        filled: true,
        hintText: widget.text,
      ),
    );
  }
}
