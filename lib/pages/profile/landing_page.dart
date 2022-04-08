import 'package:flutter/material.dart';
import 'package:upm_mii/constants/app_color.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/controllers/user_controller.dart';
import 'package:upm_mii/models/user.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({this.user});

  final User? user;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  TextEditingController name = TextEditingController();
  TextEditingController nric = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController birthdate = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController address = TextEditingController();

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
          buildTextField("Full Name", name),
          const SizedBox(height: 10),
          buildTextField("MyKad Number", nric),
          const SizedBox(height: 10),
          buildTextField("Gender", gender),
          const SizedBox(height: 10),
          buildTextField("Date of Birth", birthdate),
          const SizedBox(height: 10),
          buildTextField("Age", age),
          const SizedBox(height: 10),
          buildTextField("Phone", phone),
          const SizedBox(height: 10),
          buildTextField("State", state),
          const SizedBox(height: 10),
          buildTextField("Address", address),
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
                onPressed: () async {
                  Map<String, dynamic> userInfo = {
                    'user_id': widget.user!.id,
                    'name': name.text,
                    'nric': nric.text,
                    'gender': gender.text,
                    'birth_date': birthdate.text,
                    'age': int.parse(age.text),
                    'phone': phone.text,
                    'state': state.text,
                    'address': address.text,
                  };

                  UserController userController = UserController();
                  var res = await userController.createUserInformation(
                      widget.user!.id!, userInfo);

                  if (res != null) {
                    Navigator.pushReplacementNamed(context, 'home', arguments: {
                      'user': widget.user,
                      'info': res,
                    });
                  }
                },
                child: Text('Save'),
                style: Style.buttonStyle(),
              ),
            ],
          )
        ]),
      ),
    );
  }

  buildTextField(String labelText, TextEditingController controller) {
    return Column(
      children: [
        Text(labelText),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: controller,
          decoration: Style.formStyle(),
        ),
      ],
    );
  }
}
