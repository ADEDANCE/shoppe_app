import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return SizedBox(
      width: width,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.zero,
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                  left: 5,
                  right: 5,
                  top: 4,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        imagepath,

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
              ),
            ),
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
    );
  }
}
