import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/textfield.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController _cardholder = TextEditingController();
  final TextEditingController _cardnumber = TextEditingController();
  final TextEditingController _cardvalid = TextEditingController();
  final TextEditingController _cardcvv = TextEditingController();
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
                  "Settings",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Payment Methods",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Row(
                children: [
                  Image.asset("assets/images/Card.png", width: 335.w),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.all(20),

                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Add Card",
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Card Holder",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Textfield(
                                  controller: _cardholder,
                                  hintText: "Required",
                                ),
                                SizedBox(height: 20.h),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Card Number",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Textfield(
                                  controller: _cardnumber,
                                  hintText: "Required",
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Valid",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 190.w),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "CVV",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 180.w,
                                      child: Textfield(
                                        controller: _cardvalid,
                                        hintText: "Required",
                                      ),
                                    ),

                                    SizedBox(
                                      width: 180.w,
                                      child: Textfield(
                                        controller: _cardcvv,
                                        hintText: "Required",
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                ButtonWidget(
                                  text: "Save Changes",
                                  onPressed: () {},
                                  color: Color(0xFF004CFF),
                                  height: 40.h,
                                  width: double.infinity,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset("assets/images/addcard.png"),
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
