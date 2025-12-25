import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ButtonWidget({super.key,
  required this.text,
  required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return    ElevatedButton( onPressed: onPressed, style: ElevatedButton.styleFrom(
                 backgroundColor: Color(0xFF004CFF),
       minimumSize: Size(double.infinity, 61),
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
            ) ,child: Text( text,   style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),));
  }
}