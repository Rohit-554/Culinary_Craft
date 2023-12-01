import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  final Color buttonColor;
  final Color textColor;

  RoundedButton({
    required this.text,
    required this.onPressed,
    this.borderRadius = 8.0,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        onPrimary: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
    minimumSize: Size(double.infinity, 20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(text),
      ),
    );
  }
}
