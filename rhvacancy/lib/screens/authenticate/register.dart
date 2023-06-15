import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rhvacancy/screens/authenticate/sign_in.dart';
import 'package:rhvacancy/screens/home/home.dart';
// import 'package:rhvacancy/services/auth.dart';

class Register extends StatefulWidget {
  final toggleView;
  const Register({Key? key, this.toggleView}) : super(key: key);
  // const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpassword = TextEditingController();
  // String email = '';
  String password = '';
  // String cpassword = '';
  String id = '';
  String _error = '';
  String passworderror = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [Colors.orange, Colors.orange, Colors.orange],
        )),
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
                    )),
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
                                          bottom:
                                              BorderSide(color: Colors.grey))),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        hintText: "Enter Your Email",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (email) => email != null &&
                                            !EmailValidator.validate(email)
                                        ? 'Enter a valid email'
                                        : null,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey))),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "PICT Unique ID",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    onChanged: (val) {
                                      setState(() => id = val);
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey))),
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: "Enter a password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) =>
                                        value != null && value.length < 8
                                            ? 'Enter password atleast 8 chars'
                                            : null,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey))),
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: cpassword,
                                    decoration: InputDecoration(
                                        hintText: "Confirm Your Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
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
                                backgroundColor: Colors.orange,
                              ),
                              onPressed: () async {
                                if (passwordController.text.trim() !=
                                    cpassword.text.trim()) {
                                  setState(() =>
                                      passworderror = "passwords don't match");
                                } else {
                                  if (formkey.currentState!.validate()) {
                                    FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: emailController.text.trim(),
                                            password: passwordController.text)
                                        .then((value) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                    }).catchError((e) {
                                      Fluttertoast.showToast(msg: e!.message);
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
                          _error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                        Text(
                          passworderror,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: Text("Already Have an Account? Click Here"),
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
}
