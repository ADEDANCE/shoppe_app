import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final String amount;
  final VoidCallback onTap;
  const AdminCard({super.key,
  required this.icon,
  required this.title,
  required this.amount,
  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap: onTap, child: Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Color(0xFFD9E4FF),
                borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white
                  ),
                  child: icon,
                  // Icon(Icons.grid_4x4),
                ),
                SizedBox(width: 15.w,),
                Column(
                 // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                        child: Text(
                          amount,
                          
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                    ),
                    ),
                    ),

                  ],
                )
              ],
            ),
    ));
  }
}