import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:rhvacancy/screens/authenticate/forget_password.dart';
import 'package:rhvacancy/screens/authenticate/register.dart';
import 'package:rhvacancy/screens/home/home.dart';
import 'package:rhvacancy/services/auth.dart';
import 'package:rhvacancy/shared/loading.dart';
import 'package:rhvacancy/screens/authenticate/seat.dart';

class SignIn extends StatefulWidget {
  final toggleView;
  const SignIn({Key? key, this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;
  final formkey = GlobalKey<FormState>();
  String error1 = '';

  var email = "";
  var password = "";
  String error = "";

  Future<void> _handleRefresh() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: LiquidPullToRefresh(
              onRefresh: _handleRefresh,
              child: ListView(
                children: [
                  Container(
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
                                "SIGN IN",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "sign in to continue",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
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
                                            color:
                                                Color.fromRGBO(225, 95, 27, .3),
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
                                                controller: emailController,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                decoration: InputDecoration(
                                                  hintText: "Enter Your Email",
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                  border: InputBorder.none,
                                                ),
                                                validator: (email) =>
                                                    email != null &&
                                                            !EmailValidator
                                                                .validate(email)
                                                        ? 'Enter valid Email'
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
                                                controller: passwordController,
                                                decoration: InputDecoration(
                                                  hintText: "Enter Password",
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                  border: InputBorder.none,
                                                ),
                                                obscureText: true,
                                                validator: (value) =>
                                                    value != null &&
                                                            value.length < 8
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
                                            backgroundColor: Colors.deepPurple,
                                          ),
                                          child: Text(
                                            'SIGN IN',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () async {
                                            if (formkey.currentState!
                                                .validate()) {
                                              setState(() {
                                                loading = true;
                                              });
                                              AuthService()
                                                  .signInWithEmailAndPassword(
                                                      emailController.text
                                                          .trim(),
                                                      passwordController.text)
                                                  .then((value) {
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
                                                  msg:
                                                      'INVALID USER CREDENTIALS',
                                                  backgroundColor: Colors
                                                      .deepPurpleAccent[150],
                                                );
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
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ForgetPassword(),
                                          ),
                                        );
                                      },
                                      child:
                                          Text("Forget Password? Click Here"),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Register(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                          "Don't Have an Account? Click Here"),
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
                ],
              ),
            ),
          );
  }
}
