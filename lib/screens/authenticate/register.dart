import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rhvacancy/models/user.dart';
import 'package:rhvacancy/screens/authenticate/sign_in.dart';
import 'package:rhvacancy/screens/home/home.dart';
import 'package:rhvacancy/services/auth.dart';
import 'package:rhvacancy/shared/loading.dart';
import "package:rhvacancy/screens/authenticate/seat.dart";

class Register extends StatefulWidget {
  final toggleView;

  const Register({Key? key, this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpassword = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final pictid = TextEditingController();

  bool loading = false;

  String passworderror = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.deepPurple,
                    Colors.white,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "SIGN UP",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "WELCOME TO VACSEAT",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10),
                                    )
                                  ],
                                ),
                                child: Form(
                                  key: formkey,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: emailController,
                                          decoration: InputDecoration(
                                            hintText: "Enter Your Email",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.deepOrange,
                                                width: 2,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.blueAccent,
                                                width: 2,
                                              ),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.book_online_rounded,
                                              ),
                                              onPressed: () {},
                                            ),
                                            prefixIcon: Icon(Icons.email),
                                          ),
                                          validator: (email) => email != null &&
                                                  !EmailValidator.validate(
                                                      email)
                                              ? 'Enter a valid email'
                                              : null,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.name,
                                          controller: firstname,
                                          decoration: InputDecoration(
                                            hintText: "First Name",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.deepOrange,
                                                width: 2,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.deepPurpleAccent,
                                                width: 2,
                                              ),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.book_rounded,
                                              ),
                                              onPressed: () {},
                                            ),
                                            prefixIcon: Icon(
                                                Icons.people_outline_rounded),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.name,
                                          controller: lastname,
                                          decoration: InputDecoration(
                                            hintText: "Last Name",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.deepOrange,
                                                width: 2,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.deepPurpleAccent,
                                                width: 2,
                                              ),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.book_rounded,
                                              ),
                                              onPressed: () {},
                                            ),
                                            prefixIcon: Icon(
                                                Icons.people_outline_rounded),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: pictid,
                                          decoration: InputDecoration(
                                            hintText: "PICT Unique ID",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.deepOrange,
                                                width: 2,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.deepPurpleAccent,
                                                width: 2,
                                              ),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.book_online_rounded,
                                              ),
                                              onPressed: () {},
                                            ),
                                            prefixIcon: Icon(
                                                Icons.people_outline_rounded),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          controller: passwordController,
                                          obscureText: true,
                                          obscuringCharacter: "*",
                                          decoration: InputDecoration(
                                            hintText: "Enter a password",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.deepOrange,
                                                width: 2,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.deepPurpleAccent,
                                                width: 2,
                                              ),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.book_online_rounded,
                                              ),
                                              onPressed: () {},
                                            ),
                                            prefixIcon: Icon(Icons.password),
                                          ),
                                          validator: (value) => value != null &&
                                                  value.length < 8
                                              ? 'Enter password at least 8 characters'
                                              : null,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        child: TextFormField(
                                          obscureText: true,
                                          controller: cpassword,
                                          decoration: InputDecoration(
                                            hintText: "Confirm Your Password",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.deepOrange,
                                                width: 2,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.blueAccent,
                                                width: 2,
                                              ),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.book_online_rounded,
                                              ),
                                              onPressed: () {},
                                            ),
                                            prefixIcon: Icon(Icons.password),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepPurple,
                                    ),
                                    onPressed: () async {
                                      if (passwordController.text.trim() !=
                                          cpassword.text.trim()) {
                                        setState(() => passworderror =
                                            "Passwords don't match");
                                      } else {
                                        if (formkey.currentState!.validate()) {
                                          setState(() {
                                            loading = true;
                                          });
                                          AuthService()
                                              .registerWithEmailAndPassword(
                                                  emailController.text.trim(),
                                                  passwordController.text)
                                              .then((value) {
                                            postDetailsToFirestore();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    RandomNumberScreen(),
                                              ),
                                            );
                                          }).catchError((e) {
                                            setState(() {
                                              loading = false;
                                            });
                                            Fluttertoast.showToast(
                                              msg: 'USER ALREADY EXISTS',
                                              backgroundColor:
                                                  Colors.deepPurpleAccent[150],
                                            );
                                          });
                                        }
                                      }
                                    },
                                    child: Text('SIGN UP'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                passworderror,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignIn(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Already Have an Account? Click Here",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser!;

    UserMode userModel = UserMode();

    userModel.email = user.email;
    userModel.firstname = firstname.text;
    userModel.lastname = lastname.text;
    userModel.pictid = pictid.text;
    userModel.uid = user.uid;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
  }
}