import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final Icon icon;
  final String labelText;
  final String hintText;
  final TextInputType inputType;
  final Function(String) getText;

  CustomInputField(
      {@required this.getText,
      @required this.controller,
      @required this.icon,
      @required this.labelText,
      @required this.hintText,
      @required this.inputType});

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: (String text) {
          setState(() {
            widget.getText(text);
          });
        },
        controller: this.widget.controller,
        decoration: InputDecoration(
          icon: this.widget.icon,
          labelText: this.widget.labelText,
          hintText: this.widget.hintText,
        ),
        keyboardType: this.widget.inputType);
  }
}
