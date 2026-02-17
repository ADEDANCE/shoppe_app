import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/loading_dailog.dart';
import 'package:shoppe/screens/common_widgets/password_box.dart';
import 'package:shoppe/screens/onbarding/login_screen.dart';
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
    String password = passwordControllers.map((c) => c.text).join();

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: widget.email,
      password: password,
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
  }

  Future<void> resetPassword(String email) async {
    Navigator.of(context).pop(); // close confirm dialog

    try {
      showLoadingDialog(context);

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());

      if (!mounted) return;

      Navigator.pop(context); // close loading

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            title: Text("Password reset email sent"),
            content: Text("Check spam folder if you don’t see the email"),
            actions: [
              ButtonWidget(
                text: "Okey",
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color(0xFF004CFF),
                height: 50.h,
                width: 400.w,
              ),
            ],
          );
        },
      );
    } catch (e) {
      if (!mounted) return;

      Navigator.pop(context);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
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
                    radius: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60.r),
                      child: Image.network(
                        widget.imageUrl,
                        width: 120.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 290,

                  right: 80,
                  child: Text(
                    "Hello, ${widget.userName}",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 320,

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
                  onPressed: () async {
                    handlelogin();
                  },
                ),

                SizedBox(height: 50),
                //Spacer(),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Forget password",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                title: Text("Forget Password"),
                                content: Text(
                                  "is this your email? ${widget.email}",
                                ),
                                actions: [
                                  ButtonWidget(
                                    text: "No",
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => LoginScreen(),
                                        ),
                                      ); // close dialog
                                    },
                                    color: Colors.red,
                                    height: 30.h,
                                    width: 100.w,
                                  ),
                                  ButtonWidget(
                                    text: "Yes",
                                    onPressed: () {
                                      resetPassword(widget.email);
                                    },
                                    color: Colors.green,
                                    height: 30.h,
                                    width: 100.w,
                                  ),
                                ],
                              );
                            },
                          );
                        },

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => ForgetpasswordScreen(),
                        //   ),
                        // );
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
