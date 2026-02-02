import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/dropdown_row.dart';
import 'package:shoppe/screens/home/setting/add_card_screen.dart';
import 'package:shoppe/screens/home/setting/profile_setting_screen.dart';

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
                  DropdownRow(title: "Shipping Address", onTap: () {}),
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
                    onTap: () {},
                  ),
                  SizedBox(height: 30.h),
                  DropdownRow(title: "About Slada", onTap: () {}),
                  SizedBox(height: 50.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {},
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
