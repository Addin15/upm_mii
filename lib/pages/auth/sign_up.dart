import 'package:flutter/material.dart';
import 'package:upm_mii/constants/style.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Name'),
                  const SizedBox(height: 5),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: Style.formStyle(icon: Icons.person_outline),
                  ),
                  const SizedBox(height: 10),
                  const Text('Email'),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: Style.formStyle(icon: Icons.email_outlined),
                  ),
                  const SizedBox(height: 10),
                  const Text('Password'),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: Style.formStyle(icon: Icons.lock_outline),
                  ),
                  const SizedBox(height: 10),
                  const Text('Confirm Password'),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: Style.formStyle(icon: Icons.lock_outline),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      style: Style.buttonStyle(color: Colors.green.shade200),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.greenAccent.shade700),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 25),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'signin');
                },
                style: Style.buttonStyle(color: Colors.white),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
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
