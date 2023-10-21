import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rhvacancy/models/user.dart';
import 'package:rhvacancy/screens/authenticate/sign_in.dart';
import 'package:rhvacancy/screens/home/settings_form.dart';
import 'package:rhvacancy/screens/home/user_list.dart';
import 'package:rhvacancy/services/auth.dart';
import 'package:rhvacancy/services/database.dart';
import "package:rhvacancy/screens/authenticate/seat.dart";

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserMode userModel = UserMode();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: SettingsForm(),
          );
        },
      );
    }

    return StreamProvider<List<UserMode>?>.value(
      initialData: null,
      value: DatabaseService().UserModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            textAlign: TextAlign.center,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepPurple,
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async {
                await AuthService().signOut().then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                });
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                'Sign Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                _showSettingsPanel();
              },
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              label: Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              UserList(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RandomNumberScreen()));
                },
                child: Text("Proceed"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
