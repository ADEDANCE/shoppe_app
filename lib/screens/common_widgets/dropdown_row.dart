import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownRow extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  const DropdownRow({
    super.key,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.normal),
            ),
            Row(
              children: [
                if (subtitle != null) ...[
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
                SizedBox(width: 6.w),
                GestureDetector(
                  onTap: onTap,
                  child: Icon(Icons.chevron_right_rounded),
                ),

                // DropdownButton(items: Text("data"), onChanged: onChanged)
              ],
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
