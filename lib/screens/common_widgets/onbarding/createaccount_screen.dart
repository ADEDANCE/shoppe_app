import 'package:flutter/material.dart';

class CreateaccountScreen extends StatefulWidget {
  const CreateaccountScreen({super.key});

  @override
  State<CreateaccountScreen> createState() => _CreateaccountScreenState();
}

class _CreateaccountScreenState extends State<CreateaccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text(
            'Create\nAccount',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
           SizedBox(height: 50,),
           Image.asset('assets/images/circlelogo.png', width: 100, height: 100,), 
          SizedBox(height: 20,),
          TextFormField(
           // canRequestFocus: ,
            onChanged: (value) {
              
            },
            decoration: InputDecoration(
              // hintStyle: 
            ),
          )
        ],
      ),
      )
    );
  }
}