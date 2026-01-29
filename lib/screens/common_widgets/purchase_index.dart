import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurchaseIndex extends StatelessWidget {
  const PurchaseIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 228, 243, 248),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        "2",
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
