import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/delivery_type.dart';
import 'package:shoppe/screens/common_widgets/info_container.dart';
import 'package:shoppe/screens/common_widgets/product_circle.dart';
import 'package:shoppe/screens/common_widgets/purchase_index.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selecteddelivery = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Payment",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              InfoContainer(
                title: "Shipping Address",
                details:
                    "26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city",
                onPressed: () {},
              ),
              SizedBox(height: 10.h),
              InfoContainer(
                title: "Shipping Address",
                details:
                    "26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city",
                onPressed: () {},
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      PurchaseIndex(),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  ButtonWidget(
                    text: "Add Voucher",
                    textcolor: Color(0xFF004BFE),
                    onPressed: () {},
                    color: Color(0xFFFFFFFF),
                    height: 40.h,
                    width: 120.w,
                    bordercolor: Color(0xFF004BFE),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          ProductCircle(
                            backgroundradius: 40,
                            radius: 30,
                            imagepath: "assets/images/shoes.png",
                            onTap: () {},
                          ),
                          Positioned(left: 60, top: 20, child: PurchaseIndex()),
                        ],
                      ),
                      SizedBox(width: 5.w),
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur.",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Text(
                    "\$${1700}",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          ProductCircle(
                            backgroundradius: 40,
                            radius: 30,
                            imagepath: "assets/images/Bag2.png",
                            onTap: () {},
                          ),
                          Positioned(left: 60, top: 20, child: PurchaseIndex()),
                        ],
                      ),
                      SizedBox(width: 5.w),
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur.",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Text(
                    "\$${1700}",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Shipping Options",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
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

                title: "Express",
                duration: "1-2 days",
                price: "\$12,00",
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment Method",
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset("assets/images/bluenav-btn.png"),
                  ),
                ],
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
