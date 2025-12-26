import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/circlecheckbox_widget.dart';

enum Method { sms, email }

Method? selectedMethod;

class ForgetpasswordScreen extends StatefulWidget {
  const ForgetpasswordScreen({super.key});

  @override
  State<ForgetpasswordScreen> createState() => _ForgetpasswordScreenState();
}

class _ForgetpasswordScreenState extends State<ForgetpasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: -80,
                    left: 130,
                    right: -150,
                    //   child: ClipPath(
                    //   clipper: WaveClipperOne(),
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Color(0xFFD9E4FF),
                    ),
                    // ),
                  ),

                  Positioned(
                    top: -40,
                    right: -90,
                    //left: -90,
                    child: CircleAvatar(
                      radius: 120,
                      backgroundColor: Color(0xFF004CFF),
                    ),
                  ),
                  Positioned(
                    top: 190,
                    right: 150,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child: Image.asset('assets/images/profileimage.png'),
                    ),
                  ),
                  Positioned(
                    top: 290,
                    right: 50,
                    child: Column(
                      children: [
                        Text(
                          'Password Recovery',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          'How you would like to restore \nyour password?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        RadioGroup<Method>(
                          groupValue: selectedMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedMethod = value;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 200.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  color: Color(0xFFE5EBFC),
                                ),

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("SMS"),
                                    Radio<Method>(
                                      value: Method.sms,
                                      activeColor: Color(0xFF004CFF),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Container(
                                width: 200.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  color: Color(0xFFF8CECE),
                                ),

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Email"),
                                    Radio<Method>(
                                      value: Method.email,
                                      activeColor: Color(0xFF004CFF),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: ButtonWidget(
                text: 'Next',
                color: Color(0xFF004CFF),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/recoverpassword');
                },
              ),
            ),

            SizedBox(height: 25.h),
            Text(
              "Cancel",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 35.h),
          ],
        ),
      ),
    );
  }
}
