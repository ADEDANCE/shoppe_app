import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/preview_image.dart';
import 'package:shoppe/screens/common_widgets/textfield.dart';
import 'package:http/http.dart' as http;

class EditProduct extends StatefulWidget {
  final String docId; // Firestore document ID
  final String name;
  final int price;
  final String image; // current imag
  const EditProduct({
    super.key,
    required this.docId,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final ImagePicker _picker = ImagePicker();
  late TextEditingController nameController;
  late TextEditingController amountController;
  late String currentImage; // store current image URLs
  File? _selectedImage;

  Widget buildImagePreview() {
    if (_selectedImage != null) {
      // show new picked local image
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.file(
          _selectedImage!,
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      );
    } else if (currentImage.isNotEmpty) {
      // show existing network image
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          currentImage,
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Icon(Icons.image_outlined);
    }
  }

  Future<String> uploadToCloudinary(File image) async {
    // Cloudinary upload endpoint
    final url = Uri.parse(
      "https://api.cloudinary.com/v1_1/dbiiblk01/image/upload",
    );
    var request = http.MultipartRequest("POST", url);
    //permission to upload without login
    request.fields["upload_preset"] = "shopee";

    request.files.add(await http.MultipartFile.fromPath("file", image.path));
    var response = await request.send();
    //Converts server response into readable text
    var responseData = await response.stream.bytesToString();

    final jsonData = jsonDecode(responseData);

    return jsonData["secure_url"];
  }

  List<String> buildSearchKeywords(String text) {
    text = text.toLowerCase();
    List<String> keywords = [];

    String current = "";
    for (int i = 0; i < text.length; i++) {
      current += text[i];
      keywords.add(current);
    }

    return keywords;
  }

  Future<void> updateProduct() async {
    try {
      String imageUrl = currentImage;

      // if user selected new image  upload it
      if (_selectedImage != null) {
        imageUrl = await uploadToCloudinary(_selectedImage!);
      }

      await FirebaseFirestore.instance
          .collection("products")
          .doc(widget.docId)
          .update({
            "name": nameController.text,
            "price": int.parse(amountController.text),
            "image": imageUrl,
            "keywords": buildSearchKeywords(nameController.text),

            "updatedAt": Timestamp.now(),
          });

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Product updated")));

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    amountController = TextEditingController(text: widget.price.toString());
    currentImage = widget.image; // clone the list
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
        title: Text("Edit Product", style: TextStyle(color: Colors.white)),
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
                        _selectedImage != null ? "Preview" : "Select images",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      GestureDetector(
                        onTap: pickImage,
                        child: PreviewImage(child: buildImagePreview()),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonWidget(
                text: "Save Category",
                onPressed: updateProduct,
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
