import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppe/screens/common_widgets/loading_dailog.dart';
import 'package:shoppe/screens/common_widgets/phonefield_widget.dart';
import 'package:shoppe/screens/common_widgets/textfield.dart';
import 'package:shoppe/screens/onbarding/login_screen.dart';
import 'package:shoppe/screens/user_side/services/upload_image.dart';

class CreateaccountScreen extends StatefulWidget {
  const CreateaccountScreen({super.key});

  @override
  State<CreateaccountScreen> createState() => _CreateaccountScreenState();
}

class _CreateaccountScreenState extends State<CreateaccountScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? profileImage;
  bool get isFormValid {
    return _emailcontroller.text.trim().isNotEmpty &&
        _passwordcontroller.text.trim().isNotEmpty &&
        _phonecontroller.text.trim().isNotEmpty &&
        _usernamecontroller.text.trim().isNotEmpty &&
        profileImage != null;
  }

  //Listen to text changes
  @override
  void initState() {
    super.initState();

    _emailcontroller.addListener(() => setState(() {}));
    _passwordcontroller.addListener(() => setState(() {}));
    _usernamecontroller.addListener(() => setState(() {}));
    _phonecontroller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _usernamecontroller.dispose();
    _phonecontroller.dispose();
    super.dispose();
  }

  //check internet connection
  Future<bool> hasInternet() async {
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
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

  Future<void> pickImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        profileImage = File(picked.path);
      });
    }
  }

  Future<void> signUp() async {
    if (profileImage == null) return;
    //upload picture to cloudinary
    String imageUrl = await uploadToCloudinary(profileImage!);
    // Create account in authentication
    UserCredential cred = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim(),
        );
    // get the user ID
    String uid = cred.user!.uid;
    //save a user profile in Firestore:
    await FirebaseFirestore.instance.collection("users").doc(uid).set({
      "email": _emailcontroller.text.trim(),
      "phone": _phonecontroller.text.trim(),
      "userName": _usernamecontroller.text.trim(),
      "imageUrl": imageUrl,
      "role": "user",
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  Future<void> handleSignup() async {
    bool online = await hasInternet();
    if (!mounted) return;

    if (!online) {
      showErrorDialog("No internet connection", () {});
      return;
    }

    try {
      showLoadingDialog(context);

      await signUp();
      if (!mounted) return;

      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    } catch (e) {
      if (!mounted) return;

      Navigator.pop(context);
      showErrorDialog("Signup failed.\n${e.toString()}", () {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Positioned(
            top: -150,
            right: 0,
            left: -150,
            child: ClipPath(
              clipper: WaveClipperTwo(),

              child: CircleAvatar(
                radius: 200.r,
                backgroundColor: Color(0xFFD9E4FF),
              ),
            ),
          ),

          Positioned(
            top: 160,
            left: 230,
            //  child:  ClipPath(
            //clipper: WaveClipperOne(),
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Color(0xFF004CFF),
            ),
          ),

          //),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create\nAccount',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                //     SizedBox(height: 10,),
                //     Positioned(
                // top: -50,
                // right: 0,
                // left: -500,
                // child:
                //     CircleAvatar(
                //           radius: 50,
                //             backgroundColor: Color(0xFF004CFF),
                //       ),
                //      ),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: pickImage,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: profileImage != null
                        ? CircleAvatar(
                            radius: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                profileImage!,
                                width: 130,
                                //     height: 100.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Image.asset(
                            'assets/images/Upload Photo.png',
                            width: 100,
                            height: 100,
                            alignment: Alignment.centerLeft,
                          ),
                  ),
                ),
                SizedBox(height: 20),
                Textfield(controller: _emailcontroller, hintText: "Email"),
                SizedBox(height: 10),
                Textfield(
                  controller: _passwordcontroller,
                  hintText: "Password",
                  issuffixIcon: true,
                ),
                SizedBox(height: 10),
                Textfield(
                  controller: _usernamecontroller,
                  hintText: "user name",
                ),
                SizedBox(height: 10),
                PhonefieldWidget(
                  onChanged: (phone) {
                    setState(() {});
                    // setState(() {
                    //                       phonenumber = phone
                    //                           .completeNumber; // Save full phone number
                    //                     });
                  },
                  controller: _phonecontroller,
                  hintText: 'Your number',
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: isFormValid ? handleSignup : null,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFormValid
                        ? Color(0xFF004CFF)
                        : Color(0xFFD9E4FF),
                    minimumSize: Size(double.infinity, 61),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Cancel',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
