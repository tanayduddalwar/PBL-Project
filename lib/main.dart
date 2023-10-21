import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:rhvacancy/models/user.dart';
import 'package:rhvacancy/screens/splash.dart';
// import 'package:rhvacancy/screens/wrapper.dart';
import 'package:rhvacancy/services/auth.dart';
// import 'package:rhvacancy/tests/test1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserMode?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: Splashscreen(), // home means home screen
      ),
    );
  }
}
