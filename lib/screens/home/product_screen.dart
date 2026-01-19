import 'package:flutter/material.dart';
import 'package:shoppe/screens/common_widgets/product_card.dart';
import 'package:shoppe/screens/mock_product.dart';

class ProductScreen extends StatelessWidget {
  final String categoryId;
  final String categoryName;
  const ProductScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final categoryProducts = products
        .where((product) => product["categoryId"] == categoryId)
        .toList();
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
                    child: Image.asset("assets/images/Clothinggrid1.png"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
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
                          width: 150,
                          onTap: () {},
                          imagepath: categoryProducts[firstIndex]["image"]
                              .toString(),
                          name: categoryProducts[firstIndex]["name"] as String,
                          price: "\$${categoryProducts[firstIndex]["price"]}",
                        ),
                        // Second card (check if exists)
                        if (secondIndex < categoryProducts.length)
                          ProducrCard(
                            width: 150,
                            onTap: () {},
                            imagepath: categoryProducts[secondIndex]["image"]
                                .toString(),

                            name:
                                categoryProducts[secondIndex]["name"] as String,

                            price:
                                "\$${categoryProducts[secondIndex]["price"]}",
                          ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
