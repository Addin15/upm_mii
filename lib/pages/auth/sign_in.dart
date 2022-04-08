import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:upm_mii/constants/app_color.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/controllers/auth_controller.dart';
import 'package:upm_mii/controllers/user_controller.dart';
import 'package:upm_mii/models/user.dart';
import 'package:upm_mii/models/user_information.dart';
import 'package:upm_mii/pages/profile/landing_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        child: Form(
          key: _formKey,
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
                    TextFormField(
                      controller: _emailController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter an email';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Email is not valid';
                        }
                        return null;
                      },
                      decoration: Style.formStyle(
                          icon: Icons.email_outlined, hintText: 'Email'),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 5),
                    TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      validator: (String? value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Password should be at least 6 chars long!';
                        }
                        return null;
                      },
                      decoration: Style.formStyle(
                          icon: Icons.lock_outline, hintText: 'Password'),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            AuthController auth = AuthController();
                            dynamic user = await auth.login(
                                _emailController.text,
                                _passwordController.text);

                            if (user == null) {
                              print('error login');
                            } else {
                              UserController userController = UserController();
                              var info = await userController
                                  .getUserInformation((user as User).id!);

                              if (info == null) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LandingPage(user: user)));
                              } else {
                                Navigator.pushReplacementNamed(context, 'home',
                                    arguments: {
                                      'user': user,
                                      'info': info,
                                    });
                              }
                            }
                          }
                        },
                        style: Style.buttonStyle(color: AppColor.primary),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton.icon(
                          style: Style.buttonStyle(color: Colors.white),
                          onPressed: () {},
                          icon: const Icon(Ionicons.logo_google),
                          label: const Text(
                            'Continue with Google',
                            style: TextStyle(color: Colors.black),
                          )),
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
                    Navigator.pushReplacementNamed(context, 'signup');
                  },
                  style: Style.buttonStyle(color: Colors.white),
                  child: const Text(
                    'Create an account',
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
      ),
    );
  }
}
