import 'package:flutter/material.dart';

class ProductCircle extends StatelessWidget {
  final String imagepath;
  final VoidCallback onTap;
  final double? radius;
  final double? backgroundradius;
  final Color? backgroundColor;
  const ProductCircle({
    super.key,
    required this.imagepath,
    required this.onTap,
    this.radius,
    this.backgroundradius,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: backgroundradius ?? 30, // total size
        backgroundColor: backgroundColor ?? Colors.white,
        child: CircleAvatar(
          radius: radius ?? 26, // image size
          backgroundImage: AssetImage(imagepath),
        ),
      ),
    );
  }
}
