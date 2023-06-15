import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rhvacancy/screens/authenticate/register.dart';
import 'package:rhvacancy/screens/home/home.dart';
// import 'package:rhvacancy/services/auth.dart';

class SignIn extends StatefulWidget {
  final toggleView;
  const SignIn({Key? key, this.toggleView}) : super(key: key);
  // const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // instance is created to use type _auth.signinanon
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // final AuthService _auth = AuthService();
  final formkey = GlobalKey<FormState>();
  String error1 = '';

  var email = "";
  var password = "";
  String error = "";

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
                    "SIGN IN",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "sign in to continue",
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
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: "Enter Your Email",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (email) => email != null &&
                                            !EmailValidator.validate(email)
                                        ? 'Enter valid Email'
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
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        hintText: "Enter Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    obscureText: true,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) =>
                                        value != null && value.length < 8
                                            ? 'Enter valid password'
                                            : null,
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
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
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
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text("Don't Have an Account? Click Here"),
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
