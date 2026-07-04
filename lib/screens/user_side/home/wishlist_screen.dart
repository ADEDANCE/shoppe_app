import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/product_card.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Wishlist"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProducrCard(
                    width: 185.w,
                    onTap: () {},
                    imagepath: "assets/images/shoes.png",
                    description: "Lorem ipsum dolor sit  amet consectetur..",
                  ),

                  ProducrCard(
                    width: 185.w,
                    onTap: () {},
                    imagepath: "assets/images/shoes.png",
                    description: "Lorem ipsum dolor sit  amet consectetur..",
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
