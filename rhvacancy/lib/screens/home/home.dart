import 'dart:async';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rhvacancy/models/user.dart';
import 'package:rhvacancy/screens/authenticate/sign_in.dart';
import "package:rhvacancy/screens/vacancy.dart";

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserModel userModel = UserModel();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('UserModel')
        .doc((user!.uid))
        .get()
        .then((value) {
      this.userModel = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

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
          child: Center(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    "WELCOME TO READING HALL SEAT VACANCY MANAGEMENT APP",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text("${userModel.firstname} ${userModel.lastname}",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  SizedBox(height: 15),
                  const Text(
                    'signed in as',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  Text('${userModel.email}'),
                  SizedBox(
                    height: 15,
                  ),
                  Text('your pict id is : ${userModel.pictid}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),

                  // Image.asset("assets/images/reading-logo-5.jpg"),
                  ElevatedButton(
                    onPressed: () async {
                      FirebaseAuth.instance.signOut().then(
                        (value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        },
                      );
                    },
                    child: Text("SIGN OUT"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RandomNumberPage()));
                      },
                      child: Text("Continue"))
                ],
              ),
            ),
          ),
        ));
  }
}
