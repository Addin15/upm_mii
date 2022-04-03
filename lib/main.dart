import 'package:flutter/material.dart';
import 'package:upm_mii/pages/auth/sign_in.dart';

import 'pages/home.dart';

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
      home: const SignIn(),
    );
  }
}
