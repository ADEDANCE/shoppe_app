import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/textfield.dart';

class ResetpasswordScreen extends StatefulWidget {
  const ResetpasswordScreen({super.key});

  @override
  State<ResetpasswordScreen> createState() => _ResetpasswordScreenState();
}

class _ResetpasswordScreenState extends State<ResetpasswordScreen> {
  final TextEditingController _newpascontroller = TextEditingController();
  final TextEditingController _Repascontroller = TextEditingController();

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
                    right: 40,
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
                          'Please, setup a new password for \nyour account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Textfield(
                    controller: _newpascontroller,
                    hintText: 'New Password',
                  ),
                  SizedBox(height: 15.h),
                  Textfield(
                    controller: _Repascontroller,
                    hintText: 'Repeat Password',
                  ),
                  SizedBox(height: 70.h),
                  ButtonWidget(
                    text: 'Save',
                    color: Color(0xFF004CFF),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '');
                    },
                  ),
                ],
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
