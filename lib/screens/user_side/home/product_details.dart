import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/delivery_type.dart';
import 'package:shoppe/screens/common_widgets/quantity_button.dart';
import 'package:shoppe/screens/common_widgets/review_widget.dart';
import 'package:shoppe/screens/user_side/services/product_categories.dart';

int selectedIndex = 1;
int quantity = 1;
int selecteddelivery = 0;
bool isFavorite = false;

class ProductDetails extends StatefulWidget {
  final String productId;
  const ProductDetails({super.key, required this.productId});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final FirestoreService service = FirestoreService();
  Widget _selectableButton(String text, int index) {
    final bool isSelected = selectedIndex == index;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedIndex = index;
        });
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(50.w, 25.h),
        backgroundColor: Color(0xFFF9F9F9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        side: BorderSide(
          width: 2,
          color: isSelected ? Color(0xFF004CFF) : Colors.transparent,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .doc(widget.productId)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final data =
                        snapshot.data!.data()
                            as Map<String, dynamic>; // <- map of product
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity, //  full screen width
                          height: 500.h,
                          child: Image.network(
                            data["image"],
                            //       fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.h,
                            horizontal: 16.w,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "\$${data["price"]}",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                data["description"],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 10),

                              Text(
                                "Size",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _selectableButton('S', 0),
                                  _selectableButton('M', 1),
                                  _selectableButton('L', 2),
                                  _selectableButton('XL', 3),
                                  //    _SelectableButton('XXL', 4),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Quantity",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      QuantityButton(
                                        text: '-',
                                        onPressed: () {
                                          setState(() {
                                            if (quantity > 1) {
                                              quantity = quantity - 1;
                                            }
                                          });
                                        },
                                      ),
                                      SizedBox(width: 8.w),
                                      Container(
                                        width: 74.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE5EBFC),
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                          // shape: Border()
                                        ),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          quantity.toString(),
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      QuantityButton(
                                        text: '+',
                                        onPressed: () {
                                          setState(() {
                                            quantity = quantity + 1;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "Delivery",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              DeliveryType(
                                isdeliverySelected: selecteddelivery == 0,
                                onTap: () {
                                  setState(() {
                                    selecteddelivery = 0;
                                  });
                                },

                                title: "Standard",
                                duration: "5-7 days",
                                price: "\$3,00",
                              ),
                              DeliveryType(
                                isdeliverySelected: selecteddelivery == 1,
                                onTap: () {
                                  setState(() {
                                    selecteddelivery = 1;
                                  });
                                },

                                title: "Standard",
                                duration: "1-2 days",
                                price: "\$12,00",
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "Rating & Reviews",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ReviewWidget(),
                              SizedBox(height: 25.h),
                              ButtonWidget(
                                width: double.infinity,
                                height: 45,
                                text: "View All Reviews",
                                onPressed: () {},
                                color: Color(0XFF004CFF),
                              ),
                              //   SizedBox(height: 25.h),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 25,
                      color: isFavorite ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),

                  ButtonWidget(
                    width: 128.w,
                    height: 58.h,
                    text: "Add to cart",
                    onPressed: () {},
                    color: Color(0XFF000000),
                  ),
                  ButtonWidget(
                    width: 160.w,
                    height: 60.h,
                    text: "Buy now",
                    onPressed: () {},
                    color: Color(0XFF004CFF),
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
