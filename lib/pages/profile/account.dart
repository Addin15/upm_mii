import 'package:flutter/material.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/models/user.dart';
import 'package:upm_mii/models/user_information.dart';

class Account extends StatefulWidget {
  const Account({this.user, this.info, Key? key}) : super(key: key);
  final User? user;
  final UserInformation? info;

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextEditingController text = TextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double innerHeight = constraints.maxHeight;
          double innerWidth = constraints.maxWidth;
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: innerWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Center(
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                      ),
                    ),
                    Text(
                      widget.info!.name!,
                      style: TextStyle(
                          color: Color.fromRGBO(39, 105, 171, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        TextFormField(
                          controller: text,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.person_outline),
                            hintText: 'Please enter your username',
                            labelText: 'Username',
                          ),
                        ),
                        TextFormField(
                          controller: text,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.security_outlined),
                            hintText: 'Password',
                            labelText: 'Password',
                          ),
                        ),
                        TextFormField(
                          controller: text,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.security_outlined),
                            hintText: 'Please enter your password',
                            labelText: 'Password',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Save'),
                              style: Style.buttonStyle(),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
