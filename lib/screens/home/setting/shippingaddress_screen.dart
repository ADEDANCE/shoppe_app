import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/button_widget.dart';
import 'package:shoppe/screens/common_widgets/textfield.dart';

class ShippingaddressScreen extends StatefulWidget {
  const ShippingaddressScreen({super.key});

  @override
  State<ShippingaddressScreen> createState() => _ShippingaddressScreenState();
}

class _ShippingaddressScreenState extends State<ShippingaddressScreen> {
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _postcode = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  Country? selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Shipping Address",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Country",
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              selectedCountry?.name ?? "Choose your country",
                              style: TextStyle(
                                color: Color(0xFF004CFF),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true,
                                onSelect: (Country country) {
                                  setState(() {
                                    selectedCountry = country;
                                  });
                                },
                              );
                            },
                            child: Image.asset("assets/images/bluenav-btn.png"),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Textfield(controller: _address, hintText: "Required"),
                      SizedBox(height: 20.h),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Town / City",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Textfield(controller: _city, hintText: "Required"),
                      SizedBox(height: 20.h),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Postcode",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Textfield(controller: _postcode, hintText: "Required"),
                      SizedBox(height: 20.h),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Phone Number",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Textfield(controller: _phonenumber, hintText: "Required"),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
              ButtonWidget(
                text: "Save Changes",
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
