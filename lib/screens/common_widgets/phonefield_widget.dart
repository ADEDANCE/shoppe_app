
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_intl_phone_field/phone_number.dart';


class PhonefieldWidget extends StatelessWidget {
 final  String? title;
  final  ValueChanged<PhoneNumber> onChanged;
 final TextEditingController controller;
  // final Widget enableBorder;
 final String? errorText;
 final String hintText;
  final Color ? fillColor;
  const PhonefieldWidget({super.key,
    this.title,
  required this.onChanged,
  required this.controller,
 // required this.enableBorder,
  this.errorText,
  required this.hintText,
 this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      flagsButtonPadding: EdgeInsetsGeometry.all(8),
      disableLengthCheck: true,
      controller: controller,
      initialCountryCode: 'NG',
      showDropdownIcon: true,
      dropdownIconPosition: IconPosition.trailing,
      keyboardType: TextInputType.number,
        decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: fillColor,
              enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(50),
                 borderSide: BorderSide.none
              ),
              focusedBorder:  OutlineInputBorder(
                 borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none
              ),
     ),
     onChanged: onChanged,
      );
  }
}