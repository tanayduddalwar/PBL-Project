import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:rhvacancy/main.dart';
import 'package:rhvacancy/screens/wrapper.dart';

class Splashscreen extends StatefulWidget {
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Wrapper(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: Center(
          child: Text(
            "READVAC",
            textAlign: TextAlign.center, // Align text at the center
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ));
  }
}
