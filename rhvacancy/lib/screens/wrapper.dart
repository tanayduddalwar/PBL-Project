import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhvacancy/models/user.dart';

import 'package:rhvacancy/screens/authenticate/sign_in.dart';
import 'package:rhvacancy/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);

    // return either home or authenticate widget
    if (user == null) {
      return SignIn();
    } else {
      return Home();
    }
  }
}
