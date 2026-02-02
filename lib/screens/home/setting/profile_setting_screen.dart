import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/textfield.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Profile",
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 55,
                              child: CircleAvatar(
                                radius: 50,
                                child: Image.asset(
                                  "assets/images/profileimage.png",
                                ),
                              ),
                            ),
                            Positioned(
                              left: 70,
                              top: 5,
                              child: GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundColor: Color(0xFFFFFFFF),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Color(0xFF004BFE),
                                    foregroundColor: Color(0xFFFFFFFF),
                                    child: Icon(
                                      Icons.edit,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Textfield(controller: _controller, hintText: "Your name"),
                      SizedBox(height: 20.h),
                      Textfield(
                        controller: _email,
                        hintText: "gmail@example.com",
                      ),
                      SizedBox(height: 20.h),
                      Textfield(controller: _password, hintText: "Password"),
                    ],
                  ),
                ),
              ),
              ButtonWidget(
                text: "Save Changes",
                onPressed: () {},
                color: Color(0xFF004CFF),
                height: 60.h,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
