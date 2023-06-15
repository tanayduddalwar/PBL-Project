import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rhvacancy/screens/authenticate/sign_in.dart';
// import 'package:rhvacancy/services/auth.dart';

class Home extends StatelessWidget {
  // final AuthService _auth = AuthService();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Text(
                "WELCOME, TO READING HALL SEAT VACANCY MANAGEMENT APP",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const Text('signed in as'),
              SizedBox(height: 8),
              Text(
                user.email!,
              ),
              // Image.asset("assets/images/reading-logo-5.jpg"),
              ElevatedButton(
                onPressed: () async {
                  FirebaseAuth.instance.signOut().then(
                    (value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                  );
                },
                child: Text("SIGN OUT"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
