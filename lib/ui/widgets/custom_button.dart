import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Icon icon;

  CustomButton({
    @required this.child,
    this.onPressed,
    @required this.backgroundColor,
    @required this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton.icon(
          elevation: 0.0,
          icon: this.icon,
          label: Container(child: this.child),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: this.backgroundColor,
          textColor: this.textColor,
          onPressed: this.onPressed,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          elevation: 0.0,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
              child: this.child),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: this.backgroundColor,
          textColor: this.textColor,
          onPressed: this.onPressed,
        ),
      );
    }
  }
}
