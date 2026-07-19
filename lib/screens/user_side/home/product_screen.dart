import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/product_card.dart';
import 'package:shoppe/screens/user_side/home/product_details.dart';
import 'package:shoppe/screens/user_side/services/product_categories.dart';

class ProductScreen extends StatelessWidget {
  final String categoryName;
  const ProductScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final FirestoreService service = FirestoreService();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 45),

          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shop',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset("assets/images/FilterIcon.png"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              StreamBuilder<QuerySnapshot>(
                stream: service.getProductsByCategory(categoryName),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final categoryProducts = snapshot.data!.docs;
                  return Column(
                    children: List.generate((categoryProducts.length / 2).ceil(), (
                      rowindex,
                    ) {
                      // Get the two categories for this row
                      final firstIndex = rowindex * 2;
                      final secondIndex = firstIndex + 1;
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: 10,
                        ), // space below each row
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProducrCard(
                              width: 190.w,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ProductDetails(
                                      productId:
                                          categoryProducts[firstIndex].id,
                                    ),
                                  ),
                                );
                              },
                              imagepath: categoryProducts[firstIndex]["image"]
                                  .toString(),
                              name:
                                  categoryProducts[firstIndex]["name"]
                                      as String,
                              // description:
                              //     categoryProducts[firstIndex]["description"]
                              //         as String,
                              price:
                                  "\$${categoryProducts[firstIndex]["price"]}",
                            ),
                            // Second card (check if exists)
                            if (secondIndex < categoryProducts.length)
                              ProducrCard(
                                width: 190.w,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ProductDetails(
                                        productId:
                                            categoryProducts[secondIndex].id,
                                      ),
                                    ),
                                  );
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (_) => ProductDetails(
                                  //       product: categoryProducts[secondIndex],
                                  //     ),
                                  //   ),
                                  // );
                                },
                                imagepath:
                                    categoryProducts[secondIndex]["image"]
                                        .toString(),

                                name:
                                    categoryProducts[secondIndex]["name"]
                                        as String,

                                // description:
                                //     categoryProducts[secondIndex]["description"]
                                //         as String,
                                price:
                                    "\$${categoryProducts[secondIndex]["price"]}",
                              ),
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
