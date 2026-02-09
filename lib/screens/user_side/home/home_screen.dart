
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/carousel_card.dart';
import 'package:shoppe/screens/common_widgets/categories_card.dart';
import 'package:shoppe/screens/common_widgets/product_card.dart';
import 'package:shoppe/screens/common_widgets/product_circle.dart';
import 'package:shoppe/screens/home/product_screen.dart';
import 'package:shoppe/screens/home/search_screen.dart';
//import 'package:shoppe/screens/mock_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppe/services/product_categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
 final FirestoreService service = FirestoreService();
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
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 45.h),

     
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' Shop',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SearchScreen()),
                      );
                    },
                    child: Container(
                      width: 300.w,
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 10),
                          Text(
                            "Search products",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
StreamBuilder<QuerySnapshot>(
  stream: service.getCategories(), // real-time listener
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return const Center(child: CircularProgressIndicator());
    }

    final categories = snapshot.data!.docs;


            return Column(
                children: List.generate((categories.length / 2).ceil(), (
                  rowIndex,
                ) {
                  // Get the two categories for this row
                  final firstIndex = rowIndex * 2;
                  final secondIndex = firstIndex + 1;
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: 10,
                    ), // space below each row
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // First card
                        CategoriesCard(
                         images: (categories[firstIndex]["images"] as List<dynamic>)
          .whereType<String>()
          .toList(),

                     //     images: [categories[firstIndex]["image"]],


                          category: categories[firstIndex]["name"],
                          productnum:" 60",
                          //categories[firstIndex]["Availablenumber"]
                             // .toString(),
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (_) => ProductScreen(
                            //       categoryId:
                            //           categories[firstIndex]["id"],
                            //       categoryName:
                            //           categories[firstIndex]["name"] ,
                            //     ),
                            //   ),
                            // );
                          },
                        ),

                        // Second card (check if exists)
                        if (secondIndex < categories.length)
                          CategoriesCard(
                             images: (categories[firstIndex]["images"] as List<dynamic>)
          .whereType<String>()
          .toList(),

                            category: categories[secondIndex]["name"] ,
                            productnum:" 60",
                                // categories[secondIndex]["Availablenumber"]
                                //     .toString(),
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => ProductScreen(
                              //       categoryId:
                              //           categories[secondIndex]["id"] ,
                              //       categoryName:
                              //           categories[secondIndex]["name"],
                                          
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                      ],
                    ),
                  );
                }),
              );
          } ),
              
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
                  SizedBox(width: 10.w),
                  ProducrCard(
                    width: 100,
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid1.png',
                  ),
                  SizedBox(width: 10.w),
                  ProducrCard(
                    width: 100,
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid4.png',
                  ),
                  SizedBox(width: 10.w),
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
                  SizedBox(width: 10.w),
                  ProducrCard(
                    width: 100,
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid4.png',
                  ),
                  SizedBox(width: 10.w),
                  ProducrCard(
                    width: 100,
                    onTap: () {},
                    imagepath: 'assets/images/Clothinggrid3.png',
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            ],
          ),
        ),
      
    );
  }
}
