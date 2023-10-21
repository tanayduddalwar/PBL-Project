import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var email = '';
  var password = '';
  var cpassword = '';
  var id = '';

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
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Enter Your Email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                  onChanged: (val) {
                                    setState(() => email = val);
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
                                  decoration: InputDecoration(
                                      hintText: "PICT Unique ID",
                                      hintStyle: TextStyle(color: Colors.grey),
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
                                  decoration: InputDecoration(
                                      hintText: "Enter a password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                  onChanged: (val) {
                                    setState(() => password = val);
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
                                  decoration: InputDecoration(
                                      hintText: "Confirm Your Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                  onChanged: (val) {
                                    setState(() => cpassword = val);
                                  },
                                ),
                              ),
                            ],
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
                              onPressed: () {},
                              child: Text('SIGN UP'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () {},
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
