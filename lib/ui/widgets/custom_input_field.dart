import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  
  final TextEditingController controller;
  final Icon icon;
  final String labelText;
  final String hintText;
  final TextInputType inputType;

  CustomInputField({
    @required this.controller,
    @required this.icon,
    @required this.labelText,
    @required this.hintText,
    @required this.inputType
  });
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      decoration: InputDecoration(
        icon: this.icon,
        labelText: this.labelText,
        hintText: this.hintText,
      ),
      keyboardType: this.inputType
    );
  }
}