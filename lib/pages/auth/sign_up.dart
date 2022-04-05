import 'package:flutter/material.dart';
import 'package:upm_mii/constants/app_color.dart';
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff243E82),
              Color(0xff00AAE0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/logo.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'InsureME',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      '"To save you in time of need"',
                      style: TextStyle(
                        color: Colors.white,
                        //fontWeight: FontWeight.,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const SizedBox(height: 5),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: Style.formStyle(
                        icon: Icons.person_outline, hintText: 'Username'),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: Style.formStyle(
                        icon: Icons.email_outlined, hintText: 'Email'),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: Style.formStyle(
                        icon: Icons.lock_outline, hintText: 'Password'),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: Style.formStyle(
                        icon: Icons.lock_outline, hintText: 'Confirm Password'),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'home');
                      },
                      style: Style.buttonStyle(color: AppColor.primary),
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
