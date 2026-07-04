import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/theme/app_colors.dart';

class ProducrCard extends StatelessWidget {
  final double width;
  final VoidCallback onTap;
  final String imagepath;
  final String? likesnumber;
  final IconData? likeicon;
  final String? productstatus;
  final String? name;
  final String? description;
  final String? price;
  const ProducrCard({
    super.key,
    required this.width,
    required this.onTap,
    required this.imagepath,
    this.likesnumber,
    this.likeicon,
    this.productstatus,
    this.name,
    this.description,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: AppColors.secondaryWhite,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.network(
                    imagepath,
                    height: 150.h,
                    width: double.infinity, //  TAKE FULL CARD WIDTH
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 5.h),
                if (likesnumber != null) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if (likesnumber != null)
                            Text(
                              likesnumber!,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000),
                              ),
                            ),
                          SizedBox(width: 3),
                          // Icon(Icons.favorite, color: Color(0xFF0042E0)),
                          Icon(likeicon),
                        ],
                      ),
                      if (productstatus != null)
                        Text(
                          productstatus!,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF000000),
                          ),
                        ),
                    ],
                  ),
                ],
              ],
            ),

            if (name != null || description != null || price != null)
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    if (name != null)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          name!,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    if (description != null)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          description!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),

                    if (price != null)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          price!,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
