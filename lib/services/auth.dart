import "package:firebase_auth/firebase_auth.dart";
import "package:rhvacancy/models/user.dart";
import "package:rhvacancy/services/database.dart";

class AuthService {
  // firebase auth object is instance of firebase auth class
  // to interact with firebase auth use this _auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebaseuser
  UserMode? userFromFirebaseUser(User? user) {
    return user != null ? UserMode(uid: user.uid) : null;
  }

//auth change user stream
  Stream<UserMode?> get user {
    return _auth
        .authStateChanges()
        // .map((User? user) => _userFromFirebaseUser(user));
        .map(userFromFirebaseUser);
  }

//sign in anon
  Future signInAnon() async {
    UserCredential result = await _auth.signInAnonymously();
    User? user = result.user;
    return userFromFirebaseUser(user);
  }

// register
  Future registerWithEmailAndPassword(email, password) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;
    await DatabaseService(uid: user!.uid)
        .updateUserData('name', 'surname', 'id', 'email', 'uid');
    return userFromFirebaseUser(user);
  }

// sign in email
  Future signInWithEmailAndPassword(email, password) async {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;
    return userFromFirebaseUser(user);
  }

// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
