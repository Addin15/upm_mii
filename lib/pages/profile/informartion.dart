import 'package:flutter/material.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/models/user.dart';
import 'package:upm_mii/models/user_information.dart';

class Information extends StatefulWidget {
  const Information({this.user, this.info, Key? key}) : super(key: key);
  final User? user;
  final UserInformation? info;

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView(children: [
        buildTextField("Full Name", widget.info!.name!),
        const SizedBox(height: 10),
        buildTextField("MyKad Number", widget.info!.nric!),
        const SizedBox(height: 10),
        buildTextField("Gender", widget.info!.gender!),
        const SizedBox(height: 10),
        buildTextField("Date of Birth", widget.info!.birth_date!),
        const SizedBox(height: 10),
        buildTextField("Age", widget.info!.age!.toString()),
        const SizedBox(height: 10),
        buildTextField("Phone", widget.info!.phone!),
        const SizedBox(height: 10),
        buildTextField("State", widget.info!.state!),
        const SizedBox(height: 10),
        buildTextField("Address", widget.info!.address!),
        const SizedBox(height: 10),
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
      ]),
    );
  }

  buildTextField(String labelText, String input) {
    TextEditingController text = TextEditingController(text: input);
    return Column(
      children: [
        Text(labelText),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: text,
          decoration: Style.formStyle(),
        ),
      ],
    );
  }
}
