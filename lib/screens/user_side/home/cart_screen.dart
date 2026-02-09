import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/info_container.dart';
import 'package:shoppe/screens/common_widgets/product_card.dart';
import 'package:shoppe/screens/common_widgets/quantity_button.dart';
import 'package:shoppe/screens/user_side/home/payment_screen.dart';

int quantity = 1;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Cart",
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 228, 243, 248),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Text(
                              "2",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      InfoContainer(
                        title: "Shipping Address",
                        details:
                            "26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city",
                        onPressed: () {},
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          ProducrCard(
                            width: 160.w,
                            onTap: () {},
                            imagepath: "assets/images/shoes.png",
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Lorem ipsum dolor sit  amet consectetur..",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "\$${1700}",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                      width: 54.w,
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
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          ProducrCard(
                            width: 160.w,
                            onTap: () {},
                            imagepath: "assets/images/Bag2.png",
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Lorem ipsum dolor sit  amet consectetur..",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "\$${1700}",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                      width: 54.w,
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "\$${1700}",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ButtonWidget(
                    text: "Checkout",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PaymentScreen()),
                      );
                    },
                    color: Color(0xFF004CFF),
                    height: 40.h,
                    width: 128.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
