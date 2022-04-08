import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/constants/style.dart';
import 'package:upm_mii/controllers/user_controller.dart';
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
    TextEditingController name = TextEditingController(text: widget.info!.name);
    TextEditingController mykad =
        TextEditingController(text: widget.info!.nric);
    TextEditingController gender =
        TextEditingController(text: widget.info!.gender);
    TextEditingController dob =
        TextEditingController(text: widget.info!.birth_date);
    TextEditingController age =
        TextEditingController(text: widget.info!.age.toString());
    TextEditingController phone =
        TextEditingController(text: widget.info!.phone);
    TextEditingController state =
        TextEditingController(text: widget.info!.state);
    TextEditingController address =
        TextEditingController(text: widget.info!.address);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView(children: [
        TextFormField(
          controller: name,
          decoration: const InputDecoration(
            icon: const Icon(Icons.person),
            hintText: 'Please enter your Fullname',
            labelText: 'Name',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: mykad,
          decoration: const InputDecoration(
            icon: const Icon(Icons.credit_card_outlined),
            hintText: 'Please enter your Mykad',
            labelText: 'Mykad',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: gender,
          decoration: const InputDecoration(
            icon: const Icon(Icons.person_outline),
            hintText: 'Please enter your gender',
            labelText: 'gender',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: dob,
          decoration: const InputDecoration(
            icon: const Icon(Icons.calendar_today_outlined),
            hintText: 'Please enter your DOB',
            labelText: 'Date of Birth',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: age,
          decoration: const InputDecoration(
            icon: const Icon(Icons.assignment_outlined),
            hintText: 'Please enter your age',
            labelText: 'Age',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: phone,
          decoration: const InputDecoration(
            icon: const Icon(Icons.phone),
            hintText: 'Please enter your phone',
            labelText: 'Phone number',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: state,
          decoration: const InputDecoration(
            icon: const Icon(Icons.location_city),
            hintText: 'Please enter your state',
            labelText: 'State',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: address,
          decoration: const InputDecoration(
            icon: const Icon(Icons.location_city_outlined),
            hintText: 'Please enter your address',
            labelText: 'Address',
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              /*async {
                await UserController().createUserInformation(
                    int.parse(widget.info!.id.toString()),
                    UserInformation(
                      id: widget.info!.id,
                      name: name.text,
                      address: address.text,
                      nric: mykad.text,
                      gender: gender.text,
                      age: int.parse(age.toString()),
                      phone: phone.text,
                      birth_date: dob.text,
                      state: state.text,
                    ) as Map<String, dynamic>);
                
              },*/
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
