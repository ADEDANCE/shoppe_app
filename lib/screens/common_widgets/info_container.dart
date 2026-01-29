import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final String details;
  final VoidCallback onPressed;
  const InfoContainer({
    super.key,
    required this.title,
    required this.details,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 228, 243, 248),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300.w,
                child: Text(
                  textAlign: TextAlign.left,
                  details,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              GestureDetector(
                child: Image.asset("assets/images/bluenav-btn.png"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
