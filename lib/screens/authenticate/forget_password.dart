import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rhvacancy/screens/authenticate/sign_in.dart';
import 'package:rhvacancy/shared/loading.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  bool loading = false;
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
                          "Reset Password",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "enter email id to continue",
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
                                                bottom: BorderSide(
                                                    color: Colors.grey))),
                                        child: TextFormField(
                                          controller: emailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              hintText: "Enter Your Email",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              border: InputBorder.none),
                                          validator: (email) => email != null &&
                                                  !EmailValidator.validate(
                                                      email)
                                              ? 'Enter valid Email'
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
                                      backgroundColor: Colors.deepPurple,
                                    ),
                                    child: Text(
                                      'RESET PASSWORD',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () async {
                                      if (formkey.currentState!.validate()) {
                                        setState(() {
                                          loading = true;
                                        });
                                        FirebaseAuth.instance
                                            .sendPasswordResetEmail(
                                                email:
                                                    emailController.text.trim())
                                            .then((value) {
                                          Fluttertoast.showToast(
                                            msg: 'EMAIL SENT!',
                                          );
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignIn()));
                                        }).catchError((e) {
                                          setState(() {
                                            loading = false;
                                          });
                                          Fluttertoast.showToast(
                                            msg: 'NO SUCH USER EXISTS',
                                          );
                                        });
                                      }
                                    },
                                  ),
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
}
