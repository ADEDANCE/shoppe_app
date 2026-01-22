import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: CircleAvatar(
                radius: 20,
                child: Image.asset("assets/images/profileimage.png"),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              "Veronika",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.normal),
            ),
            //Image.asset("assets/images/profileimage.png"),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text(
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
