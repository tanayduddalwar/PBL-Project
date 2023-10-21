import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhvacancy/models/user.dart';
import 'package:rhvacancy/services/database.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formkey = GlobalKey<FormState>();
  String? _currentfirstname;
  String? _currentlastname;
  String? _currentpictid;
  String? _currentemail;
  String? _currentuid;

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserMode?>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: userModel!.uid).userData,
        builder: (context, snapshot) {
          UserData? userData = snapshot.data;
          return Form(
            key: _formkey,
            child: Column(children: <Widget>[
              Text(
                'Update Details',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: userData!.firstname,
                decoration: InputDecoration(
                  hintText: 'enter new firstname',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (val) => val!.isEmpty ? 'please enter a name' : null,
                onChanged: (val) => setState(() => _currentfirstname = val),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: userData.lastname,
                decoration: InputDecoration(),
                validator: (val) => val!.isEmpty ? 'please enter a name' : null,
                onChanged: (val) => setState(() => _currentlastname = val),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: userData.pictid,
                decoration: InputDecoration(),
                validator: (val) => val!.isEmpty ? 'please enter id' : null,
                onChanged: (val) => setState(() => _currentpictid = val),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      await DatabaseService(uid: userModel.uid).updateUserData(
                          _currentfirstname ?? userData.firstname,
                          _currentlastname ?? userData.lastname,
                          _currentpictid ?? userData.pictid,
                          _currentemail ?? userData.email,
                          _currentuid ?? userData.uid);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ))
            ]),
          );
        });
  }
}
