import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/admin_card.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF004CFF),
        actionsPadding: EdgeInsets.all(16),
        title: Text("Admin Panel",
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
      body: SafeArea(child:Padding(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 25,),
      child: Column(
        children: [
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                AdminCard(icon: Icon(Icons.import_contacts), title: "ELectronics", amount: "150 available", onTap: (){}),
                SizedBox(height: 10.h,),
                  AdminCard(icon: Icon(Icons.import_contacts), title: "ELectronics", amount: "150 available", onTap: (){}),
                SizedBox(height: 10.h,),
                  AdminCard(icon: Icon(Icons.import_contacts), title: "ELectronics", amount: "150 available", onTap: (){}),
                SizedBox(height: 10.h,),
              ],
            ),
          ))

]))));
  }
}