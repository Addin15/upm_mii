import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email'),
          TextFormField(),
          const SizedBox(height: 10),
          Text('Password'),
          TextFormField(),
          TextButton(onPressed: () {}, child: Text('Login')),
        ],
      ),
    );
  }
}
