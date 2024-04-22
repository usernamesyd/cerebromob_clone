import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class CerebroTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final IconData? icon;

  const CerebroTextFormField({
    super.key,
    required this.controller,
    required this.text,
    this.icon,  
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
         prefixIcon: icon != null ? Icon(icon,
         color: cerebroBlue200,
         ) : null,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none, 
        ),
        fillColor: cerebroWhite,
        filled: true,
        hintText: text,
      ),
    );
  }
}

class CerebroInputFormField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final IconData? icon;
  

  const CerebroInputFormField({
    super.key,
    required this.controller,
    required this.text,
    this.icon,  
    
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: 60,

    
        child: TextFormField(
          controller: controller,
         
          decoration: InputDecoration(
             prefixIcon: icon != null ? Icon(icon,
             color: cerebroBlue200,
             ) : null,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14, ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: cerebroGreyborder, width: 1.0,), 
            ),
            fillColor: cerebroGreyinput,
            filled: true,
            hintText: text, 
          ),
         
       
         
        ),
        
      
    );
  }
  
}
