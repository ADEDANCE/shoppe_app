import 'package:flutter/material.dart';
import 'package:shoppe/screens/onbarding/start.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   @override
  void initState() {
    // goHome();
    super.initState();
    goHome();
  }

  void goHome() async {
    await Future.delayed(const Duration(seconds: 1) );
     if (!mounted) return;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Start() ));
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(
  child:
         Column(
         mainAxisAlignment: MainAxisAlignment.center,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Image.asset('assets/images/circlelogo.png'),
             //Image.asset(),
             Text("Shoppe",
             style: TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.bold,
             ),
             )
          ],
        ),
      ),
    );
  }
}