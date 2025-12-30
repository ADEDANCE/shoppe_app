import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String imagepath;
  final Color cardcolor;
  final Color circlecolor1;
  final Color circlecolor2;
  const CarouselCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagepath,
    required this.cardcolor,
    required this.circlecolor1,
    required this.circlecolor2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias, // Prevents children from overflowing
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: cardcolor,
      child: Stack(
        children: [
          Positioned(
            top: 50,
            left: -20,
            child: CircleAvatar(radius: 50, backgroundColor: circlecolor1),
          ),
          Positioned(
            top: 15,
            left: 280,
            child: CircleAvatar(radius: 70, backgroundColor: circlecolor2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // LEFT SIDE: TEXTS
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        //'New Arrivals',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        subtitle,
                        // 'Premium Sneakers',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(height: 6),
                      Text(
                        description,
                        //  'Up to 30% off today',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // RIGHT SIDE: IMAGE
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(12),
              //   child:
              Padding(
                padding: EdgeInsets.only(right: 40),
                child: Image.asset(
                  imagepath,
                  //   'assets/images/baglogo.png',
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
              //  ),
            ],
          ),
        ],
      ),
    );
  }
}
