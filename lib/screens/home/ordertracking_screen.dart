import 'package:flutter/material.dart';
import 'dart:async';

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
  ];

  final List<String> times = [
    "April, 19 12:31",
    "April, 19 12:34",
    "April, 19 12:40",
    "April, 19 12:55",
    "April, 19 13:10",
    "April, 19 13:30",
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

  Color progressColor() {
    if (retried) return Colors.green;
    if (deliveryFailed) return Colors.red;
    return Colors.blue;
  }

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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// PROGRESS BAR
            LinearProgressIndicator(
              value: currentStep / steps.length,
              minHeight: 6,
              backgroundColor: Colors.grey.shade300,
              color: Colors.blue,
            ),
            const SizedBox(height: 30),

            /// STATUS LIST (shows one after another)
            Column(
              children: [
                ...List.generate(currentStep, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      steps[index],
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }),

                /// FAILURE STATE
                if (deliveryFailed && !retried)
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Attempt to deliver your parcel was not successful",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            retried = true;
                          });
                        },
                        child: const Text(
                          "Try again",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                /// SUCCESS AFTER RETRY
                if (retried)
                  const Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text(
                      "Delivered",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
