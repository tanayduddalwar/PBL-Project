import 'package:flutter/material.dart';
import 'package:rhvacancy/screens/authenticate/sign_in.dart';
import 'dart:math';
import 'package:rhvacancy/services/auth.dart';


class RandomNumberPage extends StatefulWidget {
  @override
  _RandomNumberPageState createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  Random _random = Random();
  int _minRange = 1;
  int _maxRange = 100;
  late int _randomNumber;

  void generateRandomNumber() {
    setState(() {
      _randomNumber = _random.nextInt(_maxRange - _minRange + 1) + _minRange;
    });
  }

  @override
  void initState() {
    generateRandomNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vacancy Position'),
        backgroundColor: Colors.deepPurple[300],
        actions: <Widget>[
          ElevatedButton.icon(
            icon: Icon(Icons.person),
            label: Text("Logout"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>SignIn()),
              );
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Random Number:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              '$_randomNumber',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
