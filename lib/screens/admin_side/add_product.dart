import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/preview_image.dart';
import 'package:shoppe/screens/common_widgets/textfield.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _amountcontroller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  String? selectedValue;

  final List<String> options = ["Option 1", "Option 2", "Option 3"];

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF004CFF),
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
                      DropdownButtonFormField<String>(
                        value: selectedValue,
                        hint: Text("Select an option"),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                        ),
                        items: options.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
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
                        child: PreviewImage(
                          child: _selectedImage == null
                              ? Icon(Icons.image_outlined)
                              : Image.file(_selectedImage!),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonWidget(
                text: "Save Product",
                onPressed: () {},
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
