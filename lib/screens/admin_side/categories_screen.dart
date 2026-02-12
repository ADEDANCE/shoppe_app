import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/admin_side/add_categories.dart';
import 'package:shoppe/screens/admin_side/edit_categories.dart';
import 'package:shoppe/screens/common_widgets/admin_card.dart';
import 'package:shoppe/screens/user_side/services/product_categories.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final FirestoreService service = FirestoreService();
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
                  child: StreamBuilder<QuerySnapshot>(
                    stream: service.getCategories(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final categories = snapshot.data!.docs;
                      return Column(
                        children: List.generate(categories.length, (index) {
                          final category = categories[index];
                          final docId =
                              category.id; //  the document ID in Firestore
                          final currentName = category["name"];
                          final currentAmount = category["amount"];
                          final currentImages = List<String>.from(
                            category["images"],
                          );
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: AdminCard(
                              icon: Icon(Icons.import_contacts),
                              title:
                                  category["name"], // dynamically from Firestore
                              amount:
                                  "${category["amount"]} available", // dynamically
                              onTap: () {},
                              editicon: Icon(Icons.edit_outlined),
                              editTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => EditCategories(
                                      docId: docId,
                                      name: currentName,
                                      amount: currentAmount,
                                      images: currentImages,
                                    ),
                                  ),
                                );
                              },
                              deleteicon: Icon(Icons.delete_outline),
                              deleteTap: () async {
                                try {
                                  await FirebaseFirestore.instance
                                      .collection("categories")
                                      .doc(docId)
                                      .delete();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Category deleted")),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Error deleting category: $e",
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AddCategories()),
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
