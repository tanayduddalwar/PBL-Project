import 'package:flutter/material.dart';

import 'main.dart';

class Intropage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Intro",textAlign:TextAlign.right),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            children:[
              Text(
                "WELCOME TO READING HALL SEAT VACANCY MANAGEMENT APP",
                style: TextStyle(
                  fontSize: 30,
                  
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset("assets/images/reading-logo-5.jpg"),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text("CLICK HERE TO CONTINUE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
