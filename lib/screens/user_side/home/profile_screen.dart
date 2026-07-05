import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/profile_detail.dart';
import 'package:shoppe/screens/user_side/home/setting/setting_screen.dart';
import 'package:shoppe/theme/app_colors.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shoppe/screens/common_widgets/product_circle.dart';
// import 'package:shoppe/screens/common_widgets/selection_button.dart';
// import 'package:shoppe/screens/user_side/home/setting/setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xFF004CFF),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color.fromARGB(
                                  255,
                                  77,
                                  105,
                                  170,
                                ),
                                radius: 50,
                                child: Image.asset(
                                  "assets/images/profileimage.png",
                                ),
                              ),

                              SizedBox(width: 20.w),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Alex Morgan",

                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "alex.morgan@icloud.com",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 15.h),

                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 90.w,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 64, 118, 243),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "24",

                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Orders",
                                    style: TextStyle(color: Colors.white54),
                                  ),
                                ],
                              ),

                              Container(
                                width: 1,
                                height: 40,
                                color: Colors.white54,
                              ),

                              Column(
                                children: [
                                  Text(
                                    "24",

                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Wishlist",
                                    style: TextStyle(color: Colors.white54),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25.h),

                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryWhite,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ProfileDetail(
                          icon: Icons.card_giftcard_rounded,
                          onPressed: () {},
                          title: "My orders",
                          subtitle: "12 active",
                        ),
                        SizedBox(height: 15.h),
                        ProfileDetail(
                          icon: Icons.heart_broken_rounded,
                          onPressed: () {},
                          title: "Wishlist",
                          subtitle: "18 items",
                        ),
                        SizedBox(height: 15.h),
                        ProfileDetail(
                          icon: Icons.location_on_outlined,
                          onPressed: () {},
                          title: "Saved addresses",
                          subtitle: "1 addresses",
                        ),

                        SizedBox(height: 15.h),
                        ProfileDetail(
                          icon: Icons.payment,
                          onPressed: () {},
                          title: "Payment methods",
                          subtitle: "visa",
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25.h),

                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryWhite,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ProfileDetail(
                          icon: Icons.settings,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingScreen(),
                              ),
                            );
                          },
                          title: "Settings",
                        ),
                        SizedBox(height: 15.h),
                        ProfileDetail(
                          icon: Icons.heart_broken_rounded,
                          onPressed: () {},
                          title: "Log out",
                          circlecolor: const Color.fromARGB(255, 247, 162, 155),
                          iconcolor: Colors.red,
                          textcolor: Colors.red,
                        ),
                      ],
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
