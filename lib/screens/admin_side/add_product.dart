import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/textfield.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _amountcontroller = TextEditingController();
  final TextEditingController _categorycontroller = TextEditingController();
  final TextEditingController _descriptioncontroller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  String? selectedValue;

  final List<String> options = ["Clothing", "Bag", "Shoe"];

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

  void hideLoadingDialog() {}

  Future<void> saveProduct() async {
    if (_namecontroller.text.isEmpty ||
        _amountcontroller.text.isEmpty ||
        _categorycontroller.text.isEmpty ||
        _descriptioncontroller.text.isEmpty ||
        _selectedImage == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Fill all fields")));
      return;
    }
    try {
      showLoadingDialog();
      // upload images first
      String imageUrl = await uploadToCloudinary(_selectedImage!);
      await FirebaseFirestore.instance.collection("products").add({
        "name": _namecontroller.text,
        "price": int.parse(_amountcontroller.text),
        "category": _categorycontroller.text,
        "description": _descriptioncontroller.text,
        "image": imageUrl,
        "keywords": buildSearchKeywords(_namecontroller.text),
        "createdAt": Timestamp.now(),
      });

      //  await Future.delayed(const Duration(milliseconds: 100));
      if (!mounted) return;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Product saved")));

      setState(() {
        _selectedImage = null;
        _namecontroller.clear();
        _amountcontroller.clear();
        _categorycontroller.clear();
        _descriptioncontroller.clear();
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
      hideLoadingDialog();
    }
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = image;
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
        title: Text("Add Product", style: TextStyle(color: Colors.white)),
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
                          "Product Name",
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
                        hintText: "e.g. Gucci Bag",
                      ),
                      SizedBox(height: 30.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Price (\$)",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Textfield(
                        controller: _amountcontroller,
                        hintText: "0.00",
                      ),

                      SizedBox(height: 30.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Category",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      Textfield(
                        controller: _categorycontroller,
                        hintText: "e.g Bag",
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        _selectedImage == null ? "select simage" : "Preview",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 30.h),

                      GestureDetector(
                        onTap: pickImage,
                        child: _selectedImage == null
                            ? const Icon(Icons.image_outlined)
                            : FutureBuilder<Uint8List>(
                                future: _selectedImage!.readAsBytes(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
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
                      ),
                      SizedBox(height: 30.h),
                      TextField(
                        maxLines: 5,
                        minLines: 3,
                        controller: _descriptioncontroller,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Enter description...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
              ButtonWidget(
                text: "Save Product",
                onPressed: saveProduct,
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
