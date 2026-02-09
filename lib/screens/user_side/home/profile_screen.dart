import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/product_circle.dart';
import 'package:shoppe/screens/common_widgets/selection_button.dart';
import 'package:shoppe/screens/user_side/home/setting/setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        child: CircleAvatar(
                          radius: 20, // image size
                          backgroundImage: AssetImage(
                            'assets/images/Clothinggrid1.png',
                          ),
                        ),
                      ),
                      SizedBox(width: 10.h),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF004CFF),
                          minimumSize: Size(90, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Text(
                          'My Activity',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 15,
                          child: Image.asset(
                            'assets/images/Clothinggrid1.png',
                            width: 15.w,
                            height: 15.h,
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 15,
                          child: Image.asset(
                            'assets/images/Clothinggrid1.png',
                            width: 15.w,
                            height: 15.h,
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SettingScreen()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 15,
                          child: Image.asset(
                            'assets/images/Clothinggrid1.png',
                            width: 15.w,
                            height: 15.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hello, Romina!",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Announcement",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas hendrerit luctus libero ac vulputate.",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recently viewed",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductCircle(
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid1.png',
                  ),
                  ProductCircle(
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid1.png',
                  ),
                  ProductCircle(
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid1.png',
                  ),
                  ProductCircle(
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid1.png',
                  ),
                  ProductCircle(
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid1.png',
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "My Orders",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 13.h),
              Row(
                children: [
                  SelectionButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    text: 'To Recieve',
                    width: 50.w,
                    height: 25.h,
                    bordercolor: selectedIndex == 0
                        ? Color(0xFF004CFF)
                        : Colors.transparent,
                    color: Color(0xFFF9F9F9),
                  ),
                  SizedBox(width: 50.w),
                  SelectionButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    text: 'To Pay',
                    width: 50.w,
                    height: 25.h,
                    bordercolor: selectedIndex == 1
                        ? Color(0xFF004CFF)
                        : Colors.transparent,
                    color: Color(0xFFF9F9F9),
                  ),
                ],
              ),
              //  selectedIndex == 0 ?
            ],
          ),
        ),
      ),
    );
  }
}
