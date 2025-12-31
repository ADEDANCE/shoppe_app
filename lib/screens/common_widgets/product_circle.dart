import 'package:flutter/material.dart';

class ProductCircle extends StatelessWidget {
  final String imagepath;
  final VoidCallback onTap;
  const ProductCircle({
    super.key,
    required this.imagepath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 30, // total size
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 26, // image size
          backgroundImage: AssetImage(imagepath),
        ),
      ),
    );
  }
}
