import 'package:flutter/material.dart';
import 'package:upm_mii/constants/app_color.dart';
import 'package:upm_mii/constants/style.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primary,
        title: Text(
          'My Details',
          style: TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(children: [
          SizedBox(
            height: 10,
          ),
          buildTextField("Full Name", " "),
          const SizedBox(height: 10),
          buildTextField("MyKad Number", " "),
          const SizedBox(height: 10),
          buildTextField("Gender", " "),
          const SizedBox(height: 10),
          buildTextField("Date of Birth", " "),
          const SizedBox(height: 10),
          buildTextField("Age", " "),
          const SizedBox(height: 10),
          buildTextField("Phone", " "),
          const SizedBox(height: 10),
          buildTextField("State", " "),
          const SizedBox(height: 10),
          buildTextField("Address", " "),
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
      ),
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
