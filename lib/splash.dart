import 'dart:async';

import 'package:flutflix2/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  Timer(Duration(seconds:2), () {
    Navigator.pushReplacement(context,
       MaterialPageRoute(builder: (context)=>Home(),));
    
  });
    
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Text('flutflex',
          style: TextStyle(
            fontSize: 34,
            color: Colors.red,
          ),),
        ),
      ),
    );
  }
}
