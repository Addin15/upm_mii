import 'package:flutter/material.dart';
import 'package:upm_mii/pages/auth/sign_in.dart';
import 'package:upm_mii/pages/auth/sign_up.dart';

import 'pages/nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPM MII',
      debugShowCheckedModeBanner: false,
      routes: {
        'signin': (context) => const SignIn(),
        'signup': (context) => const SignUp(),
        'home': (context) => const Nav(),
      },
      initialRoute: 'signin',
    );
  }
}
