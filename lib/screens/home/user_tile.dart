import 'package:flutter/material.dart';
import 'package:rhvacancy/models/user.dart';

class UserTile extends StatelessWidget {
  // const UserTile({super.key});

  final UserMode? user;
  UserTile({this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.deepPurpleAccent,
          ),
          title: Text(user!.firstname!),
          subtitle: Text(user!.pictid!),
        ),
      ),
    );
  }
}
