import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDetail extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Color? circlecolor;
  final Color? iconcolor;
  final Color? textcolor;
  final VoidCallback onPressed;
  const ProfileDetail({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.iconcolor,
    this.circlecolor,
    this.textcolor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor:
                  circlecolor ?? Color.fromARGB(255, 170, 194, 252),
              child: Icon(icon, color: iconcolor),
            ),
            SizedBox(width: 15.w),
            Text(title, style: TextStyle(color: textcolor)),
          ],
        ),

        Row(
          children: [
            if (subtitle != null) ...[Text(subtitle ?? "")],

            SizedBox(width: 10),
            IconButton(onPressed: onPressed, icon: Icon(Icons.arrow_forward_ios)),
          ],
        ),
      ],
    );
  }
}
