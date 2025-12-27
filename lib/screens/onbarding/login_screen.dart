import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final TextEditingController _emailcontroller =TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
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
              ],
            ),
          ),

          //         Spacer(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //SizedBox(height: ,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        'Good to see you back!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Textfield(controller: _emailcontroller, hintText: "Email"),

                SizedBox(height: 30),
                ButtonWidget(
                  text: 'Next',
                  color: Color(0xFF004CFF),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/password');
                  },
                ),
                Text(
                  'Cancel',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
