import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final double width;
  final double height;
  final Color? bordercolor;
  final Color? textcolor;
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.height,
    required this.width,
    this.bordercolor,
    this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(width: 2, color: bordercolor ?? Colors.transparent),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textcolor ?? Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
