import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/theme/app_colors.dart';

class CategoriesCard extends StatelessWidget {
  final List<String> images;
  final String category;
  final String productnum;
  final VoidCallback onTap;
  const CategoriesCard({
    super.key,
    required this.images,
    required this.category,
    required this.productnum,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 195.w,
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: AppColors.secondaryWhite,
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
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 3,
                          childAspectRatio: 1,
                        ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    primary: false,
                    itemCount: images.length.clamp(0, 4), // safety
                    itemBuilder: (context, index) {
                      return Image.network(images[index], fit: BoxFit.cover);
                    },
                  ),
                ),

                SizedBox(height: 12),

                // TEXT ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      productnum,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
