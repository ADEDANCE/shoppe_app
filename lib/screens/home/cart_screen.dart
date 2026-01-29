import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/product_card.dart';
import 'package:shoppe/screens/common_widgets/quantity_button.dart';

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
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 228, 243, 248),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Shipping Address",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 300.w,
                                  child: Text(
                                    textAlign: TextAlign.left,
                                    "26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),

                                GestureDetector(
                                  child: Image.asset(
                                    "assets/images/bluenav-btn.png",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                                Text(
                                  "\$${1700}",
                                  style: TextStyle(
                                    fontSize: 20.sp,
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
            ],
          ),
        ),
      ),
    );
  }
}
