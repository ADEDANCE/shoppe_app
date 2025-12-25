import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Color(0xFFFFFFFF),
           body: 
   Padding(
                      padding: EdgeInsets.all(16), 
                      child:  
         Column(
         mainAxisAlignment: MainAxisAlignment.center,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                        Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                                 Image.asset('assets/images/circlelogo.png'),
             //Image.asset(),
             Text("Shoppe",
             style: TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.bold,
             ),
             ),
             Text("Beautiful eCommerce UI \nKit for your online store",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400
              ),                
             ),
            
                  ] ))),

            //SizedBox(height: 60.h,),
             ElevatedButton(onPressed: (){
                                  Navigator.popAndPushNamed(context,   '/createaccount');
             }, 
              
             style: ElevatedButton.styleFrom(
   backgroundColor: Color(0xFF004CFF),
       minimumSize: Size(double.infinity, 61),
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
             ),
             child: Text("Let's get started",
             style: TextStyle(
              color: Colors.white
             ),
             ),
             
             ),
             SizedBox(height: 30,),
            Center(
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text("I already have an account"),
      SizedBox(width: 10,),
          GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context,   '/createaccount');
                  },
                  child:  Image.asset('assets/images/bluenav-btn.png', width: 30, height: 30,), 
                )
    ],
  ),
),
             SizedBox(height: 20,),
          ],
       ),
                   ),
      );
  }
}