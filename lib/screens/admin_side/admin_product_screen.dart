import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/admin_side/add_product.dart';
import 'package:shoppe/screens/common_widgets/admin_card.dart';

class AdminProductScreen extends StatelessWidget {
  const AdminProductScreen({super.key});

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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AdminCard(
                        imagepath: "assets/images/Bag4.png",
                        title: "ELectronics",
                        price: Color(0xFF004CFF),
                        amount: "\$567",
                        onTap: () {},
                        editicon: Icon(Icons.edit_outlined),
                        editTap: () {},
                        deleteicon: Icon(Icons.delete_outline),
                        deleteTap: () {},
                      ),
                      SizedBox(height: 10.h),
                      AdminCard(
                        imagepath: "assets/images/Bag4.png",
                        title: "ELectronics",
                        price: Color(0xFF004CFF),
                        amount: "\$567",
                        onTap: () {},
                        editicon: Icon(Icons.edit_outlined),
                        editTap: () {},
                        deleteicon: Icon(Icons.delete_outline),
                        deleteTap: () {},
                      ),
                      SizedBox(height: 10.h),
                      AdminCard(
                        imagepath: "assets/images/Bag4.png",
                        price: Color(0xFF004CFF),
                        title: "ELectronics",
                        amount: "\$567",
                        onTap: () {},
                        editicon: Icon(Icons.edit_outlined),
                        editTap: () {},
                        deleteicon: Icon(Icons.delete_outline),
                        deleteTap: () {},
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AddProduct()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xFF004CFF),
                    child: Icon(Icons.add, color: Colors.white, size: 40),
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
