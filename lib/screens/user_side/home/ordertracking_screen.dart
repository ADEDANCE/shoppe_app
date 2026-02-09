import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shoppe/screens/common_widgets/button_widget.dart';

class OrdertrackingScreen extends StatefulWidget {
  const OrdertrackingScreen({super.key});

  @override
  State<OrdertrackingScreen> createState() => _OrdertrackingScreenState();
}

class _OrdertrackingScreenState extends State<OrdertrackingScreen> {
  final List<String> steps = [
    "Parked",
    "On the Way to Logistic Facility",
    "Arrived at Logistic Facility",
    "Shipped",
    "Out for Delivery",
    "Delivered",
  ];

  final List<String> times = [
    "April, 19 12:31",
    "April, 19 12:34",
    "April, 19 12:40",
    "April, 19 12:55",
    "April, 19 13:10",
    "April, 19 13:30",
  ];

  final List<String> description = [
    "Your parcel is packed and will be handed over to our delivery partner.",
    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.",
    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.",
    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.",
    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.",
    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.",
  ];

  int currentStep = 0;
  Timer? timer;
  bool deliveryFailed = true;
  bool retried = false;

  @override
  void initState() {
    super.initState();
    startTracking();
  }

  void startTracking() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentStep < steps.length) {
        setState(() {
          currentStep++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  // Color progressColor() {
  //   if (retried) return Colors.green;
  //   if (deliveryFailed) return Colors.red;
  //   return Colors.blue;
  // }

  double progressValue() {
    if (retried) return 1;
    return currentStep / (steps.length + 1);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Tracking")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// PROGRESS BAR
                LinearProgressIndicator(
                  value: currentStep / steps.length,
                  minHeight: 6,
                  backgroundColor: Colors.grey.shade300,
                  color: currentStep >= steps.length
                      ? Colors.green
                      : Colors.blue,
                ),
                const SizedBox(height: 30),

                /// STATUS LIST (shows one after another)
                Column(
                  children: [
                    ...List.generate(currentStep, (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  steps[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  times[index],
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            Text(
                              description[index],
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      );
                    }),

                    currentStep >= steps.length
                        ? GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    padding: const EdgeInsets.all(20),

                                    width: double.infinity,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Delivery was not successful",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "What should I do?",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Don't worry, we will shortly contact you to arrangemore suitable time for the delivery. You can also contact us by using this number +00 000 000 000 or chat with our customer care service",
                                        ),
                                        SizedBox(height: 10),
                                        ButtonWidget(
                                          text: "Chat Now",
                                          onPressed: () {},
                                          color: Color(0xFF004CFF),
                                          height: 40,
                                          width: double.infinity,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Attempt to deliver your parcel was not successful",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Want to Reschedule Delivery?",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
