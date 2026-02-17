import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? fillColor;
  final Function(String)? onChanged;
  final int? maxLength;

  // final Widget?  suffixIcon;
  final bool issuffixIcon;
  const Textfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.fillColor,
    this.issuffixIcon = false,
    this.onChanged,
    this.maxLength,
  });

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      obscureText: widget.issuffixIcon ? _isObscure : false,
      decoration: InputDecoration(
        hintText: widget.hintText,

        filled: true,
        fillColor: widget.fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),

        suffixIcon: widget.issuffixIcon
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.remove_red_eye,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : null, // only show if isPassword is true
      ),
    );
  }
}
