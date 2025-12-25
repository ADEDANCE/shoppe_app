import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool isObscure = true;
String pin = "";
  String displayChar(int index) {
  if (index >= pin.length) return '';
  return isObscure ? '●' : pin[index];
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(16),
          child:      Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: List.generate(6, (index) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue),
      ),
      alignment: Alignment.center,
      child: Text(
       displayChar(index),
        style: TextStyle(fontSize: 20),
      ),
    );
  }),
),
          ),
     TextField(
  keyboardType: TextInputType.number,
  maxLength: 6,
  onChanged: (value) {
    setState(() {
      pin = value;
    });
  },
  decoration: InputDecoration(
    counterText: '',
    border: InputBorder.none,
  ),
)


        ])
    );
  }
}