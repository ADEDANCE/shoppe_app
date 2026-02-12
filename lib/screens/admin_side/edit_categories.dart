import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/preview_image.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shoppe/screens/common_widgets/textfield.dart';

class EditCategories extends StatefulWidget {
  final String docId; // Firestore document ID
  final String name;
  final int amount;
  final List<String> images; // current imag
  const EditCategories({
    super.key,
    required this.docId,
    required this.name,
    required this.amount,
    required this.images,
  });

  @override
  State<EditCategories> createState() => _EditCategoriesState();
}

class _EditCategoriesState extends State<EditCategories> {
  final ImagePicker _picker = ImagePicker();
  late TextEditingController nameController;
  late TextEditingController amountController;
  late List<String> currentImages; // store current image URLs
  List<File> _selectedImages = [];

  Widget buildImagePreview(int index) {
    if (_selectedImages.length > index) {
      // show new picked local image
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.file(
          _selectedImages[index],
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      );
    } else if (currentImages.length > index) {
      // show existing network image
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          currentImages[index],
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Icon(Icons.image_outlined);
    }
  }

  Future<void> updateCategory() async {
    try {
      // If you allow changing images, upload new images to Cloudinary first
      List<String> imageUrls =
          currentImages; // use updated list if new images are picked

      await FirebaseFirestore.instance
          .collection("categories")
          .doc(widget.docId)
          .update({
            "name": nameController.text,
            "amount": int.parse(amountController.text),
            "images": imageUrls,
            "updatedAt": Timestamp.now(),
          });
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Category updated")));

      Navigator.pop(context); // go back to admin dashboard
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error updating category: $e")));
    }
  }

  Future<void> pickImage() async {
    final List<XFile> images = await _picker.pickMultiImage();

    if (images.isNotEmpty) {
      setState(() {
        _selectedImages = images
            .take(4) // limit to 4 images
            .map((x) => File(x.path))
            .toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    amountController = TextEditingController(text: widget.amount.toString());
    currentImages = List.from(widget.images); // clone the list
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF004CFF),
        iconTheme: IconThemeData(color: Colors.white),
        actionsPadding: EdgeInsets.all(16),
        title: Text("Add Category", style: TextStyle(color: Colors.white)),
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Category Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Textfield(
                        controller: nameController,
                        hintText: "e.g. Electronic",
                      ),
                      SizedBox(height: 30.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Available Amount",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Textfield(controller: amountController, hintText: "0"),

                      SizedBox(height: 30.h),
                      Text(
                        _selectedImages.isNotEmpty
                            ? "Preview"
                            : "Select images",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      GestureDetector(
                        onTap: pickImage,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PreviewImage(child: buildImagePreview(0)),
                                SizedBox(width: 8),
                                PreviewImage(child: buildImagePreview(1)),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PreviewImage(child: buildImagePreview(2)),
                                SizedBox(width: 8),
                                PreviewImage(child: buildImagePreview(3)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonWidget(
                text: "Save Category",
                onPressed: updateCategory,
                color: Color(0xFF004CFF),
                height: 60.h,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
