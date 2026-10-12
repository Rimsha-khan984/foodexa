import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodexa/main.dart';
import 'package:google_fonts/google_fonts.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
void initState(){
  super.initState();

  Timer(const Duration(seconds: 4) ,(){
   Navigator.pushReplacement(
       context, MaterialPageRoute(
     builder: (context) => mainPage(),)
   );

  });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color:Color.fromARGB(218, 4, 151, 9),
        ),
        child: Stack(
         children: [
           Center(
           child: Text(
             "Foodexa",
             style: GoogleFonts.lobster(
               color: Colors.white,
               fontWeight: FontWeight.w500,
               fontSize: 48,

             ),),
           ),

          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Image.asset('assets/images/Grocery1.png',height: 300,),
          )

         ],

        ),
      ),
    );
  }
}
