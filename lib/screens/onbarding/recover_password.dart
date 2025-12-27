import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/password_box.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final List<TextEditingController> _recovercontrollers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _recoverfocusnode = List.generate(
    4,
    (index) => FocusNode(),
  );
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
                    top: 170,
                    right: 150,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child: Image.asset('assets/images/profileimage.png'),
                    ),
                  ),
                  Positioned(
                    top: 260,
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
                          'Enter 4-digits code we sent you \n on your phone number',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          '+98*******00',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // SizedBox(height: 10.h),
                        // Positioned(
                        //   left: 20,
                        //   right: 20,
                        //   child:
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            PasswordBox(
              controllers: _recovercontrollers,
              focusNodes: _recoverfocusnode,
              pinLength: 4,
            ),
            SizedBox(height: 135.h),
            Padding(
              padding: EdgeInsets.all(16),
              child: ButtonWidget(
                text: 'Send Again',
                color: Color(0xFFFF5790),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/resetpassword');
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
