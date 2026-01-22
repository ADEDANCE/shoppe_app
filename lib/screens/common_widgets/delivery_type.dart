import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryType extends StatelessWidget {
  final bool isdeliverySelected;
  final VoidCallback onTap;
  final String title;
  final String duration;
  final String price;

  const DeliveryType({
    super.key,
    required this.isdeliverySelected,
    required this.onTap,
    required this.title,
    required this.duration,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50.h),
        backgroundColor: Color(0xFFF5F8FF),
        side: BorderSide(
          color: isdeliverySelected ? Colors.blue : Colors.transparent,
          width: 2,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 13)),
          Text(
            duration,
            style: TextStyle(fontSize: 13, color: Color(0xFF004CFF)),
          ),
          Text(price, style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
