import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreviewImage extends StatelessWidget {
  final Widget child;
  const PreviewImage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.blueGrey,
      ),
      child: Center(child: child),
    );
  }
}
