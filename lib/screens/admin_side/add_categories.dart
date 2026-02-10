import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/preview_image.dart';
import 'package:shoppe/screens/common_widgets/textfield.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _amountcontroller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

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
                          "Category Name",
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
                        "Preview",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PreviewImage(
                            child: _selectedImage == null
                                ? Icon(Icons.image_outlined)
                                : Image.file(_selectedImage!),
                          ),
                          SizedBox(width: 8),
                          PreviewImage(
                            child: _selectedImage == null
                                ? Icon(Icons.image_outlined)
                                : Image.file(_selectedImage!),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PreviewImage(
                            child: _selectedImage == null
                                ? Icon(Icons.image_outlined)
                                : Image.file(_selectedImage!),
                          ),
                          SizedBox(width: 8),
                          PreviewImage(
                            child: _selectedImage == null
                                ? Icon(Icons.image_outlined)
                                : Image.file(_selectedImage!),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: pickImage,
                        child: Text("Pick Image"),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonWidget(
                text: "Save Category",
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
