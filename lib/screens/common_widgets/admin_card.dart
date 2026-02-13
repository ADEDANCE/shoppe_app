import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminCard extends StatelessWidget {
  final Icon? icon;
  final String title;
  final String? imagepath;
  final String amount;
  final VoidCallback onTap;
  final Icon? editicon;
  final Icon? deleteicon;
  final VoidCallback? editTap;
  final VoidCallback? deleteTap;
  final Color? price;
  final String? category;
  const AdminCard({
    super.key,
    this.icon,
    this.imagepath,
    required this.title,
    required this.amount,
    required this.onTap,
    this.editicon,
    this.deleteicon,
    this.editTap,
    this.deleteTap,
    this.price,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Color(0xFFD9E4FF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: icon,
                    // Icon(Icons.grid_4x4),
                  ),
                ],
                if (imagepath != null) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      imagepath!,
                      width: 140.w,
                      height: 140.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
                SizedBox(width: 15.w),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        amount,
                        style: TextStyle(
                          color: price ?? Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    if (category != null) ...[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 7,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.white54,
                          ),
                          child: Text(
                            category!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            Row(
              children: [
                if (editicon != null) ...[
                  GestureDetector(onTap: editTap, child: editicon!),
                ],
                SizedBox(width: 15),
                if (deleteicon != null) ...[
                  GestureDetector(onTap: deleteTap, child: deleteicon!),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
