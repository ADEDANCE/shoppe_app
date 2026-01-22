import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/delivery_type.dart';
import 'package:shoppe/screens/common_widgets/review_widget.dart';

int selectedIndex = 1;
int quantity = 0;
int selecteddelivery = 0;

class ProductDetails extends StatefulWidget {
  final Map product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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

  Widget _quantityButton(String text, VoidCallback onPressed) {
    // final bool isSelected = selectedIndex == index;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(10.w, 20.h),
        backgroundColor: Color(0xFFE5EBFC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        side: BorderSide(width: 2, color: Color(0xFF004CFF)),
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
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity, //  full screen width
                  height: 500.h,
                  child: Image.asset(
                    widget.product['image'],
                    fit: BoxFit.cover,
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
                        "\$${widget.product["price"]}",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        widget.product['description'],
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quantity",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _quantityButton('-', () {
                                setState(() {
                                  if (quantity > 1) {
                                    quantity = quantity - 1;
                                  }
                                });
                              }),
                              SizedBox(width: 8.w),
                              Container(
                                width: 74.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE5EBFC),
                                  borderRadius: BorderRadius.circular(10.r),
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
                              _quantityButton('+', () {
                                setState(() {
                                  quantity = quantity + 1;
                                });
                              }),
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
                      ButtonWidget(
                        text: "View All Reviews",
                        onPressed: () {},
                        color: Color(0XFF004CFF),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
