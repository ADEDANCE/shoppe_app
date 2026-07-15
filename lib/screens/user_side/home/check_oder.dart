import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/delivery_type.dart';
import 'package:shoppe/screens/common_widgets/info_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shoppe/screens/user_side/services/api_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckOder extends StatefulWidget {
  final String orderId;
  final double totalPrice;

  const CheckOder({super.key, required this.orderId, required this.totalPrice});

  @override
  State<CheckOder> createState() => _CheckOderState();
}

class _CheckOderState extends State<CheckOder> {
  int selecteddelivery = 0;

  final ApiService api = ApiService();

  // payment function
  Future<void> makePayment() async {
    try {
      // get the logged-in user
      final authUser = FirebaseAuth.instance.currentUser;

      // Check if the user exists
      if (authUser == null) {
        throw Exception("User not logged in");
      }

      // Get user document from Firestore
      final userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(authUser.uid)
          .get();

      if (!userDoc.exists) {
        throw Exception("User profile not found");
      }

      //  Get username from Firestore
      final userData = userDoc.data();

      final userName = userData?["userName"];

      if (userName == null) {
        throw Exception("Username not found");
      }

      final payment = await api.createPayment(
        orderId: widget.orderId,
        email: authUser.email!,
        name: userName,
      );

      // extract the payment URL
      final paymentUrl = payment["data"]["link"];

      // Convert it into a Uri
      final uri = Uri.parse(paymentUrl);

      await launchUrl(uri, mode: LaunchMode.externalApplication);

      // if (await canLaunchUrl(uri)) {
      //   // Open Flutterwave
      //   await launchUrl(uri, mode: LaunchMode.externalApplication);
      // } else {
      //   throw Exception("Unable to open payment page");
      // }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
  // void _showDialogs() async {
  //   //  Show first dialog
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false, // user cannot close it

  //     builder: (context) {
  //       return Dialog(
  //         backgroundColor: Color(0xFFFFFFFF),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(16),
  //         ),

  //         child: SizedBox(
  //           width: 300,
  //           height: 160.h,
  //           child: Padding(
  //             padding: const EdgeInsets.all(20),
  //             child: Column(
  //               children: [
  //                 Image.asset(
  //                   "assets/images/bluenav-btn.png",
  //                   width: 40.w,
  //                   height: 40.h,
  //                 ),
  //                 Text(
  //                   "Payment is in progress",
  //                   style: TextStyle(
  //                     fontSize: 20.sp,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 Text(
  //                   "Please, wait a few moments",
  //                   style: TextStyle(
  //                     fontSize: 15.sp,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );

  //   //  delayed
  //   await Future.delayed(const Duration(seconds: 5));
  //   // Safety check
  //   if (!mounted) return;

  //   //  Close first dialog
  //   Navigator.of(context).pop();

  //   //  Show second dialog
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return Dialog(
  //         backgroundColor: Color(0xFFFFFFFF),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(16),
  //         ),

  //         child: SizedBox(
  //           width: double.infinity,
  //           child: Padding(
  //             padding: const EdgeInsets.all(20),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Image.asset(
  //                   "assets/images/bluenav-btn.png",
  //                   width: 40.w,
  //                   height: 40.h,
  //                 ),
  //                 Text(
  //                   textAlign: TextAlign.center,
  //                   "We couldn't proceed \nyour payment",
  //                   style: TextStyle(
  //                     fontSize: 20.sp,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 Text(
  //                   textAlign: TextAlign.center,
  //                   "Please, change your payment method or try again",
  //                   style: TextStyle(
  //                     fontSize: 15.sp,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 ButtonWidget(
  //                   text: "Try Again",
  //                   onPressed: () {
  //                     // Safety check
  //                     if (!mounted) return;
  //                     //  Close first dialog
  //                     Navigator.of(context).pop();
  //                     showDialog(
  //                       context: context,
  //                       builder: (context) {
  //                         return Dialog(
  //                           backgroundColor: Color(0xFFFFFFFF),
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(16),
  //                           ),

  //                           child: SizedBox(
  //                             width: double.infinity,
  //                             child: Padding(
  //                               padding: const EdgeInsets.all(20),
  //                               child: Column(
  //                                 mainAxisSize: MainAxisSize.min,
  //                                 children: [
  //                                   Image.asset(
  //                                     "assets/images/bluenav-btn.png",
  //                                     width: 40.w,
  //                                     height: 40.h,
  //                                   ),
  //                                   Text(
  //                                     textAlign: TextAlign.center,
  //                                     "Done!",
  //                                     style: TextStyle(
  //                                       fontSize: 20.sp,
  //                                       fontWeight: FontWeight.bold,
  //                                     ),
  //                                   ),
  //                                   Text(
  //                                     textAlign: TextAlign.center,
  //                                     "You card has been successfully charged",
  //                                     style: TextStyle(
  //                                       fontSize: 15.sp,
  //                                       fontWeight: FontWeight.bold,
  //                                     ),
  //                                   ),
  //                                   ButtonWidget(
  //                                     text: "Track My Order",
  //                                     onPressed: () {
  //                                       Navigator.push(
  //                                         context,
  //                                         MaterialPageRoute(
  //                                           builder: (_) =>
  //                                               OrdertrackingScreen(),
  //                                         ),
  //                                       );
  //                                     },
  //                                     textcolor: Colors.black,
  //                                     color: Color(0xFFE7E8EB),
  //                                     height: 40.h,
  //                                     width: double.infinity,
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                         );
  //                       },
  //                     );
  //                   },
  //                   color: Color(0xFF000000),
  //                   height: 40.h,
  //                   width: double.infinity,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         // title: const Text("Done"),
  // content: const Text("Operation completed successfully."),
  // actions: [
  //   TextButton(
  //     onPressed: () => Navigator.of(context).pop(),
  //     child: const Text("OK"),
  //   ),
  // ],
  //   );
  // },
  // );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Payment",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InfoContainer(
                        title: "Shipping Address",
                        details:
                            "26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city",
                        onPressed: () {},
                      ),
                      SizedBox(height: 10.h),

                      Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Shipping Options",
                                style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            SizedBox(height: 10.h),

                            DeliveryType(
                              isdeliverySelected: selecteddelivery == 0,
                              onTap: () {
                                setState(() {
                                  selecteddelivery = 0;
                                });
                              },

                              title: "Standard",
                              duration: "5-7 days",
                              price: "\$3,00",
                            ),

                            SizedBox(height: 10.h),
                            DeliveryType(
                              isdeliverySelected: selecteddelivery == 1,
                              onTap: () {
                                setState(() {
                                  selecteddelivery = 1;
                                });
                              },

                              title: "Express",
                              duration: "1-2 days",
                              price: "\$12,00",
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 25.h),

                      Container(
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Order summary",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subtotal",
                                  style: TextStyle(color: Colors.black54),
                                ),

                                Text(
                                  "₦${widget.totalPrice.toStringAsFixed(2)}",
                                  style: TextStyle(color: Colors.black12),
                                ),
                              ],
                            ),

                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Shipping",
                                  style: TextStyle(color: Colors.black54),
                                ),

                                Text(
                                  "Free",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),

                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Discount",
                                  style: TextStyle(color: Colors.black54),
                                ),

                                Text(
                                  "0",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),

                            Divider(),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  "₦${widget.totalPrice.toStringAsFixed(2)}",
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "₦${widget.totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ButtonWidget(
                    text: "Pay",
                    onPressed: () async {
                      await makePayment();
                    },
                    color: Color(0xFF000000),
                    height: 50.h,
                    width: 128.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
