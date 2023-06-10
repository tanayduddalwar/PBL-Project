import 'package:flutter/material.dart';

import 'main.dart';

class Intropage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Intro",textAlign: TextAlign.center,),
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          child: Column(
            children:[
              Text(
                "WELCOME TO READING HALL SEAT VACANCY MANAGEMENT APP",
                style: TextStyle(
                  fontSize: 30,
                  color: Color.lerp(a, b, t),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
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

