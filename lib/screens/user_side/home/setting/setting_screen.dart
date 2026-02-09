import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/dropdown_row.dart';
import 'package:shoppe/screens/home/setting/about_us_screen.dart';
import 'package:shoppe/screens/home/setting/add_card_screen.dart';
import 'package:shoppe/screens/home/setting/language_screen.dart';
import 'package:shoppe/screens/home/setting/profile_setting_screen.dart';
import 'package:shoppe/screens/home/setting/shippingaddress_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Settings",
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Personal",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  DropdownRow(
                    title: "Profile",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProfileSettingScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                  DropdownRow(
                    title: "Shipping Address",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ShippingaddressScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                  DropdownRow(
                    title: "Payment methods",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AddCardScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Shop",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  DropdownRow(
                    title: "Country",
                    subtitle: 'Vietnam',
                    onTap: () {},
                  ),
                  SizedBox(height: 30.h),
                  DropdownRow(
                    title: "Currency",
                    subtitle: '\$USD',
                    onTap: () {},
                  ),
                  SizedBox(height: 30.h),
                  DropdownRow(title: "Sizes", subtitle: 'UK', onTap: () {}),
                  SizedBox(height: 30.h),
                  DropdownRow(title: "Terms and Conditions", onTap: () {}),
                  SizedBox(height: 30.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Personal",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  DropdownRow(
                    title: "Language",
                    subtitle: 'English',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LanguageScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                  DropdownRow(
                    title: "About Shoppe",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AboutUsScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 50.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Color(0xFFFFFFFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),

                              child: SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        "assets/images/bluenav-btn.png",
                                        width: 40.w,
                                        height: 40.h,
                                      ),
                                      Text(
                                        textAlign: TextAlign.center,
                                        "You are going to delete your account",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        textAlign: TextAlign.center,
                                        "You won't be able to restore your data",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 140.w,
                                            child: ButtonWidget(
                                              text: "Cancel",
                                              onPressed: () {},
                                              textcolor: Colors.white,
                                              color: Colors.black,
                                              height: 40.h,
                                              width: double.infinity,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 140.w,
                                            child: ButtonWidget(
                                              text: "Delete",
                                              onPressed: () {},
                                              textcolor: Colors.white,
                                              color: Colors.redAccent,
                                              height: 40.h,
                                              width: double.infinity,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        "Delete My Account",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
