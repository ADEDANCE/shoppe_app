import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/preview_image.dart';
import 'package:shoppe/screens/common_widgets/textfield.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
//import 'dart:convert';

class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _amountcontroller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<File> _selectedImages = [];

  Future<String> uploadToCloudinary(File image) async {
    final url = Uri.parse(
      "https://api.cloudinary.com/v1_1/dbiiblk01/image/upload",
    );

    var request = http.MultipartRequest("POST", url);
    request.fields["upload_preset"] = "shopee";

    request.files.add(await http.MultipartFile.fromPath("file", image.path));

    var response = await request.send();
    var responseData = await response.stream.bytesToString();

    final jsonData = jsonDecode(responseData);

    return jsonData["secure_url"];
  }

  Future<List<String>> uploadAllImages() async {
    List<String> urls = [];

    for (File image in _selectedImages) {
      String url = await uploadToCloudinary(image);
      urls.add(url);
    }

    return urls;
  }

  Future<void> saveCategory() async {
    if (_namecontroller.text.isEmpty ||
        _amountcontroller.text.isEmpty ||
        _selectedImages.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Fill all fields")));
      return;
    }

    try {
      // upload images first
      List<String> imageUrls = await uploadAllImages();

      // send to firestore
      await FirebaseFirestore.instance.collection("categories").add({
        "name": _namecontroller.text,
        "amount": int.parse(_amountcontroller.text),
        "images": imageUrls,
        "createdAt": Timestamp.now(),
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Category saved")));

      setState(() {
        _selectedImages.clear();
        _namecontroller.clear();
        _amountcontroller.clear();
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
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
                        controller: _namecontroller,
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
                      Textfield(controller: _amountcontroller, hintText: "0"),

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
                                PreviewImage(
                                  child: _selectedImages.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          child: Image.file(
                                            _selectedImages[0],
                                            width: 120,
                                            height: 120,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Icon(Icons.image_outlined),
                                ),
                                SizedBox(width: 8),
                                PreviewImage(
                                  child: _selectedImages.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          child: Image.file(
                                            _selectedImages[1],
                                            width: 120,
                                            height: 120,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Icon(Icons.image_outlined),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PreviewImage(
                                  child: _selectedImages.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          child: Image.file(
                                            _selectedImages[2],
                                            width: 120,
                                            height: 120,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Icon(Icons.image_outlined),
                                ),
                                SizedBox(width: 8),
                                PreviewImage(
                                  child: _selectedImages.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          child: Image.file(
                                            _selectedImages[3],
                                            width: 120,
                                            height: 120,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Icon(Icons.image_outlined),
                                ),
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
                onPressed: saveCategory,
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
