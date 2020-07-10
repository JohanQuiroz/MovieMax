import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {    
    super.initState();
    Timer(Duration(seconds: 4), ()=> Navigator.pushNamed(context, 'Builder'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  FadeIn(
        duration: Duration(seconds: 4),
        child: Center(
        child: Container(
          width: 250,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ), 
        ) 
        ),
      ),      
    );
  }  
}
