import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shoppe/screens/common_widgets/phonefield_widget.dart';
import 'package:shoppe/screens/common_widgets/textfield.dart';

class CreateaccountScreen extends StatefulWidget {
  const CreateaccountScreen({super.key});

  @override
  State<CreateaccountScreen> createState() => _CreateaccountScreenState();
}

class _CreateaccountScreenState extends State<CreateaccountScreen> {
  final TextEditingController _emailcontroller =TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFFFF),
      body: Stack(
        children: [
  
           Positioned(
 top: -150, 
      right: 0, 
     left:-150,
    child: ClipPath(
      clipper: WaveClipperTwo(),
     
    child: 
     CircleAvatar(
      radius: 200,
     backgroundColor: Color(0xFFD9E4FF),
    ),)
  
),

         Positioned(
      top: 160, 
     left: 230, 
    //  child:  ClipPath(
      //clipper: WaveClipperOne(),
      child: 
          CircleAvatar(
                radius: 100,
                  backgroundColor: Color(0xFF004CFF),
            ),
           ),
           //),

            Padding(padding: EdgeInsets.all(16),
      child:
       Column(
        children: [
          SizedBox(height: 50,),    
          Align(
            alignment: Alignment.centerLeft,
            child:
                            Text(
            'Create\nAccount',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          ),
      //     SizedBox(height: 10,),
      //     Positioned(
      // top: -50, 
      // right: 0, 
      // left: -500,
      // child: 
      //     CircleAvatar(
      //           radius: 50,
      //             backgroundColor: Color(0xFF004CFF),
      //       ),
      //      ),
             SizedBox(height: 50,),
          Align(
            alignment: Alignment.centerLeft,
            child:        
           Image.asset('assets/images/Upload Photo.png', width: 100, height: 100, alignment: Alignment.centerLeft,),
          ),
        
          SizedBox(height: 20,),
          Textfield(controller: _emailcontroller, hintText: "Email",  ),
          SizedBox(height: 10,),
           Textfield(controller: _passwordcontroller, hintText: "Password",
            issuffixIcon: true,
           ),
            SizedBox(height: 10,),
            PhonefieldWidget(onChanged: (phone){
                // setState(() {
                //                       phonenumber = phone
                //                           .completeNumber; // Save full phone number
                //                     });
            }, controller: _phonecontroller, hintText: 'Your number'),
            Spacer(),
            ElevatedButton(onPressed: (){
              Navigator.popAndPushNamed(context, '/login');
            }, style: ElevatedButton.styleFrom(
                 backgroundColor: Color(0xFF004CFF),
       minimumSize: Size(double.infinity, 61),
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
            ) ,child: Text("Done",   style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),)),
            SizedBox(height: 20,),
            Text('Cancel',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
            )
        ],
      ), ),
        ],
      
      ),
       
    );
  }
}