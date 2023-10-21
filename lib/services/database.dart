import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rhvacancy/models/user.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  //ref
  final CollectionReference userModel =
      FirebaseFirestore.instance.collection('UserModel');

  Future updateUserData(
    String? firstname,
    String? lastname,
    String? pictid,
    String? email,
    String? uid,
  ) async {
    return await userModel.doc(uid).set({
      'firstname': firstname,
      'lastname': lastname,
      'pictid': pictid,
      'email': email,
      'uid': uid,
    });
  }

  // userlist from snapshot
  List<UserMode> _userListFromSnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((d) {
        return UserMode(
          firstname: d.get("firstname") ?? "",
          lastname: d.get("lastname") ?? "0",
          pictid: d.get("pictid") ?? '',
        );
      }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      firstname: snapshot.get('firstname'),
      lastname: snapshot.get('lastname'),
      pictid: snapshot.get('pictid'),
    );
  }
  //stream

  Stream<List<UserMode>?> get UserModel {
    return userModel.snapshots().map(_userListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userModel.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
