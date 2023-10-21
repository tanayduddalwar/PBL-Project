// class Users {
//   final String? uid;

//   Users({this.uid});
// }

class UserMode {
  String? email;
  String? firstname;
  String? lastname;
  String? pictid;
  String? uid;

  UserMode({this.email, this.firstname, this.lastname, this.pictid, this.uid});

  // take data
  factory UserMode.fromMap(map) {
    return UserMode(
      uid: map['uid'],
      email: map['email'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      pictid: map['pictid'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'pictid': pictid,
    };
  }
}

class UserData {
  String? email;
  String? firstname;
  String? lastname;
  String? pictid;
  String? uid;

  UserData({this.email, this.firstname, this.lastname, this.pictid, this.uid});
}
