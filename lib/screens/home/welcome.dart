import 'package:flutter/material.dart';
import 'package:rhvacancy/screens/authenticate/sign_in.dart';
import 'package:rhvacancy/screens/home/home.dart';
import 'package:rhvacancy/screens/wrapper.dart';

class WELCOME extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            textAlign: TextAlign.center,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepPurple,
        ),
        body: Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  "WELCOME TO READING HALL SEAT VACANCY MANAGEMENT APP",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Image.asset(
                  "assets/images/book.jpeg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Text("Admin Sign Up")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Wrapper()));
                    },
                    child: Text("Student Sign up"))
              ],
            ),
          ),
        ));
  }
}
