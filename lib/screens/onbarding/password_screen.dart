import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/admin_side/admin_home_screen.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/loading_dailog.dart';
import 'package:shoppe/screens/common_widgets/password_box.dart';
import 'package:shoppe/screens/user_side/home/home_nav.dart';

class PasswordScreen extends StatefulWidget {
  final String email;
  final String imageUrl;
  final String userName;
  const PasswordScreen({
    super.key,
    required this.email,
    required this.imageUrl,
    required this.userName,
  });

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final List<TextEditingController> passwordControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> passwordfocuNode = List.generate(
    6,
    (index) => FocusNode(),
  );
  bool isObscure = true;
  String pin = "";
  int pinLength = 6;
  String displayChar(int index) {
    if (index >= pin.length) return '';
    return isObscure ? '●' : pin[index];
  }

  Future<void> login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: widget.email,
      password: passwordControllers.join().trim(),
    );
  }

  void showErrorDialog(String message, VoidCallback onRetry) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                onRetry();
              },
              child: const Text("Retry"),
            ),
          ],
        );
      },
    );
  }

  Future<void> handlelogin() async {
    try {
      showLoadingDialog(context);
      await login();
      if (!mounted) return;
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeNav()));
    } catch (e) {
      if (!mounted) return;

      Navigator.pop(context);
      showErrorDialog("Signup failed.\n${e.toString()}", () {
        Navigator.pop(context);
      });
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HomeNav(),
        // AdminHomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: -100,
                  right: 70,
                  left: -150,
                  child: ClipPath(
                    clipper: WaveClipperTwo(),

                    child: CircleAvatar(
                      radius: 200,

                      backgroundColor: Color(0xFFD9E4FF),
                    ),
                  ),
                ),

                Positioned(
                  top: -40,
                  // right: 180,
                  left: -90,
                  child: CircleAvatar(
                    radius: 140,
                    backgroundColor: Color(0xFF004CFF),
                  ),
                ),
                Positioned(
                  top: 200,
                  right: 140,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Image.network(widget.imageUrl),
                  ),
                ),
                Positioned(
                  top: 290,

                  right: 80,
                  child: Text(
                    "Hello, ",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 340,

                  right: 90,
                  child: Text(
                    "Type your password",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),

                // Positioned(
                //   bottom: 40,
                //   // right: 60,
                //   child:
                // ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                PasswordBox(
                  controllers: passwordControllers,
                  focusNodes: passwordfocuNode,
                ),
                SizedBox(height: 150.h),

                ButtonWidget(
                  width: double.infinity,
                  height: 61,
                  text: 'Next',
                  color: Color(0xFF004CFF),
                  onPressed: () async {},
                ),

                SizedBox(height: 50),
                //Spacer(),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Not you?",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.popAndPushNamed(context, '/forgetpassword');
                        },
                        child: Image.asset(
                          'assets/images/bluenav-btn.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
