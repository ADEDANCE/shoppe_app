import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/carousel_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> slides = [
    CarouselCard(
      title: 'New Arrivals',
      subtitle: 'Premium Sneakers',
      description: 'Up to 30% off today',
      cardcolor: Color(0xFFF1B11C),
      imagepath: 'assets/images/carouselimg1.png',
      circlecolor1: Color(0xFFFFD471),
      circlecolor2: Color(0xFFFFD471),
    ),
    CarouselCard(
      title: 'New Arrivals',
      subtitle: 'Premium Sneakers',
      description: 'Up to 30% off today',
      cardcolor: Color(0xFFF1B11C),
      imagepath: 'assets/images/carouselimg2.png',
      circlecolor1: Color(0xFFFFD471),
      circlecolor2: Color(0xFFFFD471),
    ),
    CarouselCard(
      title: 'New Arrivals',
      subtitle: 'Premium Sneakers',
      description: 'Up to 30% off today',
      cardcolor: Color(0xFFF1B11C),
      imagepath: 'assets/images/carouselimg3.png',
      circlecolor1: Color(0xFFFFD471),
      circlecolor2: Color(0xFFFFD471),
    ),
    CarouselCard(
      title: 'New Arrivals',
      subtitle: 'Premium Sneakers',
      description: 'Up to 30% off today',
      cardcolor: Color(0xFFF1B11C),
      imagepath: 'assets/images/carouselimg4.png',
      circlecolor1: Color(0xFFFFD471),
      circlecolor2: Color(0xFFFFD471),
    ),
    CarouselCard(
      title: 'New Arrivals',
      subtitle: 'Premium Sneakers',
      description: 'Up to 30% off today',
      cardcolor: Color(0xFFF1B11C),
      imagepath: 'assets/images/carouselimg5.jpg',
      circlecolor1: Color(0xFFFFD471),
      circlecolor2: Color(0xFFFFD471),
    ),
    CarouselCard(
      title: 'New Arrivals',
      subtitle: 'Premium Sneakers',
      description: 'Up to 30% off today',
      cardcolor: Color(0xFFF1B11C),
      imagepath: 'assets/images/carouselimg6.png',
      circlecolor1: Color(0xFFFFD471),
      circlecolor2: Color(0xFFFFD471),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),

      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //  CAROUSEL
              CarouselSlider(
                items: slides,
                options: CarouselOptions(
                  height: 170.h,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 12),

              //  DOT INDICATOR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(slides.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentIndex == index ? 14 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? Colors.blue
                          : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ),
              Center(
                child: Text(
                  'Home Content Here',
                  style: TextStyle(fontSize: 22),
                ),
              ),

              SizedBox(height: 50),
              SizedBox(
                width: 200,
                child: InkWell(
                  onTap: () {
                    //debugPrint('Card tapped');
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 6,
                            children: [
                              Image.asset('assets/images/carouselimg6.png'),
                              Image.asset('assets/images/carouselimg6.png'),
                              Image.asset('assets/images/carouselimg6.png'),
                              Image.asset('assets/images/carouselimg6.png'),
                              // _imageItem(),
                              // _imageItem(),
                              // _imageItem(),
                              // _imageItem(),
                            ],
                          ),
                          SizedBox(height: 12),

                          // 🔹 TEXT ROW
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Summer',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '12 items',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
