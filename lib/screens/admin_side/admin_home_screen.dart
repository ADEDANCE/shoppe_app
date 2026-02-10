import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/admin_side/admin_product_screen.dart';
import 'package:shoppe/screens/admin_side/categories_screen.dart';
import 'package:shoppe/screens/common_widgets/admin_card.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF004CFF),
        actionsPadding: EdgeInsets.all(16),
        title: Text("Admin Panel", style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 25),
          child: Column(
            children: [
              AdminCard(
                icon: Icon(Icons.gif_box_outlined),
                title: "Manage Categories",
                amount: "3 items",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CategoriesScreen()),
                  );
                },
              ),
              SizedBox(height: 10.h),
              AdminCard(
                icon: Icon(Icons.wallet_giftcard_outlined),
                title: "Manage Products",
                amount: "4 items",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AdminProductScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
