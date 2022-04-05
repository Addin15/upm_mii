import 'package:flutter/material.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/constants/style.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView(children: [
        buildTextField("Full Name", "Amirah"),
        const SizedBox(height: 10),
        buildTextField("MyKad Identity Number", "000902040116"),
        const SizedBox(height: 10),
        buildTextField("State", "Melaka"),
        const SizedBox(height: 10),
        buildTextField("Date of Birth", "09-02-2000"),
        const SizedBox(height: 10),
        buildTextField(
            "Address", "425-1 KM10, Jalan Melati, Umbai, 75460 Melaka"),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Cancel'),
              style: Style.buttonStyle(),
            ),
            SizedBox(
              width: 10,
            ),
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
        TextField(controller: text, decoration: Style.formStyle()),
      ],
    );
  }
}
