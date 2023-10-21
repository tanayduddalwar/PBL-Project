import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:rhvacancy/main.dart';
import 'package:rhvacancy/screens/wrapper.dart';
import "package:rhvacancy/screens/home/welcome.dart";

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
          builder: (context) => WELCOME(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            "READVAC",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
