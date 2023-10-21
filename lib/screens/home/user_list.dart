import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rhvacancy/models/user.dart';
import 'package:rhvacancy/screens/home/user_tile.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final usermodel = Provider.of<List<UserMode>>(context) ?? [];
    if (usermodel != null) {
      usermodel.forEach((usermode) {
        print('this is usermodels');
        print(usermode!.firstname);
        print(usermode.lastname);
        print(usermode.pictid);
      });
    }
    return ListView.builder(
      itemCount: usermodel.length,
      itemBuilder: (context, index) {
        return UserTile(user: usermodel[index]);
      },
    );
  }
}
