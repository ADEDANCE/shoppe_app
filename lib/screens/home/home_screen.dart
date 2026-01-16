import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/carousel_card.dart';
import 'package:shoppe/screens/common_widgets/categories_card.dart';
import 'package:shoppe/screens/common_widgets/producr_card.dart';
import 'package:shoppe/screens/common_widgets/product_circle.dart';

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

  final List<Widget> newitems = [
    ProducrCard(
      width: 150,
      onTap: () {},
      imagepath: 'assets/images/Clothinggrid1.png',
      description: 'Red T-Shirt',
      price: '17,00',
    ),
    ProducrCard(
      width: 150,
      onTap: () {},
      imagepath: 'assets/images/Clothinggrid2.png',
      description: 'Blue Jeans',
      price: '25,000',
    ),
    ProducrCard(
      width: 150,
      onTap: () {},
      imagepath: 'assets/images/Clothinggrid3.png',

      description: 'Sneakers',
      price: '30,000',
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

              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/bluenav-btn.png',
                          width: 30.w,
                          height: 30.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoriesCard(
                    images: [
                      'assets/images/Clothinggrid1.png',
                      'assets/images/Clothinggrid2.png',
                      'assets/images/Clothinggrid3.png',
                      'assets/images/Clothinggrid4.png',
                    ],
                    category: 'Clothing',
                    productnum: '109',
                    onTap: () {},
                  ),
                  CategoriesCard(
                    images: [
                      'assets/images/Clothinggrid1.png',
                      'assets/images/Clothinggrid2.png',
                      'assets/images/Clothinggrid3.png',
                      'assets/images/Clothinggrid4.png',
                    ],
                    category: 'Shoes',
                    productnum: '530',
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoriesCard(
                    images: [
                      'assets/images/Clothinggrid1.png',
                      'assets/images/Clothinggrid2.png',
                      'assets/images/Clothinggrid3.png',
                      'assets/images/Clothinggrid4.png',
                    ],
                    category: 'Bags',
                    productnum: '87',
                    onTap: () {},
                  ),
                  CategoriesCard(
                    images: [
                      'assets/images/Clothinggrid1.png',
                      'assets/images/Clothinggrid2.png',
                      'assets/images/Clothinggrid3.png',
                      'assets/images/Clothinggrid4.png',
                    ],
                    category: 'Lingerie',
                    productnum: '218',
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoriesCard(
                    images: [
                      'assets/images/Clothinggrid1.png',
                      'assets/images/Clothinggrid2.png',
                      'assets/images/Clothinggrid3.png',
                      'assets/images/Clothinggrid4.png',
                    ],
                    category: 'Watch',
                    productnum: '109',
                    onTap: () {},
                  ),
                  CategoriesCard(
                    images: [
                      'assets/images/Clothinggrid1.png',
                      'assets/images/Clothinggrid2.png',
                      'assets/images/Clothinggrid3.png',
                      'assets/images/Clothinggrid4.png',
                    ],
                    category: 'Hoodies',
                    productnum: '219',
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Top Products',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductCircle(
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid1.png',
                  ),
                  ProductCircle(
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid1.png',
                  ),
                  ProductCircle(
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid1.png',
                  ),
                  ProductCircle(
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid1.png',
                  ),
                  ProductCircle(
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid1.png',
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Items',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/bluenav-btn.png',
                          width: 30.w,
                          height: 30.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              SizedBox(
                height: 200, // REQUIRED for horizontal scroll
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: newitems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: newitems[index],
                    );
                  },
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Flash Sale',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/bluenav-btn.png',
                          width: 30.w,
                          height: 30.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  ProducrCard(
                    width: 100,
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid2.png',
                  ),
                  SizedBox(width: 15.w),
                  ProducrCard(
                    width: 100,
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid1.png',
                  ),
                  SizedBox(width: 15.w),
                  ProducrCard(
                    width: 100,
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid4.png',
                  ),
                  SizedBox(width: 15.w),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  ProducrCard(
                    width: 100,
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid1.png',
                  ),
                  SizedBox(width: 15.w),
                  ProducrCard(
                    width: 100,
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid4.png',
                  ),
                  SizedBox(width: 15.w),
                  ProducrCard(
                    width: 100,
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid3.png',
                  ),
                  SizedBox(width: 15.w),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
