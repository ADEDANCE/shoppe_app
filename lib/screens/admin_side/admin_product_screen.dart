import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/admin_side/add_product.dart';
import 'package:shoppe/screens/admin_side/edit_product.dart';
import 'package:shoppe/screens/common_widgets/admin_card.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/user_side/services/product_categories.dart';

class AdminProductScreen extends StatefulWidget {
  const AdminProductScreen({super.key});

  @override
  State<AdminProductScreen> createState() => _AdminProductScreenState();
}

class _AdminProductScreenState extends State<AdminProductScreen> {
  final FirestoreService service = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF004CFF),
        iconTheme: IconThemeData(color: Colors.white),
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
                    stream: service.getProducts(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final categoryproducts = snapshot.data!.docs;
                      return Column(
                        children: List.generate(categoryproducts.length, (
                          index,
                        ) {
                          final product = categoryproducts[index];
                          final docId =
                              product.id; //  the document ID in Firestore
                          final currentName = product["name"];
                          final currentAmount = product["price"];
                          final currentImage = product["image"];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: AdminCard(
                              imagepath: product["image"],
                              title: product["name"],
                              price: Color(0xFF004CFF),
                              amount: product["price"].toString(),
                              category: product["category"],
                              onTap: () {},
                              editicon: Icon(Icons.edit_outlined),
                              editTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => EditProduct(
                                      docId: docId,
                                      name: currentName,
                                      price: currentAmount,
                                      image: currentImage,
                                    ),
                                  ),
                                );
                              },
                              deleteicon: Icon(
                                Icons.delete_outline,
                                color: Colors.redAccent,
                              ),
                              deleteTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          16.r,
                                        ),
                                      ),
                                      title: Text("Delete product"),
                                      content: Text(
                                        "Are you sure you want to delete this product?",
                                      ),
                                      actions: [
                                        ButtonWidget(
                                          text: "No",
                                          onPressed: () {
                                            Navigator.pop(
                                              context,
                                            ); // close dialog
                                          },
                                          color: Colors.green,
                                          height: 30.h,
                                          width: 100.w,
                                        ),
                                        ButtonWidget(
                                          text: "Yes",
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            try {
                                              await FirebaseFirestore.instance
                                                  .collection("products")
                                                  .doc(docId)
                                                  .delete();

                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    "product deleted",
                                                  ),
                                                ),
                                              );
                                            } catch (e) {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    "Error deleting product: $e",
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                          color: Colors.red,
                                          height: 30.h,
                                          width: 100.w,
                                        ),
                                      ],
                                    );
                                  },
                                );
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
