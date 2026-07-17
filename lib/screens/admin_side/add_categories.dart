import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/preview_image.dart';
import 'package:shoppe/screens/common_widgets/textfield.dart';
import 'dart:typed_data';
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
  List<XFile> _selectedImages = [];
  // send images to cloudinary and return url
  Future<String> uploadToCloudinary(XFile image) async {
    // Cloudinary upload endpoint
    final url = Uri.parse(
      "https://api.cloudinary.com/v1_1/dbiiblk01/image/upload",
    );

    var request = http.MultipartRequest("POST", url);
    //permission to upload without login
    request.fields["upload_preset"] = "shopee";

    Uint8List bytes = await image.readAsBytes();

    request.files.add(
      http.MultipartFile.fromBytes("file", bytes, filename: image.name),
    );

    var response = await request.send();
    //Converts server response into readable text
    var responseData = await response.stream.bytesToString();

    final jsonData = jsonDecode(responseData);

    return jsonData["secure_url"];
  }

  Future<List<String>> uploadAllImages() async {
    List<String> urls = [];
    //Loops through each selected image
    for (XFile image in _selectedImages) {
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
      showLoadingDialog();
      // upload images first
      List<String> imageUrls = await uploadAllImages();

      // send to firestore
      await FirebaseFirestore.instance.collection("categories").add({
        "name": _namecontroller.text,
        "amount": int.parse(_amountcontroller.text),
        "images": imageUrls,
        "createdAt": Timestamp.now(),
      });
      hideLoadingDialog();
      if (!mounted) return;

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
      hideLoadingDialog();
    }
  }

  Future<void> pickImage() async {
    final List<XFile> images = await _picker.pickMultiImage();

    if (images.isNotEmpty) {
      setState(() {
        _selectedImages = images.take(4).toList();
      });
    }
  }

  void showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text("Uploading..."),
            ],
          ),
        );
      },
    );
  }

  void hideLoadingDialog() {
    Navigator.of(context).pop();
  }

  // reusable image preview widget
  Widget previewSelectedImage(int index) {
    if (_selectedImages.length <= index) {
      return const Icon(Icons.image_outlined);
    }

    XFile image = _selectedImages[index];

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: FutureBuilder<Uint8List>(
        future: image.readAsBytes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (!snapshot.hasData) {
            return const Icon(Icons.error);
          }

          return Image.memory(
            snapshot.data!,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          );
        },
      ),
    );
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
                                PreviewImage(child: previewSelectedImage(0)),
                                SizedBox(width: 8),
                                // PreviewImage(
                                //   child: _selectedImages.length > 1
                                //       ? ClipRRect(
                                //           borderRadius: BorderRadius.circular(
                                //             16,
                                //           ),
                                //           child: PreviewImage(
                                //             child: previewSelectedImage(1),
                                //           ),
                                //         )
                                //       : Icon(Icons.image_outlined),
                                // ),
                                PreviewImage(child: previewSelectedImage(1)),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PreviewImage(child: previewSelectedImage(2)),
                                SizedBox(width: 8),
                                PreviewImage(child: previewSelectedImage(3)),
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
